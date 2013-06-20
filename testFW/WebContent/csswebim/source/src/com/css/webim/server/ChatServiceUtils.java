/**
 * 文件名：ChatServiceUtils.java  
 *  
 * 版本信息：  
 * 日期：2012-7-16  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.server;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.cometd.bayeux.server.ServerSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.css.webim.ChatChannel;
import com.css.webim.message.Message;
import com.css.webim.util.Assert;
import com.css.webim.util.ListUtils;

/**
 * <b>功能描述</b> <br>
 * 发送消息的工具类 支持批量发送,分组发送,离线发送，广播消息等..
 * @author YUJB
 * @date 2012-7-16 上午9:48:45
 */
public class ChatServiceUtils {
	
	private static final Logger logger = LoggerFactory
			.getLogger(ChatServiceUtils.class);
	
	/**
	 * 批量发送消息给指定的人
	 * @param chatInfos 
	 * <li>每个{@link com.css.webim.message.Message#getChannel()}必须管道保持一致,管道为都为null时，{@link com.css.webim.ChatChannel#PRIVATE_CHAT}
	 * 作为通信管道 
	 * <li>每个{@link com.css.webim.message.Message#getReceiverIds()} 有且只有相同的唯一元素
	 */
	public static void sendMessageToSpaticOne(Message... chatInfos) {
		
		sendMessageToSpaticOne(false, chatInfos);
		
	}
	
	/**
	 * 批量发送消息给指定的人，按照{@link com.css.webim.message.Message} 的元素分组发送
	 * @param group 必须是chatInfos的成员变量
	 * @param chatInfos 
	 * @see #sendMessageToSpaticOne(Message...)
	 * 
	 */
	public static void sendMessageToSpaticOneByGroup(final String group, Message... chatInfos) {
		
		sendMessageToSpaticOneByGroup(false, group, chatInfos);
	}
	
	
	/**
	 * 批量发送消息给指定的人,忽略离线消息处理，为在线的人将不能收到此消息
	 * @see #sendMessageToSpaticOneByGroup(String, Message...)
	 * @param group
	 * @param chatInfos
	 */
	public static void sendMessageToSpaticOneIgnoreOfflineByGroup(final String group, Message... chatInfos) {
		
		sendMessageToSpaticOneByGroup(true, group, chatInfos);
	}
		
	
	/**
	 * 批量发送消息给指定的人
	 * @param isIgnoreOffline 是否忽略离线
	 * when isIgnoreOffline == true
	 * 效果等同于{{@link #sendMessageToSpaticOneIgnoreOfflineByGroup(String, Message...)}<br>
	 * when isIgnoreOffline == false
	 * 效果等同于{{@link #sendMessageToSpaticOneByGroup(String, Message...)}<br>
	 * @param group   分组发送
	 * @param chatInfos 消息
	 */
	public static void sendMessageToSpaticOneByGroup(boolean isIgnoreOffline,final String group, Message... chatInfos) {
		
		List<List<Message>> split = ListUtils.splitGroupBy(Arrays.asList(chatInfos), group);
		
		for (List<Message> groupMsg : split) {
			sendMessageToSpaticOne(isIgnoreOffline, groupMsg.toArray(new Message[]{}));
		}
		
	}
	
	
	/**
	 * 效果等同于{@link #sendMessageToSpaticOne(Message...)},只是此方法不发送离线
	 * @param chatInfos
	 */
	public static void sendMessageToSpaticOneIgnoreOffline(Message... chatInfos) {
		
		sendMessageToSpaticOne(true, chatInfos);
		
	}
	
	
	/**
	 * @param isIgnoreOffline
	 * @param chatInfos
	 */
	public static void sendMessageToSpaticOne(boolean isIgnoreOffline, Message... chatInfos) {
		
		Assert.collectionOneElement(chatInfos[0].getReceiverIds(), "receiverIds length must be one");
		sendMessageToMany(isIgnoreOffline,chatInfos);
		
	}
	
	/**
	 * check chatInfo data ,process channel is null
	 * @param chatInfos
	 */
	private static void checkSendMessageToMany(Message... chatInfos){
		Assert.notNull(chatInfos, "chatInfos  must bu not null");
		List<String> receiveIdTemp = null;
		String channelTemp = null;
		for (Message chatInfo : chatInfos) {
			if (receiveIdTemp != null) {
				@SuppressWarnings("rawtypes")
				Collection disjunctionCollection = CollectionUtils.disjunction(chatInfo.getReceiverIds(), receiveIdTemp);
				Assert.collectionNullElement(disjunctionCollection, "receiveIds must be equals...");
			}
			String channel = chatInfo.getChannel() == null ? ChatChannel.PRIVATE_CHAT
					: chatInfo.getChannel();
			chatInfo.setChannel(channel);
			if (channelTemp != null) {
				Assert.equals(channelTemp,chatInfo.getChannel(), "batch send message chatInfos receiverId must be equals...");
			}
			channelTemp = chatInfo.getChannel();
			receiveIdTemp = chatInfo.getReceiverIds();
		}
	}
	
	
	/**
	 * @param chatInfos
	 */
	private static void checkBroadcastMessage(Message... chatInfos){
		
		Assert.notNull(chatInfos, "chatInfos  must bu not null");
		String channelTemp = null;
		for (Message chatInfo : chatInfos) {
			String channel = chatInfo.getChannel() == null ? ChatChannel.PRIVATE_CHAT
					: chatInfo.getChannel();
			chatInfo.setChannel(channel);
			Assert.startWith(channel, ChatChannel.META_BROADCAST,
					"广播消息管道必须startwith" + ChatChannel.META_BROADCAST);
			if (channelTemp != null) {
				Assert.equals(channelTemp,chatInfo.getChannel(), "batch send message chatInfos receiverId must be equals...");
			}
			channelTemp = chatInfo.getChannel();
		}
	}
	
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOneByGroup(String, Message...)},可以多人发送 
	 * @param group
	 * @param chatInfos
	 */
	public static void sendMessageToManyByGroup(final String group,Message... chatInfos) {
		
		sendMessageToManyByGroup(false, group, chatInfos);
	}
	
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOneIgnoreOfflineByGroup(String, Message...)},可以多人发送 
	 * @param group
	 * @param chatInfos
	 */
	public static void sendMessageToManyIgnoreOfflineByGroup(final String group,Message... chatInfos) {
		
		sendMessageToManyByGroup(true, group, chatInfos);
	}
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOneByGroup(boolean, String, Message...)},可以多人发送 
	 * @param isIgnoreOffline
	 * @param group
	 * @param chatInfos
	 */
	public static void sendMessageToManyByGroup(boolean isIgnoreOffline,final String group, Message... chatInfos) {
		List<List<Message>> split = ListUtils.splitGroupBy(Arrays.asList(chatInfos), group);
		
		for (List<Message> groupMsg : split) {
			sendMessageToMany(isIgnoreOffline, groupMsg.toArray(new Message[]{}));
		}
	}
	
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOne(Message...)},可以多人发送 
	 * @param chatInfos
	 */
	public static void sendMessageToMany(Message... chatInfos) {
		
		sendMessageToMany(false, chatInfos);
		
	}
	
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOneIgnoreOffline(Message...)},可以多人发送 
	 * @param chatInfos
	 */
	public static void sendMessageToManyIgnoreOffline(Message... chatInfos) {
		
		sendMessageToMany(true, chatInfos);
		
	}
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOne(Message...)},可以多人发送 
	 * @param isIgnoreOffline
	 * @param chatInfos
	 */
	public static void sendMessageToMany(boolean isIgnoreOffline, Message... chatInfos) {
		
		checkSendMessageToMany(chatInfos);
		
		List<String> receiverIds = chatInfos[0].getReceiverIds();
		for (String receiverId : receiverIds) {
			
			List<ServerSession> remoteSessions = IMSystemContext.getServerSessionIfPossible(receiverId);
			
			String channel = chatInfos[0].getChannel();
			
			/*离线发送*/
			if (remoteSessions == null) {
				if (!isIgnoreOffline) {
					sendOfflineMessage(chatInfos);
					loggerOfflineInfo(chatInfos);
				}
				return;
			}
			
			for (ServerSession remoteSession : remoteSessions) {
				/*在线发送*/
				loggerInfo(remoteSession,chatInfos);
				remoteSession.deliver(remoteSession, channel, chatInfos, null);
			}
		}
		
	}
	
	
	/** 
	 * when isIgnoreOffline == true
	 * 效果等于{{@link #broadcastMessageIgnoreOffline(Message...)}<br>
	 * when isIgnoreOffline == false
	 * 效果等于{{@link #broadcastMessage(Message...)}<br>
	 * @param isIgnoreOffline
	 * @param chatInfos
	 */
	public static void broadcastMessage(boolean isIgnoreOffline, Message... chatInfos){
		
		checkBroadcastMessage(chatInfos);
		
		/*在线发送*/
		List<ServerSession> serverSessions = IMSystemContext.getBayeuxServer().getSessions();
		for (ServerSession clientSession : serverSessions) {
			loggerInfo(clientSession,chatInfos);
			clientSession.deliver(clientSession, chatInfos[0].getChannel(), chatInfos, null);
		}
		if (!isIgnoreOffline) {
			/* 离线发送*/
			List<String> unlineUsers = IMSystemContext.getOfflineMessageManager().getAllUnlineUsers();
			for (Message chatInfo : chatInfos) {
				chatInfo.setReceiverIds(unlineUsers);
			}
			sendOfflineMessage(chatInfos);
			loggerOfflineInfo(chatInfos);
		}
		
	}

	
	/**
	 * 广播消息忽略,离线用户发送离线消息
	 * @param chatInfos
	 */
	public static void broadcastMessage(Message... chatInfos){
		
		broadcastMessage(false, chatInfos);
		
	}
	
	
	/**
	 * 广播消息忽略,离线用户接受不到消息 
	 * @param chatInfos
	 */
	public static void broadcastMessageIgnoreOffline(Message... chatInfos){
		
		broadcastMessage(true, chatInfos);
	}
	
	
	/**
	 * 下线通知,通知所有在线用户
	 * @param UUID 下线用户标识
	 */
	public static void broadcastUnLineMessage(String UUID){
		
		List<ServerSession> serverSessions = IMSystemContext.getServerSessionIfPossible(UUID);
		for (ServerSession clientSession : serverSessions) {
			Map<String, String> map  = new HashMap<String, String>();
			map.put("userId", UUID);
			IMSystemContext.getBayeuxServer().getChannel(ChatChannel.PUBLIC_UNLINE)
					.publish(clientSession, map, null);
		}
	}
	
	/**
	 * 上线通知,通知所有在线用户
	 * @param UUID 上线人的标识
	 */
	public static void broadcastOnLineMessage(String UUID) {

		List<ServerSession> serverSessions = IMSystemContext.getServerSessionIfPossible(UUID);
		for (ServerSession clientSession : serverSessions) {

			Map<String, String> map = new HashMap<String, String>();
			map.put("userId", UUID);
			IMSystemContext.getBayeuxServer().getChannel(ChatChannel.PUBLIC_ONLINE)
					.publish(clientSession, map, null);
		}
	}
	
	
	/**
	 * {@link com.css.webim.ChatChannel#SELF_CHAT}管道发送消息<br>
	 * 此方法将忽略 {@link com.css.webim.message.Message#getReceiverIds()}
	 *  {@link com.css.webim.message.Message#getChannel()字段}
	 * @param chatInfo
	 */
	public static void sendMessageToSelf(Message chatInfo){
		
		Assert.notNull(chatInfo.getSenderId(), "senderId not null");
		List<ServerSession> serverSessionsSession = IMSystemContext.getServerSessionIfPossible(chatInfo.getSenderId());
		for (ServerSession clientSession : serverSessionsSession) {
			clientSession.deliver(clientSession, ChatChannel.SELF_CHAT, chatInfo, null);
		}
	}
	
	
	
	/**
	 * 批量发送离线消息
	 * @param chatInfos
	 */
	public static void sendOfflineMessage(Message... chatInfos){
		
		for (Message chatInfo : chatInfos) {
			Assert.notNull(chatInfo.getChannel(),"离线消息管道不能为空");
			IMSystemContext.getOfflineMessageManager().addOfflineMsg(chatInfo);
		}
	}
	
	
	private static void  loggerInfo(ServerSession receiverSession,Message... chatInfos){
		loggerInfo(receiverSession, null, chatInfos);
	}
	
	
	
	private static void  loggerInfo(ServerSession receiverSession,String messageKey,Message... chatInfos){
		if (chatInfos == null || chatInfos.length < 1) {
			return;
		}
		String senderInfo = chatInfos[0].getSenderId();
		String channelInfo = chatInfos[0].getChannel();
		String contentInfo = chatInfos[0].getContent();
		List<String> receiveInfos = chatInfos[0].getMutableReceiverIds();
		if (channelInfo.startsWith(ChatChannel.META_BROADCAST)) {
			receiveInfos.clear();
			receiveInfos.add("all user");
		}
		if (messageKey == null) {
			messageKey = "message";
		}
		String info = senderInfo + " send  " + messageKey + " " + contentInfo
				+ "to " + receiveInfos + " in channel " + channelInfo;
		if (receiverSession != null) {
			String uuid = IMSystemContext.getUUIDByServerSession(receiverSession);
			info += " sending " + uuid + "....";
		}
		logger.info(info);
	}
	
	
	private static void  loggerOfflineInfo(ServerSession receiverSession,Message... chatInfos){
		loggerInfo(receiverSession, "offline message", chatInfos);
	}
	
	private static void  loggerOfflineInfo(Message... chatInfos){
		loggerOfflineInfo(null,chatInfos);
	}
	
	
	
}

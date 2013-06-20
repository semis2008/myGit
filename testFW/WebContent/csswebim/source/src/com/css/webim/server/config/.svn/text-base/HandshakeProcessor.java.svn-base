/**
 * 文件名：SecurityProlicy.java  
 *  
 * 版本信息：  
 * 日期：2012-7-13  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */

package com.css.webim.server.config;

import java.util.List;
import java.util.Map;

import org.cometd.bayeux.server.BayeuxContext;
import org.cometd.bayeux.server.BayeuxServer;
import org.cometd.bayeux.server.ServerMessage;
import org.cometd.bayeux.server.ServerSession;
import org.cometd.server.DefaultSecurityPolicy;

import com.css.webim.CustomOffineMsgProcessor;
import com.css.webim.OffineMsgProcessor;
import com.css.webim.message.Message;
import com.css.webim.message.OffineMetaMsg;
import com.css.webim.message.OffineMetaMsg.OneMetaMsg;
import com.css.webim.server.ChatServiceUtils;
import com.css.webim.server.IMSystemContext;
import com.css.webim.integration.CurrentUserProvider;
import com.css.webim.util.ListUtils;

/**
 * <b>功能描述</b> <br>
 * 客户端加入时处理
 * @author YUJB
 * @date 2012-7-13 上午11:14:33
 */
public class HandshakeProcessor extends DefaultSecurityPolicy {

	public HandshakeProcessor() {
		
	}

	public boolean canHandshake(BayeuxServer server, ServerSession session,
			ServerMessage message) {
		
		ServerMessage.Mutable reply = message.getAssociated();
		
		//区分客户端 服务启动握手
		if (message.get("type") == null || !message.get("type").equals("client")) {
			return true;
		}
		
		BayeuxContext context = server.getContext();
		
		String userId = performAuthentication(session, message) == null ? getServerSideUserId(context)
				: performAuthentication(session, message);
		
		if (userId == null) {
			return true;
		}
		
		IMSystemContext.associate(userId, session);
		
		//广播上线通知
		ChatServiceUtils.broadcastOnLineMessage(userId);
		
		//更新离线人员
		IMSystemContext.getOfflineMessageManager().removeOfflineUser(userId);
		
		/*接受登录人离线消息*/
		processOfflineMsg(userId, message);
		
		reply.put("userId", userId);
		
		return true;
	}
	
	
	/**
	 * @param userId
	 * @param message
	 */
	private void processOfflineMsg(String userId, ServerMessage message) {
		List<Message> offineChatInfos = IMSystemContext.getOfflineMessageManager().getOfflineMsgs(userId);
		OffineMetaMsg metaMsg = getMetaMsg(message);
		
		//按照管道分组 
		List<List<Message>> groupChatInfos = ListUtils.splitGroupBy(offineChatInfos, OffineMetaMsg.META_CHANNEL);
		
		//循环管道 没个管道按照不同的策略去接受离线消息
		for (List<Message> oneGroupChatInfos : groupChatInfos) {
			if (oneGroupChatInfos.size() == 0) {
				continue;
			}
			
			String channel = oneGroupChatInfos.get(0).getChannel();
			boolean isProcess = false;
			for (OneMetaMsg oneMetaMsg : metaMsg.getOffline()) {
				if(oneMetaMsg.getChannel().equals(channel)){
					isProcess = true;
					OffineMsgProcessor offineMsgProcessor = oneMetaMsg.getOffineMsgProcessor();
					offineMsgProcessor.processOffineMsg(offineChatInfos, userId);
				}
			}
			if (!isProcess) {
				OffineMsgProcessor offineMsgProcessor = new CustomOffineMsgProcessor();
				offineMsgProcessor.processOffineMsg(offineChatInfos, userId);
			}
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private OffineMetaMsg getMetaMsg(ServerMessage message){
		OffineMetaMsg metaMsg = new OffineMetaMsg();
		
		Object field = message.get("offline");
		Object[] offlines = field instanceof List ? ((List)field).toArray() : (Object[])field;
		if (offlines == null) {
			return metaMsg;
		}
		for (Object object : offlines) {
			OneMetaMsg oneMetaMsg = metaMsg.new OneMetaMsg();
			if (object instanceof Map) {
				oneMetaMsg.setChannel(String.valueOf(((Map)object).get("channel")));
				oneMetaMsg.setReceiveType((Map<String, String>) ((Map)object).get("receiveType"));
			}
			metaMsg.add(oneMetaMsg);
		}
		return metaMsg;
	}
	
	
	private String getServerSideUserId(BayeuxContext context) {
		String userId = null;
		String userProvierClazz = IMSystemContext
				.getIfPossible(CurrentUserProvider.ATTRIBUTE);
		try {
			Class<?> provierClass = Class.forName(userProvierClazz);
			CurrentUserProvider newInstance = (CurrentUserProvider) provierClass
					.newInstance();
			userId = newInstance.getCurrentUserUUID(context);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return userId;

	}
	
	/**
	 * @param session
	 * @param message
	 * @return
	 */
	private String performAuthentication(ServerSession session,
			ServerMessage message) {
		
		String userId = IMSystemContext.getUUIDByServerSession(session);
		if (userId != null) {
			return userId;
		}
		Object userObj = message.get("userId");
		return userObj == null ? null : (String) userObj;
	}
	
	

}

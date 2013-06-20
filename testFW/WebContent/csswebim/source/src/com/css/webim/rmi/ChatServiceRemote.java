/**
 * 文件名：ChatServiceRemote.java  
 *  
 * 版本信息：  
 * 日期：2012-7-30  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;

import com.css.webim.message.Message;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-30 上午11:00:45
 */
public interface ChatServiceRemote extends Remote{
	
	public  boolean sendMessageToSpaticOne(Message... chatInfos) throws RemoteException;
	
	/**
	 * 批量发送消息给指定的人，按照{@link com.css.webim.message.Message} 的元素分组发送
	 * @param group 必须是chatInfos的成员变量
	 * @param chatInfos 
	 * @see #sendMessageToSpaticOne(Message...)
	 * 
	 */
	public  boolean sendMessageToSpaticOneByGroup(final String group, Message... chatInfos)throws RemoteException;
	
	
	/**
	 * 批量发送消息给指定的人,忽略离线消息处理，为在线的人将不能收到此消息
	 * @see #sendMessageToSpaticOneByGroup(String, Message...)
	 * @param group
	 * @param chatInfos
	 */
	public  boolean sendMessageToSpaticOneIgnoreOfflineByGroup(final String group, Message... chatInfos)throws RemoteException;
		
	
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
	public  boolean sendMessageToSpaticOneByGroup(boolean isIgnoreOffline,final String group, Message... chatInfos)throws RemoteException; 
	
	
	/**
	 * 效果等同于{@link #sendMessageToSpaticOne(Message...)},只是此方法不发送离线
	 * @param chatInfos
	 */
	public  boolean sendMessageToSpaticOneIgnoreOffline(Message... chatInfos)throws RemoteException;
	
	/**
	 * @param isIgnoreOffline
	 * @param chatInfos
	 */
	public  boolean sendMessageToSpaticOne(boolean isIgnoreOffline, Message... chatInfos)throws RemoteException;
	
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOneByGroup(String, Message...)},可以多人发送 
	 * @param group
	 * @param chatInfos
	 */
	public  boolean sendMessageToManyByGroup(final String group,Message... chatInfos)throws RemoteException;
	/**
	 * 效果等同{@link #sendMessageToSpaticOneIgnoreOfflineByGroup(String, Message...)},可以多人发送 
	 * @param group
	 * @param chatInfos
	 */
	public  boolean sendMessageToManyIgnoreOfflineByGroup(final String group,Message... chatInfos)throws RemoteException;
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOneByGroup(boolean, String, Message...)},可以多人发送 
	 * @param isIgnoreOffline
	 * @param group
	 * @param chatInfos
	 */
	public  boolean sendMessageToManyByGroup(boolean isIgnoreOffline,final String group, Message... chatInfos)throws RemoteException;
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOne(Message...)},可以多人发送 
	 * @param chatInfos
	 */
	public  boolean sendMessageToMany(Message... chatInfos)throws RemoteException;
	
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOneIgnoreOffline(Message...)},可以多人发送 
	 * @param chatInfos
	 */
	public  boolean sendMessageToManyIgnoreOffline(Message... chatInfos)throws RemoteException;
	
	/**
	 * 效果等同{@link #sendMessageToSpaticOne(Message...)},可以多人发送 
	 * @param isIgnoreOffline
	 * @param chatInfos
	 */
	public  boolean sendMessageToMany(boolean isIgnoreOffline, Message... chatInfos)throws RemoteException;
	/** 
	 * when isIgnoreOffline == true
	 * 效果等于{{@link #broadcastMessageIgnoreOffline(Message...)}<br>
	 * when isIgnoreOffline == false
	 * 效果等于{{@link #broadcastMessage(Message...)}<br>
	 * @param isIgnoreOffline
	 * @param chatInfos
	 */
	public  boolean broadcastMessage(boolean isIgnoreOffline, Message... chatInfos)throws RemoteException;
	
	/**
	 * 广播消息忽略,离线用户发送离线消息
	 * @param chatInfos
	 */
	public  boolean broadcastMessage(Message... chatInfos)throws RemoteException;
	
	
	/**
	 * 广播消息忽略,离线用户接受不到消息 
	 * @param chatInfos
	 */
	public  boolean broadcastMessageIgnoreOffline(Message... chatInfos)throws RemoteException;
	
	
	/**
	 * 下线通知,通知所有在线用户
	 * @param UUID 下线用户标识
	 */
	public  boolean broadcastUnLineMessage(String UUID)throws RemoteException;
	
	/**
	 * 上线通知,通知所有在线用户
	 * @param UUID 上线人的标识
	 */
	public  boolean broadcastOnLineMessage(String UUID)throws RemoteException;
	
	/**
	 * {@link com.css.webim.ChatChannel#SELF_CHAT}管道发送消息<br>
	 * 此方法将忽略 {@link com.css.webim.message.Message#getReceiverIds()}
	 *  {@link com.css.webim.message.Message#getChannel()字段}
	 * @param chatInfo
	 */
	public  boolean sendMessageToSelf(Message chatInfo)throws RemoteException;
	
	
	
	/**
	 * 批量发送离线消息
	 * @param chatInfos
	 */
	public  boolean sendOfflineMessage(Message... chatInfos)throws RemoteException;
	
}

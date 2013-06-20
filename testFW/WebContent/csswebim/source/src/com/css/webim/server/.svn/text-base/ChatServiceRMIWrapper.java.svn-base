/**
 * 文件名：ChatServiceUtilsRMIWarp.java  
 *  
 * 版本信息：  
 * 日期：2012-7-30  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.server;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

import com.css.webim.message.Message;
import com.css.webim.rmi.ChatServiceRemote;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-30 上午10:54:36
 */
public class ChatServiceRMIWrapper extends UnicastRemoteObject implements ChatServiceRemote{

	/**
	 * @throws RemoteException
	 */
	protected ChatServiceRMIWrapper() throws RemoteException {
		super();
	}

	/**   */
	private static final long serialVersionUID = 1L;

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToSpaticOne(com.css.webim.message.Message[])*/
	public boolean sendMessageToSpaticOne(Message... chatInfos) {
		ChatServiceUtils.sendMessageToSpaticOne(chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToSpaticOneByGroup(java.lang.String, com.css.webim.message.Message[])*/
	public boolean sendMessageToSpaticOneByGroup(String group,
			Message... chatInfos) {
		ChatServiceUtils.sendMessageToSpaticOneByGroup(group, chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToSpaticOneIgnoreOfflineByGroup(java.lang.String, com.css.webim.message.Message[])*/
	public boolean sendMessageToSpaticOneIgnoreOfflineByGroup(String group,
			Message... chatInfos) {
		ChatServiceUtils.sendMessageToSpaticOneIgnoreOfflineByGroup(group,
				chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToSpaticOneByGroup(boolean, java.lang.String, com.css.webim.message.Message[])*/
	public boolean sendMessageToSpaticOneByGroup(boolean isIgnoreOffline,
			String group, Message... chatInfos) {
		ChatServiceUtils.sendMessageToSpaticOneByGroup(isIgnoreOffline, group, chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToSpaticOneIgnoreOffline(com.css.webim.message.Message[])*/
	public boolean sendMessageToSpaticOneIgnoreOffline(Message... chatInfos) {
		ChatServiceUtils.sendMessageToSpaticOneIgnoreOffline(chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToSpaticOne(boolean, com.css.webim.message.Message[])*/
	public boolean sendMessageToSpaticOne(boolean isIgnoreOffline,
			Message... chatInfos) {
		ChatServiceUtils.sendMessageToSpaticOne(isIgnoreOffline,chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToManyByGroup(java.lang.String, com.css.webim.message.Message[])*/
	public boolean sendMessageToManyByGroup(String group, Message... chatInfos) {
		ChatServiceUtils.sendMessageToManyByGroup(group, chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToManyIgnoreOfflineByGroup(java.lang.String, com.css.webim.message.Message[])*/
	public boolean sendMessageToManyIgnoreOfflineByGroup(String group,
			Message... chatInfos) {
		ChatServiceUtils.sendMessageToManyByGroup(group, chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToManyByGroup(boolean, java.lang.String, com.css.webim.message.Message[])*/
	public boolean sendMessageToManyByGroup(boolean isIgnoreOffline, String group,
			Message... chatInfos) {
		ChatServiceUtils.sendMessageToManyByGroup(isIgnoreOffline, group, chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToMany(com.css.webim.message.Message[])*/
	public boolean sendMessageToMany(Message... chatInfos) {
		ChatServiceUtils.sendMessageToMany(chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToManyIgnoreOffline(com.css.webim.message.Message[])*/
	public boolean sendMessageToManyIgnoreOffline(Message... chatInfos) {
		ChatServiceUtils.sendMessageToManyIgnoreOffline(chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToMany(boolean, com.css.webim.message.Message[])*/
	public boolean sendMessageToMany(boolean isIgnoreOffline, Message... chatInfos) {
		ChatServiceUtils.sendMessageToMany(isIgnoreOffline, chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#broadcastMessage(boolean, com.css.webim.message.Message[])*/
	public boolean broadcastMessage(boolean isIgnoreOffline, Message... chatInfos) {
		ChatServiceUtils.broadcastMessage(isIgnoreOffline,chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#broadcastMessage(com.css.webim.message.Message[])*/
	public boolean broadcastMessage(Message... chatInfos) {
		ChatServiceUtils.broadcastMessage(chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#broadcastMessageIgnoreOffline(com.css.webim.message.Message[])*/
	public boolean broadcastMessageIgnoreOffline(Message... chatInfos) {
		ChatServiceUtils.broadcastMessageIgnoreOffline(chatInfos);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#broadcastUnLineMessage(java.lang.String)*/
	public boolean broadcastUnLineMessage(String UUID) {
		ChatServiceUtils.broadcastUnLineMessage(UUID);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#broadcastOnLineMessage(java.lang.String)*/
	public boolean broadcastOnLineMessage(String UUID) {
		ChatServiceUtils.broadcastOnLineMessage(UUID);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendMessageToSelf(com.css.webim.message.Message)*/
	public boolean sendMessageToSelf(Message chatInfo) {
		ChatServiceUtils.sendMessageToSelf(chatInfo);
		return true;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.rmi.ChatServiceRemote#sendOfflineMessage(com.css.webim.message.Message[])*/
	public boolean sendOfflineMessage(Message... chatInfos) {
		ChatServiceUtils.sendOfflineMessage(chatInfos);
		return true;
	}
	
	
}

/**
 * 文件名：CustomBatchOffineMsgProcessor.java  
 *  
 * 版本信息：  
 * 日期：2012-7-26  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import com.css.webim.message.Message;
import com.css.webim.server.ChatServiceUtils;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-26 下午1:48:15
 */
public class CustomOffineMsgProcessor implements OffineMsgProcessor{

	/* (non-Javadoc)
	 * @see com.css.webim.server.OffineMsgProcessor#processOffineMsg(java.util.List, java.lang.String)*/
	public void processOffineMsg(List<Message> offineChatInfos, String userId) {
		Iterator<Message> iterator = offineChatInfos.iterator();
		while (iterator.hasNext()) {
			Message chatInfo = iterator.next();
			Message cloneMsg = chatInfo.deepClone();
			cloneMsg.setReceiverIds(Arrays.asList(userId));
			if (cloneMsg.getChannel() != null
					&& cloneMsg.getChannel().startsWith(ChatChannel.META_BROADCAST)) {
				ChatServiceUtils.broadcastMessageIgnoreOffline(cloneMsg);
			} else {
				ChatServiceUtils.sendMessageToSpaticOneIgnoreOffline(cloneMsg);
			}
			chatInfo.getMutableReceiverIds().remove(userId);
			if (chatInfo.getReceiverIds().size() == 0) {
				iterator.remove();
			}
		}
		
	}

}

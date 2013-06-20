/**
 * 文件名：BatchOffineMsgProcessor.java  
 *  
 * 版本信息：  
 * 日期：2012-7-26  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import com.css.webim.message.Message;
import com.css.webim.server.ChatServiceUtils;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-26 下午1:25:45
 */
public class BatchOffineMsgProcessor implements OffineMsgProcessor{
	
	private String groupBy;

	public String getGroupBy() {
		return groupBy;
	}

	public void setGroupBy(String groupBy) {
		this.groupBy = groupBy;
	}
	
	
	public BatchOffineMsgProcessor() {
		super();
	}

	
	public BatchOffineMsgProcessor(String groupBy) {
		super();
		this.groupBy = groupBy;
	}

	/* (non-Javadoc)
	 * @see com.css.webim.server.OffineMsgProcessor#processOffineMsg(com.css.webim.server.List, java.lang.String)*/
	public void processOffineMsg(List<Message> offineChatInfos, String userId) {
		
		List<Message> tempMsg = new ArrayList<Message>();
		Iterator<Message> iterator = offineChatInfos.iterator();
		while (iterator.hasNext()) {
			Message chatInfo = iterator.next();
			Message msg = chatInfo.deepClone();
			chatInfo.getMutableReceiverIds().remove(userId);
			if (chatInfo.getReceiverIds().size() == 0) {
				iterator.remove();
			}
			msg.setReceiverIds(Arrays.asList(userId));
			tempMsg.add(msg);
		}
		if (groupBy != null) {
			ChatServiceUtils.sendMessageToSpaticOneByGroup(groupBy, tempMsg.toArray(new Message[]{}));
		}else {
			ChatServiceUtils.sendMessageToSpaticOne(tempMsg.toArray(new Message[]{}));
		}
		
	}
	
	
	
	
}

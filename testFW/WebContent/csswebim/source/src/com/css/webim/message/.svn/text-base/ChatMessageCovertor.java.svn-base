/**
 * 文件名：ChatInfoCovertor.java  
 *  
 * 版本信息：  
 * 日期：2012-7-13  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.message;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.eclipse.jetty.util.ajax.JSON;
import org.eclipse.jetty.util.ajax.JSON.Output;


/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-13 下午1:45:19
 */
public class ChatMessageCovertor implements JSON.Convertor{
	

	/* (non-Javadoc)
	 * @see org.eclipse.jetty.util.ajax.JSON.Convertor#toJSON(java.lang.Object, org.eclipse.jetty.util.ajax.JSON.Output)*/
	public void toJSON(Object obj, Output output) {
		if(obj instanceof ChatMessage){
			ChatMessage chatInfo = (ChatMessage)obj;
			output.add("senderId", chatInfo.getSenderId());
			output.add("content",chatInfo.getContent());
			output.add("simpleContent",chatInfo.getSimpleContent());
			Date sendDate = chatInfo.getSendDate();
			SimpleDateFormat asf = new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss ");
			output.add("sendDate",asf.format(sendDate));
			
		}
		
	}

	/* (non-Javadoc)
	 * @see org.eclipse.jetty.util.ajax.JSON.Convertor#fromJSON(java.util.Map)*/
	public Object fromJSON(@SuppressWarnings("rawtypes") Map map) {
		
		ChatMessage chatInfo = new ChatMessage();
		chatInfo.setContent(String.valueOf(map.get("content")));
		chatInfo.setSendDate(new Date());
		chatInfo.setSenderId(String.valueOf(map.get("senderId")));

		List<String> retList = new ArrayList<String>();
		
		Object object = map.get("receiverIds");
		if (object != null && object.getClass().isArray()){
			Object[] objects = (Object[])object;
			for (Object obj : objects) {
				if (obj instanceof Object) {
					retList.add(String.valueOf(obj));
				}
			}
			chatInfo.setReceiverIds(retList);
		}
		
		return chatInfo;
	}

}

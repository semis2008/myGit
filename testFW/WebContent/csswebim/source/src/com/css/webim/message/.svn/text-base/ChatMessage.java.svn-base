/**
 * 文件名：ChatInfo.java  
 *  
 * 版本信息：  
 * 日期：2012-7-13  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.message;



/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-13 下午1:43:17
 */
public class ChatMessage extends Message{
	
	
	/**   */
	private static final long serialVersionUID = 1L;

	private RoomInfo roomInfo;
	
	private String simpleContent;
	
	private String eventType; 
	
	
	
	public String getEventType() {
		return eventType;
	}

	
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	
	/* (non-Javadoc)
	 * @see com.css.webim.message.Message#setContent(java.lang.String)*/
	@Override
	public void setContent(String content) {
		super.setContent(content);
		int lastIndex = content.lastIndexOf("<");
		int firstIndex = content.indexOf(">");
		if (lastIndex !=-1 && firstIndex !=-1) {
			setSimpleContent(content.substring(firstIndex +1, lastIndex));
		}
	}
	
	
	public void setContentIgnoreSimpleContent(String content) {
		super.setContent(content);
	}
	
	

	public RoomInfo getRoomInfo() {
		return roomInfo;
	}



	public void setRoomInfo(RoomInfo roomInfo) {
		this.roomInfo = roomInfo;
	}



	public String getSimpleContent() {
		return simpleContent;
	}

	public void setSimpleContent(String simpleContent) {
		this.simpleContent = simpleContent;
	}

	
	
	
	
}

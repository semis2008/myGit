/**
 * 文件名：Message.java  
 *  
 * 版本信息：  
 * 日期：2012-7-18  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.message;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * <b>功能描述</b> <br>
 * IM message info,custom message must be extends this
 * @author YUJB
 * @date 2012-7-18 下午4:28:36
 */
public class Message implements Serializable{
	
	/**   */
	private static final long serialVersionUID = 1L;

	/** 消息内容  */
	private String content;
	
	/** 发送者ID  */
	private String senderId;
	
	/** 接受者IDS  */
	private List<String> receiverIds = new ArrayList<String>();
	
	/** 发送时间  */
	private Date sendDate = new Date();
	
	/** 管道  */
	private String channel;
	
	public Message deepClone() {
		Message msg = null;
        try {
			ByteArrayOutputStream bo = new ByteArrayOutputStream();  
			ObjectOutputStream oo = new ObjectOutputStream(bo);  
			oo.writeObject(this);  
			ByteArrayInputStream bi = new ByteArrayInputStream(bo.toByteArray());  
			ObjectInputStream bis = new ObjectInputStream(bi);  
			msg = (Message) bis.readObject();
		} catch (Exception e) {
			// no touch
		} 
        return msg;
    }  
	
	
	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	
	public List<String> getReceiverIds() {
		return Collections.unmodifiableList(receiverIds);
	}
	
	public List<String> getMutableReceiverIds() {
		return receiverIds;
	}

	public void setReceiverIds(List<String> receiverIds) {
		this.receiverIds.clear();
		this.receiverIds.addAll(receiverIds);
	}

	public void removeReceiver(String revceiver){
		receiverIds.remove(revceiver);
	}
	
	public List<String> addReceiver(String revceiver){
		receiverIds.add(revceiver);
		return receiverIds;
	}
	
	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	
	
	
	
}

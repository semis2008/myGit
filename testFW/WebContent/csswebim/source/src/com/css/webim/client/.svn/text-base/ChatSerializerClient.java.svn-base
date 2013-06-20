/**
 * 文件名：FooSerializer.java  
 *  
 * 版本信息：  
 * 日期：2012-7-20  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.client;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

import com.css.webim.message.ChatMessage;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-20 上午9:19:19
 */
public class ChatSerializerClient extends JsonSerializer<ChatMessage> {

	/* (non-Javadoc)
	 * @see org.codehaus.jackson.map.JsonSerializer#serialize(java.lang.Object, org.codehaus.jackson.JsonGenerator, org.codehaus.jackson.map.SerializerProvider)*/
	@Override
	public void serialize(ChatMessage chatMsg, JsonGenerator jgen,
			SerializerProvider arg2) throws IOException,
			JsonProcessingException {
		jgen.writeStartObject();
		jgen.writeStringField("senderId", chatMsg.getSenderId());
		jgen.writeStringField("content", chatMsg.getContent());
		jgen.writeArrayFieldStart("receiverIds");
		List<String> receiverIds = chatMsg.getReceiverIds();
		for (String receiver : receiverIds) {
			jgen.writeString(receiver);
		}
		jgen.writeEndArray();
		jgen.writeStringField("class", "com.css.webim.message.ChatMessage");
		jgen.writeEndObject();
		
	}

}

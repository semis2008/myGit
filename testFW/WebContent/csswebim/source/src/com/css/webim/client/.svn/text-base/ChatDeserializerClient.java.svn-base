/**
 * 文件名：FooDeserializer.java  
 *  
 * 版本信息：  
 * 日期：2012-7-20  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.client;

import java.io.IOException;

import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.JsonDeserializer;

import com.css.webim.message.ChatMessage;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-20 上午9:26:11
 */
public class ChatDeserializerClient extends JsonDeserializer<ChatMessage> {

	/* (non-Javadoc)
	 * @see org.codehaus.jackson.map.JsonDeserializer#deserialize(org.codehaus.jackson.JsonParser, org.codehaus.jackson.map.DeserializationContext)*/
	@Override
	public ChatMessage deserialize(JsonParser jsonparser,
			DeserializationContext deserializationcontext) throws IOException,
			JsonProcessingException {
		System.out.println(jsonparser);
		return null;
	}

}

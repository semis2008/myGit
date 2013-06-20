/**
 * 文件名：ChatJacksonJSONContextClient.java  
 *  
 * 版本信息：  
 * 日期：2012-7-20  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */

package com.css.webim.client;

import org.codehaus.jackson.Version;
import org.cometd.common.JacksonJSONContextClient;

import com.css.webim.message.ChatMessage;

/**
 * <b>功能描述</b> <br>
 * 
 * @author YUJB
 * @date 2012-7-20 上午9:16:26
 */
public class ChatJacksonJSONContextClient extends JacksonJSONContextClient {

	public ChatJacksonJSONContextClient() {
		org.codehaus.jackson.map.ObjectMapper objectMapper = getObjectMapper();
		objectMapper.registerModule(new ChatModule("ChatModule", Version
				.unknownVersion()));
	}

	private class ChatModule extends org.codehaus.jackson.map.module.SimpleModule {

		public ChatModule(String name, Version version) {
			super(name, version);
			addSerializer(ChatMessage.class, new ChatSerializerClient());
			addDeserializer(ChatMessage.class, new ChatDeserializerClient());
		}

	}
}

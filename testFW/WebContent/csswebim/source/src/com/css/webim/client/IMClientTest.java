/**
 * 文件名：IMClientTest.java  
 *  
 * 版本信息：  
 * 日期：2012-7-19  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.client;

import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cometd.bayeux.Message;
import org.cometd.bayeux.client.ClientSessionChannel;
import org.junit.Test;

import com.css.webim.ChatChannel;
import com.css.webim.message.ChatMessage;
import com.css.webim.message.OffineMetaMsg;
import com.css.webim.message.OffineMetaMsg.OneMetaMsg;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-19 上午11:26:16
 */
public class IMClientTest {
	
	@Test
	public void ClientTest() throws Exception{
		
		OffineMetaMsg msg = new OffineMetaMsg();
		OneMetaMsg oneMsg = msg.new OneMetaMsg();
		oneMsg.setChannel("/private/chat");
		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("class", "com.css.webim.BatchOffineMsgProcessor");
		map1.put("group", "senderId");
	
		oneMsg.setReceiveType(map1);
		msg.add(oneMsg);
		
		IMClientFactory client1 = new IMClientFactory("zhangsan",new OffineMetaMsg());
		IMClient client = client1.getClient();
		
		
		client.getChannel(ChatChannel.PRIVATE_CHAT).addListener(new ClientSessionChannel.MessageListener() {
			
			public void onMessage(ClientSessionChannel channel, Message message) {
				if (!message.isSuccessful()) {
					Object field = message.getData();
					Object[] offlines = field instanceof List ? ((List)field).toArray() : (Object[])field;
					Map<String, Object> map = (Map<String, Object>) offlines[0];
					System.out.println(map.get("content"));
					System.out.println(map.get("simpleContent"));
					
				}
				
			}
		});
		
		client.handshake();
		
		ChatMessage chatMessage = new ChatMessage();
		chatMessage.setReceiverIds(Arrays.asList("lisi"));
		chatMessage.setContentIgnoreSimpleContent("aaaaaaa");
		chatMessage.setSenderId("zhangsan");
		chatMessage.setSendDate(new Date());
		
		client.getChannel(ChatChannel.PRIVATE_CHAT).publish(chatMessage);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", "zhangsan");
		client.getChannel(ChatChannel.PUBLIC_ONLINE).publish(map);
		
		Thread.sleep(60000);
		
	}
}

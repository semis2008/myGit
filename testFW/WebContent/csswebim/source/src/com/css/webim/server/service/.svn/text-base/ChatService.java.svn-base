/**
 * 文件名：ChatService.java  
 *  
 * 版本信息：  
 * 日期：2012-7-10  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.server.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.cometd.bayeux.server.BayeuxServer;
import org.cometd.bayeux.server.ConfigurableServerChannel;
import org.cometd.bayeux.server.ServerMessage;
import org.cometd.bayeux.server.ServerSession;
import org.cometd.java.annotation.Configure;
import org.cometd.java.annotation.Listener;
import org.cometd.java.annotation.Service;
import org.cometd.server.JettyJSONContextServer;

import com.css.webim.ChatChannel;
import com.css.webim.message.ChatMessage;
import com.css.webim.message.ChatMessageCovertor;
import com.css.webim.server.ChatServiceUtils;
import com.css.webim.server.IMSystemContext;
import com.css.webim.server.config.HandshakeProcessor;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-10 下午2:11:22
 */
@Service("chat")
public class ChatService{
	
	@Inject
	private BayeuxServer bayeuxServer;
	
	
	public ChatService() {
		super();
	}
	
	
	@PostConstruct
	public void  postConstruct(){
		bayeuxServer.setSecurityPolicy(new HandshakeProcessor());
		JettyJSONContextServer jsonContext = (JettyJSONContextServer)bayeuxServer.getOption("jsonContext");
		jsonContext.getJSON().addConvertor(ChatMessage.class, new ChatMessageCovertor());
	}
	
	@Configure({ChatChannel.PRIVATE_CHAT})
    public void setupPrivateChannel(ConfigurableServerChannel channel)
    {
		channel.setPersistent(true);
    }
	
	@Configure({ChatChannel.PUBLIC_CHAT})
    public void setupPublicChannel(ConfigurableServerChannel channel)
    {
		channel.setPersistent(true);
    }
	
	@Configure({ChatChannel.PUBLIC_ONLINE})
    public void setupOnlineChannel(ConfigurableServerChannel channel)
    {
		channel.setPersistent(true);
    }
	
	@Configure({ChatChannel.PUBLIC_UNLINE})
    public void setupUnlineChannel(ConfigurableServerChannel channel)
    {
		channel.setPersistent(true);
    }
	
	
	@Listener({ChatChannel.PUBLIC_CHAT})
	protected void pubicChat(ServerSession client,ServerMessage.Mutable message){
		
		Map<String, Object> dataMap = message.getDataAsMap();
		String fromUser = (String)dataMap.get("fromUser");
        String content = (String)dataMap.get("content");
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("fromUser", fromUser);
        data.put("content", content);
        client.deliver(client, message.getChannel(), data, null);
	}
	
	
	@Listener({ChatChannel.PUBLIC_ONLINE})
	protected void pubicOnline(ServerSession client,ServerMessage.Mutable message){
		
		Map<String, Object> dataMap = message.getDataAsMap();
		String userId = (String)dataMap.get("userId");
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("userId", userId);
        client.deliver(client, message.getChannel(), data, null);
	}
	
	
	@Listener({ChatChannel.PRIVATE_CHAT})
	protected void privateChat(ServerSession client,ServerMessage message){
		
		ChatMessage chatInfo = (ChatMessage)message.getData();
		
        ChatServiceUtils.sendMessageToSpaticOne(chatInfo);
        
	}
	
	
	@Listener({ChatChannel.SELF_CHAT})
	protected void selfChat(ServerSession client,ServerMessage message){
		
        Map<String, Object> data = new HashMap<String, Object>();
        
        Collection<String> onlineUUIDs = IMSystemContext.getOnlineUUIDs();
        
        data.put("onlineUsers", onlineUUIDs);
        
        client.deliver(client, message.getChannel(), data, null);
        
	}
	
	
	
}

/**
 * 文件名：Monitor.java  
 *  
 * 版本信息：  
 * 日期：2012-7-10  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.server.service;

import org.cometd.bayeux.Channel;
import org.cometd.bayeux.server.ServerMessage;
import org.cometd.bayeux.server.ServerSession;
import org.cometd.java.annotation.Listener;
import org.cometd.java.annotation.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.css.webim.server.IMSystemContext;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-10 下午5:24:45
 */
@Service("monitor")
public  class MonitorService {
	
	private  final Logger logger = LoggerFactory
			.getLogger(MonitorService.class);
	
	@Listener({ "/meta/subscribe" })
	public void monitorSubscribe(ServerSession session,
			ServerMessage message) {
		String uuid = IMSystemContext.getUUIDByServerSession(session);
		logger.info("Monitored Subscribe from " + uuid
				+ " for " + message.get("subscription"));
	}

	@Listener({ Channel.META_HANDSHAKE })
	public void monitorHanshake(ServerSession session,
			ServerMessage.Mutable message) {
		String uuid = String.valueOf(message.get("userId"));
		logger.info("Monitored handshake from " + uuid);
	}
	
	@Listener({ "/meta/unsubscribe" })
	public void monitorUnsubscribe(ServerSession session,
			ServerMessage message) {
		String uuid = IMSystemContext.getUUIDByServerSession(session);
		logger.info("Monitored Unsubscribe from " + uuid
				+ " for " + message.get("subscription"));
	}
	
	
	@Listener({ Channel.META_DISCONNECT})
	public void monitorDisConnect(ServerSession session,
			ServerMessage message) {
		String uuid = IMSystemContext.getUUIDByServerSession(session);
		logger.info("Monitored META_DISCONNECT from " + uuid);
	}
	
	@Listener({ "/meta/" })
	public void monitorMeta(ServerSession session, ServerMessage message) {
		logger.debug(message.toString());
	}
	
}

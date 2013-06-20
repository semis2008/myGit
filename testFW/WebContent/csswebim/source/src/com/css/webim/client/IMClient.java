/**
 * 文件名：IMClientSession.java  
 *  
 * 版本信息：  
 * 日期：2012-8-6  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.client;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ScheduledExecutorService;

import org.cometd.client.BayeuxClient;
import org.cometd.client.transport.ClientTransport;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-8-6 上午10:03:58
 */
public class IMClient extends BayeuxClient{
	
	private Map<String, Object> options = new HashMap<String, Object>();
	
	/**
	 * @param url
	 * @param transport
	 * @param transports
	 */
	IMClient(Map<String, Object> options,String url, ClientTransport transport,
			ClientTransport... transports) {
		super(url, transport, transports);
		if (options!= null) {
			this.options.putAll(options);
		}
	}

	IMClient(Map<String, Object> options,String url, ScheduledExecutorService scheduler,
			ClientTransport transport, ClientTransport... transports) {
		super(url, scheduler, transport, transports);
		if (options!= null) {
			this.options.putAll(options);
		}
	}

	@Override
	public void handshake() {
		super.handshake(options);
		boolean handshaken = this.waitFor(3000, BayeuxClient.State.CONNECTED);
		if (!handshaken) {
			throw new RuntimeException("连接服务器失败!");
		}
	}

	@Override
	public void handshake(Map<String, Object> handshakeFields) {
		throw new RuntimeException("not support....");
	}

	@Override
	public State handshake(long waitMs) {
		State state = super.handshake(options, waitMs);
		boolean handshaken = this.waitFor(3000, BayeuxClient.State.CONNECTED);
		if (!handshaken) {
			throw new RuntimeException("连接服务器失败!");
		}
		return state;
	}

	@Override
	public State handshake(Map<String, Object> template, long waitMs) {
		throw new RuntimeException("not support....");
	}
	
	
	
	
	

}

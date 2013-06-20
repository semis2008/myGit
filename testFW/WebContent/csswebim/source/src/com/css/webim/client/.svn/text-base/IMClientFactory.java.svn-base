/**
 * 文件名：IMClient.java  
 *  
 * 版本信息：  
 * 日期：2012-7-19  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */

package com.css.webim.client;

import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.cometd.client.transport.ClientTransport;
import org.cometd.client.transport.LongPollingTransport;
import org.cometd.common.JSONContext;
import org.eclipse.jetty.client.HttpClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.css.webim.message.OffineMetaMsg;
import com.css.webim.util.Assert;

/**
 * <b>功能描述</b> <br>
 * 
 * @author YUJB
 * @date 2012-7-19 上午11:08:58
 */
public class IMClientFactory {

	private static final Logger logger = LoggerFactory
			.getLogger(IMClientFactory.class);
	

	private IMClient client;

	
	private org.codehaus.jackson.map.ObjectMapper objectMapper = new ObjectMapper();
	
	
	
	/**
	 * @param UUID 客户端用户标识
	 * @param msg  离线消息元数据,处理离线消息的具体策略
	 * @throws Exception 如果连接远程服务器失败
	 */
	public IMClientFactory(String UUID, OffineMetaMsg msg) throws Exception {
		
		//初始化客户端session
		initClientSession(UUID, msg);
	}
	
	/**
	 * 选用默认离线消息的具体策略<br>
	 * 每个管道都接受离线消息，离线消息不采用批量处理方式
	 * @param UUID
	 * @throws Exception
	 * @see {@link #initClientSession(String, OffineMetaMsg)}
	 */
	public IMClientFactory(String UUID) throws Exception {
		
		initClientSession(UUID, new OffineMetaMsg());
	}

	/**
	 * @throws Exception
	 * 
	 */
	private void initClientSession(String UUID,OffineMetaMsg msg) throws Exception {
		HttpClient httpClient = new HttpClient();
		httpClient.start();

		Map<String, Object> options = new HashMap<String, Object>();
		JSONContext.Client jsonContext = new ChatJacksonJSONContextClient();
		options.put(ClientTransport.JSON_CONTEXT, jsonContext);
		ClientTransport transport = LongPollingTransport.create(options,
				httpClient);

		String url = ClientConfigMgr.getInstance().getIfPossible(ClientConfigMgr.META_SERVER_URL);
		Assert.notNull(url, ClientConfigMgr.META_SERVER_URL + " must be not null");

		Map<String, Object> option = new HashMap<String, Object>();
		
		option.put("userId", UUID);
		option.put("type", "client");
		@SuppressWarnings("unchecked")
		Map<String,Object> props = objectMapper.convertValue(msg, Map.class);
		props.putAll(props);
		option.put(OffineMetaMsg.META_OFFLINE, msg.getMutableOffline());
		IMClient client = new IMClient(option, url, transport);
		
		client.setOption(
				IMClient.BACKOFF_INCREMENT_OPTION,
				ClientConfigMgr.getInstance().getIfPossible(
						IMClient.BACKOFF_INCREMENT_OPTION, "1000"));
		client.setOption(IMClient.MAX_BACKOFF_OPTION, 60000L);
		initClient(client);
		
		setClient(client);
		
		logger.info("create IMClient success...");

	}
	
	private  void initClient(IMClient client){
		client.setOption(
				IMClient.BACKOFF_INCREMENT_OPTION,Long.valueOf(
				ClientConfigMgr.getInstance().getIfPossible(
						IMClient.BACKOFF_INCREMENT_OPTION, "1000")));
		client.setOption(
				IMClient.MAX_BACKOFF_OPTION,Long.valueOf(
				ClientConfigMgr.getInstance().getIfPossible(
						IMClient.MAX_BACKOFF_OPTION, "6000")));
	}


	/**
	 * @return the client
	 */
	public IMClient getClient() {
		return client;
	}

	
	public void setClient(IMClient client) {
		this.client = client;
	}

	
}

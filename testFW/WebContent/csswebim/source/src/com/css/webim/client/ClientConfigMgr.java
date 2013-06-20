/**
 * 文件名：ClientConfigMgr.java  
 *  
 * 版本信息：  
 * 日期：2012-8-6  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.client;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * <b>功能描述</b> <br>
 * 
 * @author YUJB
 * @date 2012-8-6 上午10:45:20
 */
public class ClientConfigMgr {
	
	private static final Logger logger = LoggerFactory
			.getLogger(ClientConfigMgr.class);
	
	private static ClientConfigMgr configMgr = new ClientConfigMgr();
	
	private static final String CLIENT_CONFIG_FILE_NAME = "config/webIMClient.properties";
	
	private Properties properties;
	
	/** config serverUrl meta key   */
	public static final String META_SERVER_URL = "servletUrl";
	
	private ClientConfigMgr(){
		//初始化客户端配置
		initClientConfig();
	}
	
	public static ClientConfigMgr getInstance(){
		return configMgr;
	}
	
	/**
	 * 
	 */
	private void initClientConfig() {
		File file = new File(CLIENT_CONFIG_FILE_NAME);
		try {
			InputStream resourceAsStream = new FileInputStream(file);
			properties = new Properties();
			properties.load(resourceAsStream);
		} catch (IOException e) {
			logger.error(e.getMessage());
			throw new RuntimeException("解析配置文件错误", e);
		}
	}
	
	/**
	 * 得到配置信息
	 * @param key 信息关键字
	 * @param defaultValue 如果返回值为空时的缺省值
	 * @return 
	 */
	public String getIfPossible(String key, String defaultValue) {

		Object valueObj = properties.get(key);
		if (valueObj == null) {
			return defaultValue;
		} else {
			return (String) valueObj;
		}

	}
	

	/**
	 * 得到配置信息
	 * @param key
	 * @return if not null return 
	 */
	public String getIfPossible(String key) {

		return getIfPossible(key, null);

	}

	public void init(Properties properties) {
		this.properties = properties;
	}
	
	
}

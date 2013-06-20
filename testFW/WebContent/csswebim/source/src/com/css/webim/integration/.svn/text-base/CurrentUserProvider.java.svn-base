/**
 * 文件名：CurrentUser.java  
 *  
 * 版本信息：  
 * 日期：2012-7-13  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.integration;

import org.cometd.bayeux.server.BayeuxContext;

/**
 * <b>功能描述</b> <br>
 * 当前登录用户后端提供者
 *  if(client post userId to server )
 *  else 
 *    invoke this
 * @author YUJB
 * @date 2012-7-13 下午2:23:19
 */
public interface CurrentUserProvider {
	
	public static final String ATTRIBUTE = "currentUser";
	
	public String getCurrentUserUUID(BayeuxContext context);
}

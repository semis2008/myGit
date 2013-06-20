/**
 * 文件名：MyCurrentUser.java  
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
 *
 * @author YUJB
 * @date 2012-7-13 下午2:45:13
 */
public class MyCurrentUser implements CurrentUserProvider{


	/* (non-Javadoc)
	 * @see com.css.webim.server.integration.CurrentUserProvider#getCurrentUserUUID(org.cometd.bayeux.server.BayeuxContext)*/
	public String getCurrentUserUUID(BayeuxContext context) {
		// TODO Auto-generated method stub
		return "1";
	}

}

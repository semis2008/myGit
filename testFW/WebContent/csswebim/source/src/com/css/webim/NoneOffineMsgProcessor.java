/**
 * 文件名：NoneOffineMsgProcessor.java  
 *  
 * 版本信息：  
 * 日期：2012-7-27  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim;

import java.util.List;

import com.css.webim.message.Message;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-27 上午10:02:21
 */
public class NoneOffineMsgProcessor implements OffineMsgProcessor{

	/* (non-Javadoc)
	 * @see com.css.webim.OffineMsgProcessor#processOffineMsg(java.util.List, java.lang.String)*/
	public void processOffineMsg(List<Message> offineChatInfos, String userId) {
		
		//do nothing.....
		
	}

}

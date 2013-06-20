/**
 * 文件名：OffineMsgProcessor.java  
 *  
 * 版本信息：  
 * 日期：2012-7-26  
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
 * @date 2012-7-26 下午1:24:01
 */
public interface OffineMsgProcessor {
	
	public void processOffineMsg(List<Message> offineChatInfos,String userId);
}

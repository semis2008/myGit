/**
 * 文件名：Controler.java  
 *  
 * 版本信息：  
 * 日期：2012-7-16  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-16 下午4:41:41
 */
public interface Controller {
	
	public void doService(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException;
}

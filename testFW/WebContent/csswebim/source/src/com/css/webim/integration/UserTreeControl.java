/**
 * 文件名：UserTreeServlet.java  
 *  
 * 版本信息：  
 * 日期：2012-7-16  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */

package com.css.webim.integration;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.css.webim.Controller;
import com.css.webim.server.IMSystemContext;
import com.css.webim.util.Assert;

/**
 * <b>功能描述</b> <br>
 * 
 * @author YUJB
 * @date 2012-7-16 下午4:40:29
 */
public class UserTreeControl implements Controller {
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.css.webim.integration.Controller#doService(javax.servlet.http.
	 * HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	public void doService(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String provier = IMSystemContext.getIfPossible(IMSystemContext.META_TREE_PROVIER);
		Assert.notNull(provier, "IM 人员树不能为空");

		TreeProvider provider = null;
		try {
			Object instanceObj = Class.forName(provier).newInstance();
			provider = (TreeProvider) instanceObj;
		} catch (Exception e) {
			
			
			throw new ServletException(e);
		}
		
		List<UserTreeNode> treeData = provider.getTreeData();
		
		resp.setHeader("Cache-Control", "no-cache");  
		resp.setContentType("text/json;charset=UTF-8");  
		
		PrintWriter writer = resp.getWriter();
		
		writer.append(String.valueOf(new JSONConvert().covert(treeData)));
		
		writer.flush();
		
		writer.close();
		
	}
	
	

}

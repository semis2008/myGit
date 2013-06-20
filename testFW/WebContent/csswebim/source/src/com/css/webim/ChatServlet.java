/**
 * 文件名：ChatServlet.java  
 *  
 * 版本信息：  
 * 日期：2012-7-16  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.css.webim.util.Assert;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-16 下午4:06:23
 */
public class ChatServlet extends HttpServlet{
	

	/**   */
	private static final long serialVersionUID = 1L;
	
	private static final String ATTRIBUTE = "services";
	
	private static final String METHOD = "method";
	
	private static Map<String, String>  registerServices =  Collections.synchronizedMap(new HashMap<String, String>());
	

	@Override
	public void init(ServletConfig config) throws ServletException {
		String serviceStr = config.getInitParameter(ATTRIBUTE);
		if (serviceStr != null) {
			String[] services = serviceStr.split(",");
			for (String service : services) {
				int lastIndexOf = service.lastIndexOf(".");
				String key = service.substring(lastIndexOf + 1, service.length());
				registerServices.put(key, service);
			}
			
		}
		super.init(config);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String methodKey = req.getParameter(METHOD);
		String methodStr = registerServices.get(methodKey);
		Assert.notNull(methodStr, methodKey + "没有注册!");

		Object method = null;
		try {
			method = Class.forName(methodStr).newInstance();
			if (!(method instanceof Controller)) {
				throw new IllegalStateException(methodStr
						+ "要实现com.css.webim.integration.Controller接口");
			}
			Method doService = method.getClass().getMethod("doService", HttpServletRequest.class,HttpServletResponse.class);
			doService.invoke(method, req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}

package com.testFW.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.testFW.service.UserService;

@Component
public class UserServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(UserServlet.class);
	
	private UserService userService;
	public void setUserService(UserService service) {
		this.userService = service;
	}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");  
		String fun = (String) req.getParameter("fun");
		if("regist".equals(fun)) {
			 registUser(req,resp);
		}
	}
	
	//
	private boolean registUser (HttpServletRequest req, HttpServletResponse resp) {
		return false;
	}
	
}
	
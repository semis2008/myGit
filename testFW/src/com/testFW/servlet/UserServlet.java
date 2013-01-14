package com.testFW.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.testFW.service.UserService;

/**
 * 用户相关处理类
 * 
 * @author Kalor
 * @time 2012-12-14
 */
@Component
public class UserServlet extends HttpServlet {
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
		if ("regist".equals(fun)) {
			registUser(req, resp);
		}
		if ("login".equals(fun)) {
			registUser(req, resp);
		}
		if ("findpass".equals(fun)) {
			registUser(req, resp);
		}
	}

	/**
	 * 用户注册
	 * @param req
	 * @param resp
	 * @return
	 * @throws IOException 
	 */
	private void registUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String invitationcode = req.getParameter("invitationcode");
		String msg = "";
		/*
		 * 验证邀请码是否有效
		 */
		boolean code_result = userService.verifyCode(invitationcode);
		if(!code_result) {
			msg = "邀请码无效！";
			out.print(msg);
			out.flush();
			out.close();
			return;
		}
		
		/*
		 * 注册
		 */
		boolean regist_result = userService.regist(email,name,pass);
		if(regist_result) {
			msg = "success";
		}else {
			msg = "系统正在维护~";
		}
		
		out.print(msg);
		out.flush();
		out.close();
	}

}

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
import com.testFW.util.StringUtil;

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
			userRegist(req, resp);
		}
		if ("login".equals(fun)) {
			userLogin(req, resp);
		}
		if ("findpass".equals(fun)) {
			userRegist(req, resp);
		}
	}

	/**
	 * 用户注册
	 * @param req
	 * @param resp
	 * @return
	 * @throws IOException 
	 */
	private void userRegist(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String invitationcode = req.getParameter("invitationcode");
		String msg = "";
		/*
		 * 验证邮箱是否已经被注册 
		 */
		boolean email_result = userService.verifyEmail(email);
		if(email_result) {
			msg = "email_error";
			out.print(msg);
			out.flush();
			out.close();
			return;
		}
		
		/*
		 * 验证邀请码是否有效
		 */
		boolean code_result = userService.verifyCode(invitationcode);
		if(!code_result) {
			msg = "code_error";
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
			msg = "system_error";
		}
		
		out.print(msg);
		out.flush();
		out.close();
	}
	
	/**
	 * 用户登录
	 * @param req
	 * @param resp
	 * @return
	 * @throws IOException 
	 */
	private void userLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		String msg = "";
		/*
		 * 验证邮箱是否存在 
		 */
		boolean email_result = userService.verifyEmail(email);
		if(!email_result) {
			msg = "email_error";
			out.print(msg);
			out.flush();
			out.close();
			return;
		}
		
		/*
		 * 登录
		 */
		pass = StringUtil.passEncrypt(pass);
		msg = userService.userLogin(req, resp);

		out.print(msg);
		out.flush();
		out.close();
	}
}

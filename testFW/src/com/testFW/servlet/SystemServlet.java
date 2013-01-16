package com.testFW.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.testFW.bo.UserBO;
import com.testFW.service.UserService;
import com.testFW.util.UserUtil;

/**
 * 系统响应处理类
 * 
 * @author Kalor
 * @time 2012-12-14
 * 
 */
@Component
public class SystemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(SystemServlet.class);
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
		String targetpath = "";
		if ("error".equals(fun)) {
			targetpath = "/jsp/error.jsp";
		}else if ("404error".equals(fun)) {
			targetpath = "/jsp/error404.jsp";
		}else if ("exception".equals(fun)) {
			targetpath = "/jsp/exception.jsp";
		}else if ("mainpage".equals(fun)) {
			targetpath = showMainPage(req, resp);
		}else if ("diary".equals(fun)) {
			targetpath = showDiary(req, resp);
		}else if ("picture".equals(fun)) {
			targetpath = showPicture(req, resp); 
		}else if ("aboutus".equals(fun)) {
			targetpath = "/jsp/aboutPage.jsp";
		}else if ("search".equals(fun)) {
			String s = (String) req.getParameter("s");
			if("".equals(s)) {
				targetpath = "/jsp/mainPage.jsp";
			}else {
				targetpath = "/jsp/resultPage.jsp";
			}
		}
		
		UserBO user = UserUtil.getLoginUser(req, resp);
		req.setAttribute("fun", fun);
		req.setAttribute("loginUser", user);
		RequestDispatcher rd = req.getRequestDispatcher(targetpath);
		rd.forward(req, resp);
	}
	
	/**
	 * 主页业务处理
	 * @param req
	 * @param resp
	 */
	private String showMainPage(HttpServletRequest req, HttpServletResponse resp) {
		String param = req.getParameter("p1");
		UserBO user = new UserBO();
		/*
		 * 默认访问kalor的主页
		 */
		if(param==null) {
			param = "1";
		}
		//查询访问用户信息，返回前台
		user = userService.getUserByID(param);
		//将被访问的用户信息放入session
		UserUtil.addVisitedUserSession(req, user);
		req.setAttribute("visitedUser", user);
		return "/jsp/mainPage.jsp";
	}
	
	/**
	 * 日志业务处理
	 * @param req
	 * @param resp
	 */
	private String showDiary(HttpServletRequest req, HttpServletResponse resp) {
		String param = req.getParameter("p1");
		if(param==null) {
			return "/jsp/diaryPage.jsp";
		}else{
			return "/jsp/diaryDetail.jsp";
		}
	}
	
	/**
	 * 图册业务处理
	 * @param req
	 * @param resp
	 */
	private String showPicture(HttpServletRequest req, HttpServletResponse resp) {
		String param = req.getParameter("p1");
		if(param==null) {
			return "/jsp/picturePage.jsp";
		}else{
			return "/jsp/pictureDetail.jsp";
		}
	}
	
	
}

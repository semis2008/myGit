package com.testFW.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

/**
 * 系统响应处理
 * @author Kalor
 * @time 2012-12-14
 *
 */
@Component
public class SystemServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(SystemServlet.class);
	
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
		if("error".equals(fun)) {
		      targetpath = "/jsp/error.jsp";
		}
		if("404error".equals(fun)) {
		      targetpath = "/jsp/error404.jsp";
		}
		if("exception".equals(fun)) {
		      targetpath = "/jsp/exception.jsp";
		}
		RequestDispatcher rd = req.getRequestDispatcher(targetpath);
		rd.forward(req, resp);
	}
}
	
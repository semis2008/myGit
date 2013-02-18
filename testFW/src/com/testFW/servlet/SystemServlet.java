package com.testFW.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.codehaus.xfire.transport.Session;
import org.springframework.stereotype.Component;

import com.testFW.bo.DiaryBO;
import com.testFW.bo.LeaveMsgBO;
import com.testFW.bo.UserBO;
import com.testFW.bo.UserInfoBO;
import com.testFW.service.DiaryService;
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
	private DiaryService diaryService;
	
	public void setDiaryService(DiaryService diaryService) {
		this.diaryService = diaryService;
	}
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
		}else if ("diarydetail".equals(fun)) {
			targetpath = showDiaryDetail(req, resp);
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
		//查询访问用户基本信息，返回前台
		user = userService.getUserByID(param);
		//将被访问的用户信息放入session
		UserUtil.addVisitedUserSession(req, user);
		//查询访问用户详细信息，返回前台
		UserInfoBO info = userService.getUserInfoByID(param);
		//获取用户的最新日志信息
		//FIXME 最新图册信息需要在开发完图册模块之后再开发
		List<DiaryBO> newDiaryList = diaryService.getNewDiaryList(req,resp);
		//获取给该用户的留言 
		List<LeaveMsgBO> leaveMsgList = userService.getLeaveMsgList(req,resp); 
		
		req.setAttribute("leaveMsgList", leaveMsgList);
		req.setAttribute("newDiaryList", newDiaryList);
		req.setAttribute("visitedUser", user);
		req.setAttribute("visitedUserInfo", info);
		return "/jsp/mainPage.jsp";
	}
	
	/**
	 * 日志业务处理
	 * @param req
	 * @param resp
	 */
	private String showDiary(HttpServletRequest req, HttpServletResponse resp) {
		/*
		 * 首次访问设置访问用户 
		 */
		UserBO visitUser = UserUtil.getVisitedUser(req, resp);
		if(visitUser == null) {
			visitUser = userService.getUserByID("1");
		}
		req.getSession().setAttribute("visitedUser", visitUser);
		/*
		 * 参数是页数，获取日志列表
		 */
		List<DiaryBO> diaries = diaryService.getDiaryList(req,resp);
		req.setAttribute("diaries", diaries);
		return "/jsp/diaryPage.jsp";
	}
	/**
	 * 日志详情业务处理
	 * @param req
	 * @param resp
	 */
	private String showDiaryDetail(HttpServletRequest req, HttpServletResponse resp) {
		String param = req.getParameter("p1");
		/*
		 * 参数是日志id,获取日志详情信息
		 */
		//获取日志主要内容
		DiaryBO diary = diaryService.getDiaryByID(param);
		//TODO 获取日志回复信息
		
		req.setAttribute("diary", diary);
		return "/jsp/diaryDetail.jsp";
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

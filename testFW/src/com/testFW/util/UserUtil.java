package com.testFW.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.testFW.bo.UserBO;

/**
 * 用户工具类--session相关
 * @author kalor
 * @time 2013-1-15 at 下午03:39:13
 */
public class UserUtil {
	/**
	 * 检查用户是否登陆
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public static boolean checkLogin(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserBO user = (UserBO) session.getAttribute("loginUser");
		if (user != null && !"".equals(user.getEmail())) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 添加用户session信息
	 * @param request
	 * @param bo
	 * @return
	 */
	public static boolean addUserSession(HttpServletRequest request,UserBO bo) {
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", bo);
		return true;
	}
	 
	/**
	 * 用户登录状态下获取用户对象,通过session
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	public static UserBO getUser(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserBO user = (UserBO) session.getAttribute("loginUser");
		return user;
	}

	/**
	 * 用户手动退出
	 * 
	 * @param request
	 * @param response
	 */
	public static void quit(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserBO user = (UserBO) session.getAttribute("loginUser");
		if (user != null && !"".equals(user.getEmail())) {
			session.removeAttribute("loginUser");
		}
	}
}

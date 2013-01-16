package com.testFW.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testFW.bo.InvitationCodeBO;
import com.testFW.bo.UserBO;
import com.testFW.dao.UserDao;
import com.testFW.service.UserService;
import com.testFW.util.DateUtil;
import com.testFW.util.StringUtil;
import com.testFW.util.UserUtil;

/**
 * 用户业务处理接口实现类
 * @author Kalor
 * @time 2012-12-17
 */
public class UserServiceImpl implements UserService{
	private UserDao userDao;
	public void setUserDao(UserDao dao) {
		this.userDao = dao;
	}
	@Override
	public boolean verifyCode(String code) {
		InvitationCodeBO codeBO = userDao.queryInvitationCode(code);
		if(codeBO!=null&&codeBO.getState()==0) {
			/*
			 * 除了万能邀请码lovegaozhuqing之外，其余邀请码一律置状态为不可用
			 */
			if(!"lovegaozhuqing".equals(codeBO.getCode())){
				userDao.updateInvitationCodeState(codeBO);
			}
			
			return true;
		}else {
			return false;
		}
	}
	@Override
	public boolean regist(String email, String name, String pass) {
		pass = StringUtil.passEncrypt(pass);
		int result = userDao.insertUser(email,name,pass);
		if(result>0){
			return true;	
		} else{
			return false;
		}
		
	}
	@Override
	public boolean verifyEmail(String email) {
		UserBO bo = userDao.queryUserByEmail(email);
		if(bo!=null&&bo.getId()>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public String userLogin(HttpServletRequest req, HttpServletResponse resp) {
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		pass = StringUtil.passEncrypt(pass);
		UserBO bo = userDao.queryUser(email,pass);
		if(bo!=null&&bo.getId()>0) {
			//更新登录日期
			int time_result = userDao.updateLoginTime(email);
			if(time_result<1) {
				return "system_error";
			}else {
				//更新session
				UserUtil.addLoginUserSession(req, bo);
				return "success";
			}
		}else {
			return "pass_error";
		}
	}
	@Override
	public UserBO getUserByID(String id) {
		return userDao.queryUserByID(id);
	}
	@Override
	public String leaveMsg(HttpServletRequest req, HttpServletResponse resp) {
		String result = "";
		UserBO visitedUser = UserUtil.getVisitedUser(req, resp);
		String type = req.getParameter("type");
		String msg = req.getParameter("msg");
		String email = "";
		String name = "";
		if("login".equals(type)) {
			UserBO loginUser = UserUtil.getLoginUser(req, resp);
			email = loginUser.getEmail();
			name = loginUser.getName();
		}else if("logout".equals(type)) {
			email = req.getParameter("email");
			name = req.getParameter("name");
		}else {
			result = "system_error";
			return result;
		}
		int num = userDao.insertLeaveMsg(email,name,msg,type,visitedUser.getId());
		if(num<1) {
			result = "system_error";
		}else {
			result = "success";
		}
		return result;
	}
	
}

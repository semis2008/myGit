package com.testFW.service.impl;

import com.testFW.bo.InvitationCodeBO;
import com.testFW.dao.UserDao;
import com.testFW.service.UserService;

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
		int result = userDao.insertUser(email,name,pass);
		if(result>0){
			return true;	
		} else{
			return false;
		}
		
	}
	
}

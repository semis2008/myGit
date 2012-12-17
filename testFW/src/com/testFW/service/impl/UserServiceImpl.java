package com.testFW.service.impl;

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
	
}

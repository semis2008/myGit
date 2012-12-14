package com.testFW.service.impl;

import com.testFW.dao.UserDao;
import com.testFW.service.UserService;

public class UserServiceImpl implements UserService{
	private UserDao userDao;
	public void setUserDao(UserDao dao) {
		this.userDao = dao;
	}
	
}

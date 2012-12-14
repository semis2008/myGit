package com.testFW.dao.impl;

import com.testFW.dao.UserDao;
import com.testFW.dao.template.DbUtilsTemplate;

public class UserDaoImpl implements UserDao{
	private DbUtilsTemplate dbUtilsTemplate; 
	public void setDbUtilsTemplate(DbUtilsTemplate dbUtilsTemplate) { 
	   this.dbUtilsTemplate = dbUtilsTemplate; 
	} 
}

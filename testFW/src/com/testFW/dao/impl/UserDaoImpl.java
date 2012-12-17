package com.testFW.dao.impl;

import com.testFW.dao.UserDao;
import com.testFW.dao.template.DbUtilsTemplate;

/**
 * 用户数据操作接口实现类
 * @author Kalor
 * @time 2012-12-17
 */
public class UserDaoImpl implements UserDao{
	private DbUtilsTemplate dbUtilsTemplate; 
	public void setDbUtilsTemplate(DbUtilsTemplate dbUtilsTemplate) { 
	   this.dbUtilsTemplate = dbUtilsTemplate; 
	} 
	
	
	
	
}

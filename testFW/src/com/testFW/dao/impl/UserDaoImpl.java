package com.testFW.dao.impl;

import com.testFW.bo.InvitationCodeBO;
import com.testFW.dao.UserDao;
import com.testFW.dao.template.DbUtilsTemplate;
import com.testFW.util.StringUtil;

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
	@Override
	public InvitationCodeBO queryInvitationCode(String code) {
		String sql = "select * from invitationcode invit where invit.code = ?";
		return dbUtilsTemplate.findFirst(InvitationCodeBO.class, sql, code);
	}
	@Override
	public int updateInvitationCodeState(InvitationCodeBO bo) {
		String sql = "update invitationcode invit set invit.state = '1' where invit.id = ?";
		return dbUtilsTemplate.update(sql, bo.getId());
	}
	@Override
	public int insertUser(String email, String name, String pass) {
		String sql = "insert into user (email,name,password) values (?,?,?)";
		pass = StringUtil.passEncrypt(pass);
		Object[] param = {email,name,pass};
		return dbUtilsTemplate.update(sql,param);
	} 
	
	
	
	
}

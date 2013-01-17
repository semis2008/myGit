package com.testFW.dao.impl;

import com.testFW.bo.InvitationCodeBO;
import com.testFW.bo.UserBO;
import com.testFW.bo.UserInfoBO;
import com.testFW.dao.UserDao;
import com.testFW.dao.template.DbUtilsTemplate;
import com.testFW.util.StringUtil;

/**
 * 用户数据操作接口实现类
 * 
 * @author Kalor
 * @time 2012-12-17
 */
public class UserDaoImpl implements UserDao {
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
		Object[] param = { email, name, pass };
		return dbUtilsTemplate.update(sql, param);
	}

	@Override
	public UserBO queryUserByEmail(String email) {
		String sql = "select * from user where email = ?";
		return dbUtilsTemplate.findFirst(UserBO.class, sql, email);
	}

	@Override
	public UserBO queryUser(String email, String pass) {
		String sql = "select * from user where email = ? and password = ?";
		Object[] param = { email, pass };
		return dbUtilsTemplate.findFirst(UserBO.class, sql, param);
	}

	@Override
	public int updateLoginTime(String email) {
		String sql = "update user set logon_time = now() where email = ?";
		return dbUtilsTemplate.update(sql, email);
	}

	@Override
	public UserBO queryUserByID(String id) {
		String sql = "select * from user where id = ?";
		return dbUtilsTemplate.findFirst(UserBO.class, sql, id);
	}

	@Override
	public int insertLeaveMsg(String email, String name, String msg,
			String type, Long id) {
		String sql = "insert into leavemsg (email,name,msg,leave_time,visited_user_id,type) values (?,?,?,now(),?,?)";
		Object[] param = { email, name, msg, id, type };
		return dbUtilsTemplate.update(sql, param);
	}

	@Override
	public UserInfoBO queryUserInfoByUserID(Long userId) {
		String sql = "select * from user_info info where info.user_id = ?";
		return dbUtilsTemplate.findFirst(UserInfoBO.class, sql, userId);
	}

	@Override
	public int updateUserInfo(Long user_id, String rel_name, String gender,
			String homeProvince, String birthday, String hobby,
			String contactStr, String publicStr) {
		String sql = "update user_info set rel_name = ?,gender = ?,birthday = ?,home_province = ?,hobby = ?,contact = ?,public_info = ? where user_id = ?";
		Object[] param = { rel_name, gender, birthday, homeProvince, hobby,
				contactStr, publicStr, user_id };
		return dbUtilsTemplate.update(sql, param);
	}

	@Override
	public int updateUserName(String name, Long userid) {
		String sql = "update user set name = ? where id = ?";
		Object[] param = { name, userid };
		return dbUtilsTemplate.update(sql, param);
	}

	@Override
	public int insertUserInfo(Long user_id, String rel_name, String gender,
			String homeProvince, String birthday, String hobby,
			String contactStr, String publicStr) {
		String sql = "insert into user_info (user_id,rel_name,gender,birthday,home_province,hobby,contact,public_info) values (?,?,?,?,?,?,?,?)";
		Object[] param = { user_id, rel_name, gender, birthday, homeProvince,
				hobby, contactStr, publicStr };
		return dbUtilsTemplate.update(sql, param);
	}
}

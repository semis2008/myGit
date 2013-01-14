package com.testFW.dao;

import com.testFW.bo.InvitationCodeBO;

/**
 * 用户数据处理接口
 * @author Kalor
 * @time 2012-12-17
 */
public interface UserDao {
	/**
	 * 依据邀请码code查询邀请码
	 * @param code
	 * @return 查询结果
	 */
	InvitationCodeBO queryInvitationCode(String code);
	
	/**
	 * 更新邀请码的状态为不可用
	 * @param bo 邀请码实体
	 * @return 影响的行数
	 */
	int updateInvitationCodeState(InvitationCodeBO bo);
	
	/**
	 * 新增用户
	 * @param email 注册邮箱
	 * @param name 昵称
	 * @param pass 密码
	 * @return
	 */
	int insertUser(String email,String name,String pass);
}

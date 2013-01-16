package com.testFW.dao;

import com.testFW.bo.InvitationCodeBO;
import com.testFW.bo.UserBO;

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
	 * @return 受影响行数
	 */
	int insertUser(String email,String name,String pass);
	
	/**
	 * 依据注册邮箱查询用户
	 * @param email 注册邮箱
	 * @return 用户实体类
	 */
	UserBO queryUserByEmail(String email); 
	
	/**
	 * 依据邮箱和密码查询用户
	 * @param email 注册邮箱
	 * @param pass 密码
	 * @return 用户实体类
	 */
	UserBO queryUser(String email, String pass);
	
	/**
	 * 更新用户最近登陆时间
	 * @param email 注册邮箱
	 * @return 受影响的行数
	 */ 
	int updateLoginTime(String email);
	
	/**
	 * 依据用户id查询用户信息
	 * @param id 用户id
	 * @return 用户实体类
	 */
	UserBO queryUserByID(String id);
	
	/**
	 * 新增留言信息
	 * @param email 留言者邮箱
	 * @param name 留言者昵称
	 * @param msg 留言内容
	 * @param type 留言类型
	 * @param id 被访问者id
	 * @return
	 */
	int insertLeaveMsg(String email,String name,String msg,String type,Long id);
}

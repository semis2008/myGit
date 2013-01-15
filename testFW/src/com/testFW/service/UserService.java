package com.testFW.service;

/**
 * 用户业务处理接口
 * @author Kalor
 * @time 2012-12-17
 */
public interface UserService {
	/**
	 * 验证邀请码是否有效，除了万能邀请码之外，其余邀请码验证之后置状态为不可用
	 * @param code 邀请码
	 * @return 验证结果
	 */
	boolean verifyCode(String code);
	
	/**
	 * 注册
	 * @param email 注册邮箱
	 * @param pass 密码
	 * @return 注册结果
	 */
	boolean regist(String email,String name,String pass);
	
	/**
	 * 验证邮箱是否被注册
	 * @param email
	 * @return
	 */
	boolean verifyEmail(String email);
	
}

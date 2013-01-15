package com.testFW.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testFW.bo.UserBO;

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
	 * 验证邮箱是否存在
	 * @param email
	 * @return 邮箱存在，返回true;邮箱不存在，返回false
	 */
	boolean verifyEmail(String email);
	
	/**
	 * 用户登录。验证帐号密码、更新登录信息（login_time和session）
	 * @param email 注册邮箱
	 * @param pass 密码
	 * @return 密码错误，返回pass_error;登录失败，返回system_error;登录成功，返回success
	 */
	String userLogin(HttpServletRequest req, HttpServletResponse resp);
	
	/**
	 * 依据用户id查询用户信息
	 * @param id 用户id
	 * @return 用户实体类
	 */
	UserBO getUserByID(String id);
}

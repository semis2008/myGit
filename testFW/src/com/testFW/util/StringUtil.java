package com.testFW.util;

/**
 * String对象操作的辅助类
 * 
 * @author kalor
 * @time 2012-12-17
 */
public class StringUtil {
	/**
	 * 对用户密码进行加密
	 * 
	 * @param password
	 * @return
	 */
	public static String passEncrypt(String password) {
		String temp = EncryptUtil.Encrypt(password, null);
		password = temp + ConstantsUtil.SALT;
		return EncryptUtil.Encrypt(password, null);
	}

	/**
	 * 截取指定长度的字符串，多余部分用...代替
	 * @param ss
	 * @param length
	 * @return
	 */
	public static String cutString(String ss, int length) {
		if (ss.length() < length) {
			return ss;
		} else {
			return ss.substring(0, length) + "...";
		}
	}
}

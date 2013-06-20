/**
 * 文件名：Assert.java  
 *  
 * 版本信息：  
 * 日期：2012-1-5  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */
package com.css.webim.util;

import java.util.Collection;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @since 2012-1-5 上午11:09:54
 */
public class Assert {
	
	private static final Logger logger = LoggerFactory
			.getLogger(Assert.class);
	
	
	public static void notNull(Object object, String message) {
		if (object == null) {
			logger.error(message);
			throw new IllegalArgumentException(message);
		}
	}
	
	
	public static void startWith(String object, String prefix,String message) {
		if (object == null || !object.startsWith(prefix)) {
			logger.error(message);
			throw new IllegalArgumentException(message);
		}
	}
	
	public static void notStartWith(String object, String prefix,String message) {
		if (object == null || object.startsWith(prefix)) {
			logger.error(message);
			throw new IllegalArgumentException(message);
		}
	}
	
	
	public static void collectionOneElement(Collection<?> collection, String message){
		if (collection == null || collection.size() != 1) {
			logger.error(message);
			throw new IllegalArgumentException(message);
		}
	} 
	
	public static void listOneElement(String[] strList, String message){
		if (strList == null || strList.length != 1) {
			logger.error(message);
			throw new IllegalArgumentException(message);
		}
	}
	
	public static void collectionMultiElement(String[] strList, String message){
		if (strList == null || strList.length <= 1) {
			logger.error(message);
			throw new IllegalArgumentException(message);
		}
	}
	
	public static void collectionNullElement(String[] strList, String message){
		if (strList != null && strList.length != 0) {
			logger.error(message);
			throw new IllegalArgumentException(message);
		}
	}
	
	
	public static void collectionNullElement(Collection<?> collection, String message){
		if (collection != null && !collection.isEmpty()) {
			logger.error(message);
			throw new IllegalArgumentException(message);
		}
	}
	
	
	public static void mapContainKey(Map<?, ?> map,Object key,String message){
		if (map == null || !map.containsKey(key)) {
			throw new IllegalArgumentException(message);
		}
	}
	
	
	public static void equals(Object source,Object target,String message){
		if(source == null && target == null){
			return;
		}
		if (!source.equals(target)) {
			throw new IllegalArgumentException(message);
		}
	}
	
	
}

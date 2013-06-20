/**
 * 文件名：Collections.java  
 *  
 * 版本信息：  
 * 日期：2012-7-26  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import com.css.webim.message.ChatMessage;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-26 下午4:51:03
 */
public class ListUtils extends org.apache.commons.collections.ListUtils{
	
	 
	public static <E> List<List<E>> splitGroupBy(List<E> list, GroupComparator<E> comparator){
		
		List<List<E>> retLists = new ArrayList<List<E>>();
		for (E e : list) {
			
			boolean isHasGroup = false;
			for (List<E> groupList : retLists) {
				if(comparator.groupCompare(e, groupList.get(0))){
					groupList.add(e);
					isHasGroup = true;
					break;
				}
			}
			if(!isHasGroup){
				List<E> newGroupList = new ArrayList<E>();
				newGroupList.add(e);
				retLists.add(newGroupList);
			}
			
		}
	
		return retLists;
	}
	
	
	public static <E> List<List<E>> splitGroupBy(List<E> list,final String groupBy){
		
		return ListUtils.splitGroupBy(list, new GroupComparator<E>(){

			public boolean groupCompare(E source, E target) {
				try {
					Field sourceField = getField(source.getClass(),groupBy);
					Field targetField = getField(target.getClass(),groupBy);
					sourceField.setAccessible(true);
					targetField.setAccessible(true);
					
					return sourceField.get(source).equals(targetField.get(target));
				} catch (Exception e) {
					throw new IllegalArgumentException("group must be is E class or sub class ’s field ",e);
				}
			}
			
		});
	}
	
	private static Field getField(Class<? extends Object> clazz,String channel){
		Assert.notNull(clazz, channel + "must be is class or super class's filed");
		Field field = null;
		try {
			field = clazz.getDeclaredField(channel);
		} catch (Exception e) {
			return getField(clazz.getSuperclass(),channel);
		} 
		return field;
	}
	
	
	public static void main(String[] args) {
		Field field = getField(ChatMessage.class, "channel");
		System.out.println(field);
	}
	
	
	
	public interface GroupComparator<E> {
		public boolean groupCompare(E source,E target);
	}
}

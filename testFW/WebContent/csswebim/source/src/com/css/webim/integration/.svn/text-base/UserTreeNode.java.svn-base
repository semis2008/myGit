/**
 * 文件名：UserTreeInfo.java  
 *  
 * 版本信息：  
 * 日期：2012-7-16  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.integration;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-16 下午4:26:50
 */
public class UserTreeNode {
	
	private String UUID;
	
	private String text;
	
	private String classes = "";
	
	private String imgUrl = "";
	
	private boolean expanded = false;
	
	private Map<String, String> data =  new HashMap<String, String>();
	
	private List<UserTreeNode> children =  new ArrayList<UserTreeNode>();

	public String getUUID() {
		return UUID;
	}

	public void setUUID(String uUID) {
		UUID = uUID;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	public boolean isExpanded() {
		return expanded;
	}

	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}

	public Map<String, String> getData() {
		return Collections.unmodifiableMap(data);
	}

	public void setData(Map<String, String> data) {
		this.data = data;
	}
	
	public void putData(String key,String value){
		this.data.put(key, value);
	}
	

	public List<UserTreeNode> getChildren() {
		return Collections.unmodifiableList(children);
	}
	
	
	public List<UserTreeNode> getChildrenForUpdate(){
		return children;
	}

	public void setChildren(List<UserTreeNode> children) {
		this.children = children;
	}
	
	public void addChildren(UserTreeNode... children) {
		if (children.length == 1) {
			this.children.add(children[0]);
		}else {
			this.children.addAll(Arrays.asList(children));
		}
	}
	

	public String getClasses() {
		return classes;
	}

	public void setClasses(String classes) {
		this.classes = classes;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	@Override
	public int hashCode() {
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof UserTreeNode) {
			if(((UserTreeNode) obj).getUUID().equals(getUUID())){
				return true;
			}
		}
		return super.equals(obj);
	}
	
	
	
	
}

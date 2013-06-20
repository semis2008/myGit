/**
 * 文件名：JSONConvert.java  
 *  
 * 版本信息：  
 * 日期：2012-7-17  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.integration;

import java.util.List;

/**
 * <b>功能描述</b> <br>
 * 人员树转类
 * @author YUJB
 * @date 2012-7-17 上午9:56:32
 */
public interface TreeDataConvert {
	
	public  Object covert(List<UserTreeNode> treeData) throws Exception;
	
}

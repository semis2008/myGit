/**
 * 文件名：MyTreeProvider.java  
 *  
 * 版本信息：  
 * 日期：2012-7-17  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.integration;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-17 上午10:02:30
 */
public class MyTreeProvider implements TreeProvider{

	/* (non-Javadoc)
	 * @see com.css.webim.integration.TreeProvider#getTreeData()*/
	public List<UserTreeNode> getTreeData() {
		UserTreeNode  root = new UserTreeNode();
		root.setText("司局");
		root.setUUID("siju");
		
		List<UserTreeNode> leaf = new ArrayList<UserTreeNode>();
		
		UserTreeNode nodeleaf1 = new UserTreeNode();
		nodeleaf1.setText("张三");
		nodeleaf1.setUUID("zhangsan");
		Map<String, String> data = new HashMap<String, String>();
		data.put("url", "asdf");
		nodeleaf1.setData(data);
		leaf.add(nodeleaf1);
		
		
		UserTreeNode nodeleaf2 = new UserTreeNode();
		nodeleaf2.setText("李四");
		nodeleaf2.setUUID("lisi");
		leaf.add(nodeleaf2);
		
		
		List<UserTreeNode> leaf1 = new ArrayList<UserTreeNode>();
		UserTreeNode nodeleaf3 = new UserTreeNode();
		nodeleaf3.setText("张非");
		nodeleaf3.setUUID("zhangfei");
		Map<String, String> data1 = new HashMap<String, String>();
		data.put("url", "asdf111");
		nodeleaf3.setData(data1);
		leaf1.add(nodeleaf3);
		
		
		UserTreeNode nodeleaf4 = new UserTreeNode();
		nodeleaf4.setText("关羽");
		nodeleaf4.setUUID("guanyu");
		nodeleaf4.setImgUrl("http://hdn.xnimg.cn/photos/hdn521/20110612/2125/tiny_0UGK_178448c019118.jpg");
		leaf1.add(nodeleaf4);
		
		
		UserTreeNode node = new UserTreeNode();
		node.setText("处室");
		node.setUUID("chushi");
		node.setChildren(leaf);
		
		UserTreeNode node1 = new UserTreeNode();
		node1.setText("处室2");
		node1.setUUID("chushi");
		node1.setChildren(leaf1);
		
		root.setChildren(Arrays.asList(node,node1));
		
		List<UserTreeNode> retNodes = new ArrayList<UserTreeNode>();
		retNodes.add(root);
		
		return retNodes;
	}

}

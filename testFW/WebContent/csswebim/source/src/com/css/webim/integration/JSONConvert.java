/**
 * 文件名：UserTreeTransform.java  
 *  
 * 版本信息：  
 * 日期：2012-7-17  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.integration;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.css.webim.server.IMSystemContext;

/**
 * <b>功能描述</b> <br>
 * 将结构化数据转成了json,并且通过{@link com.css.webim.server.OfflineMessageManager} 将离线和在线人员分别渲染了不同样式
 * {@link #ONLINE_LEAF} and {@link #UNLINE_LEAF}
 * @author YUJB
 * @date 2012-7-17 上午9:50:07
 */
public class JSONConvert implements TreeDataConvert{
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	/** web端在线样式  */
	private final String ONLINE_LEAF = "leaf_online";
	
	/** web端离线样式  */
	private final String UNLINE_LEAF = "leaf_unline";
	
	
	public  Object covert(List<UserTreeNode> treeData) throws JsonGenerationException, JsonMappingException, IOException{
		covert(treeData,IMSystemContext.getOnlineUUIDs());
		return objectMapper.writeValueAsString(treeData);
	}
	
	
	private  void covert(List<UserTreeNode> treeData,
			Collection<String> onLineUUIDs) {
		
		for (UserTreeNode node : treeData) {
			
			if (node.getChildren().size() == 0) {
				
				IMSystemContext.getOfflineMessageManager().addAllUUID(node.getUUID());
				if (onLineUUIDs.contains(node)) {
					node.setClasses(ONLINE_LEAF);
				}else {
					node.setClasses(UNLINE_LEAF);
					IMSystemContext.getOfflineMessageManager().addUnlineUUID(node.getUUID());
				}
			}
			covert(node.getChildrenForUpdate(), onLineUUIDs);
		}
		
	}
}

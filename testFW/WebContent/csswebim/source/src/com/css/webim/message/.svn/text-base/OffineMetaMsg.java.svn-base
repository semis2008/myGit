/**
 * 文件名：ChannelOffineMessage.java  
 *  
 * 版本信息：  
 * 日期：2012-7-26  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.message;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.css.webim.OffineMsgProcessor;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-7-26 下午12:52:54
 */
public class OffineMetaMsg {
	
	@JsonIgnore
	public static String META_OFFLINE = "offline";
	
	@JsonIgnore
	public static String META_CHANNEL = "channel";
	
	@JsonIgnore
	public static String META_RECEIVETYPE = "receiveType";
	
	private List<OneMetaMsg> offline = new ArrayList<OffineMetaMsg.OneMetaMsg>();
	
	
	/**
	 * <b>功能描述</b> <br>
	 * 
	 * @author YUJB
	 * @date 2012-7-27 上午10:07:47
	 */
	public class OneMetaMsg{
		
		private String channel;
		
		private Map<String, String> receiveType = new HashMap<String, String>();
		
		@JsonIgnore
		public OffineMsgProcessor getOffineMsgProcessor() {
			String clazz = receiveType.get("class");
			OffineMsgProcessor instance = null;
			try {
				instance = (OffineMsgProcessor) Class.forName(clazz).newInstance();
				for (Map.Entry<String, String> entry : receiveType.entrySet()) {
					try {
						PropertyDescriptor pd = new PropertyDescriptor(entry.getKey(),
								instance.getClass());
						Method method = pd.getWriteMethod();
						if (method != null) {
							method.invoke(instance, entry.getValue());
						}
					} catch (Exception e) {
						continue;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return instance;
		}
		
		
		public String getChannel() {
			return channel;
		}
		
		public void setChannel(String channel) {
			this.channel = channel;
		}
		
		public Map<String, String> getReceiveType() {
			return Collections.unmodifiableMap(receiveType);
		}
		
		@JsonIgnore
		public Map<String, String> getMutableReceiveType() {
			return receiveType;
		}
		
		
		public void setReceiveType(Map<String, String> receiveType) {
			this.receiveType.clear();
			this.receiveType.putAll(receiveType);
		}
	}
	
	
	/**
	 * @param offline the offline to set
	 */
	public void setOffline(List<OneMetaMsg> offline) {
		this.offline.clear();
		this.offline.addAll(offline);
	}
	
	/**
	 * @return the offline
	 */
	public List<OneMetaMsg> getOffline() {
		return Collections.unmodifiableList(offline);
	}
	
	
	public List<OneMetaMsg> getMutableOffline() {
		return offline;
	}
	
	public OffineMetaMsg add(OneMetaMsg oneMetaMsg){
		getMutableOffline().add(oneMetaMsg);
		return this;
	}
	
}

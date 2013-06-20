/**
 * 文件名：ServerSessionMBeanImpl.java  
 *  
 * 版本信息：  
 * 日期：2012-8-9  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.server.manager;

import java.util.List;

import org.cometd.bayeux.server.ServerSession;

import com.css.webim.server.IMSystemContext;

/**
 * <b>功能描述</b> <br>
 *
 * @author YUJB
 * @date 2012-8-9 下午12:56:45
 */
public class SessionMonitor implements SessionMonitorMBean{

	
	public SessionMonitor() {
		super();
	}

	/* (non-Javadoc)
	 * @see com.css.webim.server.ServerSessionMBean#getServerSessionIfPossible(java.lang.String)*/
	public int getOnlineClientCounts(String UUID) {
		List<ServerSession> sessions = IMSystemContext.getServerSessionIfPossible(UUID);
		if (sessions == null) {
			return 0;
		}
		return sessions.size();
	}

	/* (non-Javadoc)
	 * @see com.css.webim.server.ServerSessionMBean#getOnlineUUIDs()*/
	public String[] getOnlineUUIDs() {
		return IMSystemContext.getOnlineUUIDs().toArray(new String[]{});
	}

	/* (non-Javadoc)
	 * @see com.css.webim.server.ServerSessionMBean#disAssociate(java.lang.String)*/
	public boolean disAssociate(String UUID) {
		IMSystemContext.disAssociate(UUID);
		return true;
	}


}

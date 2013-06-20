/**
 * 文件名：ServerSessonFactory.java  
 *  
 * 版本信息：  
 * 日期：2012-7-13  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */

package com.css.webim.server;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import org.cometd.bayeux.server.BayeuxServer;
import org.cometd.bayeux.server.ServerSession;

/**
 * <b>功能描述</b> <br>
 * 应用上下文保存 session和用户的关联信息,系统初始属性
 * 
 * @author YUJB
 * @date 2012-7-13 下午2:59:03
 */
public class IMSystemContext {

	private static BayeuxServer bayeuxServer;

	/** 用户session关联  */
	private final static Map<String, List<ServerSession>> associates = new HashMap<String, List<ServerSession>>();

	/** 离线消息管理器  */
	private static OfflineMessageManager offlineMessageManager;

	/** 系统配置当前用户元数据配置KEY  */
	public final static String META_CURRENT_USER = "currentUser";

	/** 系统配置离线管理器元数据配置KEY  */
	public final static String META_OFFLINEMESSAGE_MANAGER = "OfflineMessageManager";

	/** 系统配置离线消息idel时间元数据配置KEY  */
	public final static String META_OFFLINEMESSAGE_IDEL = "OfflineMessageIdel";

	/** 系统配置树提供者元数据配置KEY  */
	public final static String META_TREE_PROVIER = "treeProvier";

	/** 系统配置存储  */
	private static Properties properties;

	/**
	 * 
	 */
	public static String getIfPossible(String key, String defaultValue) {

		Object valueObj = properties.get(key);
		if (valueObj == null) {
			return defaultValue;
		} else {
			return (String) valueObj;
		}

	}

	public static String getIfPossible(String key) {

		return getIfPossible(key, null);

	}

	public static void init(Properties properties) {
		IMSystemContext.properties = properties;
	}

	/**
	 * @param offlineMessageManager
	 *            the offlineMessageManager to set
	 */
	public static void setOfflineMessageManager(
			OfflineMessageManager offlineMessageManager) {
		IMSystemContext.offlineMessageManager = offlineMessageManager;
	}

	/**
	 * @return the offlineMessageManager
	 */
	public static OfflineMessageManager getOfflineMessageManager() {
		return offlineMessageManager;
	}

	public static synchronized List<ServerSession> getServerSessionIfPossible(String UUID) {
		return associates.get(UUID);
	}

	/**
	 * 通过session得到用户的UUID
	 * @param serverSession
	 * @return 用户UUID，if null return null
	 */
	public static synchronized String getUUIDByServerSession(ServerSession serverSession) {
		Set<Entry<String, List<ServerSession>>> entrySet = associates
				.entrySet();
		for (Entry<String, List<ServerSession>> entry : entrySet) {
			if (entry.getValue().contains(serverSession)) {
				return entry.getKey();
			}
		}
		return null;
	}

	/**
	 * 移除session
	 * @param serverSession
	 */
	public static synchronized void removeByServerSession(ServerSession serverSession) {
		String key = getUUIDByServerSession(serverSession);
		List<ServerSession> list = associates.get(key);
		if (list.size() == 1) {
			associates.remove(key);
		}else {
			list.remove(serverSession);
		}
	}

	/**
	 * @return 得到所有在线的UUID
	 */
	public static synchronized Collection<String> getOnlineUUIDs() {
		return associates.keySet();
	}

	/**
	 * @return 得到所有现在的session
	 */
	public static Collection<ServerSession> getOnlineServerSessions() {
		List<ServerSession> retSessions = new ArrayList<ServerSession>();
		Collection<List<ServerSession>> values = associates.values();
		for (List<ServerSession> list : values) {
			retSessions.addAll(list);
		}
		return retSessions;
	}

	/**
	 * UUID和session关联 如果已经关联忽略
	 * @param UUID
	 * @param serverSession
	 */
	public static synchronized void associate(String UUID, ServerSession serverSession) {
		if (associates.containsKey(UUID)) {
			List<ServerSession> list = associates.get(UUID);
			if (list.contains(serverSession)) {
				return;
			}
			list.add(serverSession);
		} else {
			List<ServerSession> temp = new ArrayList<ServerSession>();
			temp.add(serverSession);
			associates.put(UUID, temp);
		}
	}

	public static synchronized void disAssociate(String UUID) {
		associates.remove(UUID);
	}

	public static BayeuxServer getBayeuxServer() {
		return bayeuxServer;
	}

	public static void setBayeuxServer(BayeuxServer bayeuxServer) {
		IMSystemContext.bayeuxServer = bayeuxServer;
	}

	public static synchronized Map<String, List<ServerSession>> getAssociates() {
		return associates;
	}

	public static synchronized void setAssociates(Map<String, List<ServerSession>> associates) {

		IMSystemContext.associates.clear();
		IMSystemContext.associates.putAll(associates);

	}

}

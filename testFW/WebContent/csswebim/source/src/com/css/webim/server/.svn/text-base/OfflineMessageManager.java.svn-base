/**
 * 文件名：OfflineMessageManager.java  
 *  
 * 版本信息：  
 * 日期：2012-7-16  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.server;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.eclipse.jetty.util.component.AbstractLifeCycle;

import com.css.webim.message.Message;


/**
 * <b>功能描述</b> <br>
 * 离线消息管理,通过{@link com.css.webim.server.IMSystemContext#META_OFFLINEMESSAGE_IDEL}
 * 属性值每天执行一次扫描离线消息存储时间超过此值将其销毁  <br>
 * <li>维护了所有用户 {@link #getAllUUIDs()},
 * <li>离线用户 {@link #getAllUnlineUsers()}
 * <li>离线消息 {@link #getOfflineMsgs(String)}
 * @author YUJB
 * @date 2012-7-16 上午11:00:29
 */
public class OfflineMessageManager extends AbstractLifeCycle{
	
	/** 离线消息  */
	private static List<Message> OFFLINE_MSG = new ArrayList<Message>();
	
	/** 离线用户  */
	private static List<String> OFFLINE_UUID = new ArrayList<String>();
	
	/** 所有用户  */
	private static List<String> ALL_UUID = new ArrayList<String>();
	
	/** 定时器  */
	private Timer timer;
	
	/** 监控器  */
	private OfflineMessageMonitor offlineMessageMonitor;
	
	/** 线程开关  */
	private boolean isRunning;
	
	private Long delay = 1L;
	
	private Long period;
	
	/** 小时有效时间 超过时间的消息 将销毁  */
	private Long idel;
	
	/** 单位转化  */
	private Long milliseconds_day_unit =  (long) (24*60*60*1000);
	
	
	@Override
	protected void doStart() throws Exception {
		super.doStart();
		timer = new Timer();
		idel = Long.valueOf(IMSystemContext.getIfPossible(
				IMSystemContext.META_OFFLINEMESSAGE_IDEL, "30"))
				* milliseconds_day_unit;
		period = milliseconds_day_unit;
		offlineMessageMonitor = new OfflineMessageMonitor();
		offlineMessageMonitor.run();
	}

	@Override
	protected void doStop() throws Exception {
		super.doStop();
		timer.cancel();
		isRunning = false;
	}
	
	
	class OfflineMessageMonitor implements Runnable{
		

		public  void  run() {
			while (isRunning) {
				timer.schedule(new TimerTask() {
					
					@Override
					public void run() {
						
						Iterator<Message> iterator = OFFLINE_MSG.iterator();
						
						while (iterator.hasNext()) {
							Message chatInfo = iterator.next();
							long time = chatInfo.getSendDate().getTime();
							long currentTime = new Date().getTime();
							if (currentTime - time > idel) {
								iterator.remove();
							}
						}
					}
				}, delay, period);
			}
	    }
	}
	
	public void addOfflineMsg(Message chatInfo){
		OFFLINE_MSG.add(chatInfo);
	}
	
	public void removeOfflineMsg(Message chatInfo){
		OFFLINE_MSG.remove(chatInfo);
	}
	
	/**
	 * unmodifiable
	 * @return
	 */
	public List<String> getAllUnlineUsers(){
		return Collections.unmodifiableList(OFFLINE_UUID);
	}
	
	public void  removeOfflineUser(String UUID){
		OFFLINE_UUID.remove(UUID);
	}
	
	/**
	 * unmodifiable
	 * @return
	 */
	public List<String> getAllUUIDs(){
		return Collections.unmodifiableList(ALL_UUID);
	}
	
	public void initAllUUIDs(List<String> UUIDs){
		ALL_UUID.clear();
		ALL_UUID.addAll(UUIDs);
	}
	
	public List<String> addAllUUID(String UUID){
		ALL_UUID.add(UUID);
		return ALL_UUID; 
	}
	
	public List<String> addUnlineUUID(String UUID){
		OFFLINE_UUID.add(UUID);
		return OFFLINE_UUID; 
	}
	
	/**
	 * 得到指定人的离线消息,调用此方法后.销毁此消息
	 * @param UUID
	 * @return
	 */
	public List<Message> getOfflineMsgs(String UUID){
		
		List<Message> retList = new ArrayList<Message>();
		
		for (Message chatInfo : OFFLINE_MSG) {
			if(chatInfo.getReceiverIds().contains(UUID)){
				retList.add(chatInfo);
			}
		}
		return retList;
		
	}
	
}

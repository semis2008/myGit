/**
 * 文件名：ChatServlet.java  
 *  
 * 版本信息：  
 * 日期：2012-7-10  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */

package com.css.webim.server;

import java.io.IOException;
import java.io.InputStream;
import java.lang.management.ManagementFactory;
import java.lang.reflect.Constructor;
import java.rmi.Remote;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.management.MBeanServer;
import javax.management.ObjectName;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.cometd.bayeux.server.BayeuxServer;
import org.cometd.bayeux.server.ServerSession;
import org.cometd.java.annotation.ServerAnnotationProcessor;
import org.cometd.java.annotation.Service;
import org.cometd.server.AbstractService;
import org.cometd.server.BayeuxServerImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.css.webim.rmi.RMIUtils;
import com.css.webim.server.manager.SessionMonitor;
import com.css.webim.server.manager.SessionMonitorMBean;
import com.css.webim.util.Assert;

/**
 * <b>功能描述</b> <br>
 * 
 * 系统加载初始化列 <br>
 *  <li>初始化上下文信息
 *  <li>启动离线管理
 *  <li>注册服务
 *  <li>发布RMI远程对象
 * @author YUJB
 * @date 2012-7-10 下午5:01:33
 */
public class SystemLoaderInitializer extends HttpServlet {

	private static final Logger logger = LoggerFactory
			.getLogger(SystemLoaderInitializer.class);

	/**   */
	private static final long serialVersionUID = 1L;
	
	/** 服务配置文件名称  */
	private static final String SERVER_CONFIG_FILE_NAME = "webIMServer.properties";
	
	/** 服务关键字  */
	private static final String PARAM_SERVICES = "services";
	
	/** 带注册的服务 */
	private final List<Object> services = new ArrayList<Object>();
	
	private static BayeuxServer bayeux;
	
	/** 服务注解处理类  */
	private ServerAnnotationProcessor processor;
	
	/** 离线消息管理器  */
	private OfflineMessageManager offlineMsgMgr;
	
	
	@Override
	public void init() throws ServletException {
		
		super.init();
		
		//初始化应用系统参数
		initSystemConfig();
		
		//初始化离线消息管理器
		initOfflineMsgMgr();
		
		//注册服务
		regeditServices();
		
		//发布RMI远程对象
		publishRMISevices();
		
		//Mbean注册
		regeditMbean();
		
	}


	/**
	 * 
	 */
	private void regeditMbean() {
		MBeanServer server = ManagementFactory.getPlatformMBeanServer();
		SessionMonitorMBean bean = new SessionMonitor();  
		  
		try {
			ObjectName objectName = new ObjectName(  
			        "com.css.webim:type=ServerSession");  
			  
			server.registerMBean(bean, objectName);
		} catch (Exception e) {
			logger.error("ServerSessionMBean fail...",e);
		} 
		
		logger.info("MBean ServerSessionMBean com.css.webim:type=ServerSession");
	}


	/**
	 * 
	 */
	private void publishRMISevices() {
		String RMISerices = IMSystemContext.getIfPossible("RMI");
		if (RMISerices == null || "".equals(RMISerices)) {
			return;
		}
		String[] serices = RMISerices.split(",");
		for (String service : serices) {
			String[] split = service.split(":");
			try {
				RMIUtils.server.publish(Integer.valueOf(split[1]), split[2], (Remote)Class.forName(split[0]).newInstance());
			} catch (Exception e) {
				throw new RuntimeException("RMI ChatServiceRMIWrapper fail.....",e);
			}
		}
		
			
	}


	/**
	 * 
	 */
	protected void initOfflineMsgMgr() {
		offlineMsgMgr = new OfflineMessageManager();
		try {
			offlineMsgMgr.start();
		} catch (Exception e) {
			e.printStackTrace();
		}
		IMSystemContext.setOfflineMessageManager(offlineMsgMgr);
	}


	/**
	 * 注册服务
	 * @throws Exception 
	 * 
	 */
	protected void regeditServices() throws ServletException {
		bayeux = (BayeuxServerImpl) getServletContext().getAttribute(
				BayeuxServer.ATTRIBUTE);
		IMSystemContext.setBayeuxServer(bayeux);
		bayeux.addListener(new BayeuxServer.SessionListener(){

			public void sessionAdded(ServerSession session) {
				
			}
			
			/* (non-Javadoc)
			 * session 消失处理
			 * @see org.cometd.bayeux.server.BayeuxServer.SessionListener#sessionRemoved(org.cometd.bayeux.server.ServerSession, boolean)*/
			public void sessionRemoved(ServerSession session, boolean timedout) {
				String UUID = IMSystemContext.getUUIDByServerSession(session);
				if (UUID != null) {
					IMSystemContext.getOfflineMessageManager().addUnlineUUID(UUID);
					ChatServiceUtils.broadcastUnLineMessage(UUID);
					IMSystemContext.removeByServerSession(session);
				}
			}
			
		});
		String servicesStr = getInitParameter(PARAM_SERVICES);

		Assert.notNull(bayeux, "No BayeuxServer!");

		processor = new ServerAnnotationProcessor(bayeux);

		if (servicesStr != null) {
			String[] serviceList = servicesStr.split(",");
			for (String service : serviceList) {
				try {
					Class<?> klass = Class.forName(service);
					Service serviceAnnotation = klass.getAnnotation(Service.class);
					/*服务注解注册*/
					if (serviceAnnotation != null) {
						Object serviceInstance = klass.newInstance();
						services.add(serviceInstance);
						processor.process(serviceInstance);
					/*服务非注解注册*/	
					} else if (AbstractService.class.isAssignableFrom(klass)) {
						Constructor<?> constructor = klass.getConstructor(BayeuxServer.class);
						constructor.newInstance(bayeux);
					}
				} catch (Exception e) {
					logger.error(e.getMessage());
					throw new ServletException(e);
				}
			}
		}
	}


	/**
	 * @throws ServletException 
	 * 
	 */
	protected void initSystemConfig() throws ServletException {
		InputStream resourceAsStream = this.getClass().getClassLoader().getResourceAsStream(SERVER_CONFIG_FILE_NAME);
		Properties properties = new Properties();
		try {
			properties.load(resourceAsStream);
		} catch (IOException e) {
			logger.error(e.getMessage());
			throw new ServletException(e);
		}
		IMSystemContext.init(properties);
	}


	/* (non-Javadoc)
	 * @see javax.servlet.GenericServlet#destroy()*/
	@Override
	public void destroy() {
		super.destroy();
		for (Object instanceObj : services) {
			processor.deprocess(instanceObj);
		}
		
		if(IMSystemContext.getOfflineMessageManager().isStarted()){
			try {
				IMSystemContext.getOfflineMessageManager().stop();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	

}

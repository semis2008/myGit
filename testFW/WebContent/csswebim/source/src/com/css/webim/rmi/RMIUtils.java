/**
 * 文件名：s.java  
 *  
 * 版本信息：  
 * 日期：2012-7-27  
 * Copyright(c) 2011 China National SoftWare & Service CO.,LTD , http://www.css.com.cn <br>
 * 版权所有  
 */	
 
package com.css.webim.rmi;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.rmi.Naming;
import java.rmi.RMISecurityManager;
import java.rmi.Remote;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.security.Permission;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.css.webim.server.IMSystemContext;
/**
 * <b>功能描述</b> <br>
 * 
 * @author YUJB
 * @date 2012-7-27 下午6:01:10
 */
public class RMIUtils {
	
	private static final Logger logger = LoggerFactory
			.getLogger(RMIUtils.class);
	
	/** RMI客户端  */
	public static Client client = new RMIUtils.Client();
	
	/** RMI服务器端 */
	public static Server server = new RMIUtils.Server();
	
	/** 本机回路地址  */
	private static String LOCAL_IP = "127.0.0.1"; 
	
	public static class Server {
		
		
		
		private static Registry createRegistry(int port) throws RMIException {
			Registry registry = null;
			try {
				registry = LocateRegistry.getRegistry(getLocalAddress(), port);
				registry.list();
			} catch ( Exception e) {
				try {
					System.setProperty("java.rmi.server.hostname", getLocalAddress());
					registry = LocateRegistry.createRegistry(port);
				} catch ( Exception ee) {
					throw new RMIException("远程接口注册失败...",ee);
				}
			}
			logger.info("远程注册存根:" + registry.toString());
			return registry;
		}
		
		/**
		 * 发布远程对象
		 * @param port 端口
		 * @param alias 别名,待发布对象的标识
		 * @param remote 远程对象
		 * @throws RMIException if publish error
		 */
		public void publish(int port, String alias, Remote remote)
				throws RMIException {
			if (System.getSecurityManager() == null) 
            {
				System.setSecurityManager(new RMISecurityManager() {
					@Override
					public void checkConnect(String host, int port) {}
					@Override
					public void checkConnect(String host, int port,
							Object context) {}
					@Override
					public void checkPermission(Permission perm) {}
					@Override
					public void checkPermission(Permission perm, Object context) {}
				});
            }

			System.setProperty("java.rmi.server.hostname", getLocalAddress()); 
			
			Registry registry = null;
			try {
				registry = createRegistry(port);
				registry.rebind(alias, remote);
							Naming.rebind("rmi://" + getLocalAddress() + ":" + port + "/"
									+ alias, remote);
				logger.info(remote.getClass() + "RMI url= " + "rmi://" + getLocalAddress() + ":" + port + "/"
						+ alias);			
			} catch (Exception e) {
				if (e instanceof RMIException) {
					throw (RMIException)e;
				}else {
					throw new RMIException("远程接口发布失败..",e);
				}
			}
		}
	}

	public static class Client {
		
		/**
		 * 得到远程发布的对象
		 * @param url  rmi://ip:host/alias
		 * @return
		 * @throws RMIException if subscript失败
		 */
		public  Object subscript(String url) throws RMIException {
			try {
				Remote remote = Naming.lookup(url);
				logger.info("得到远程对象" + url);
				return remote;
			} catch (Exception e) {
				throw new RMIException("得到远程接口失败,确保url rmi://ip:host/alias",e);
			} 
		}
		
		@SuppressWarnings("unchecked")
		public  <T> T subscript(String url,Class<T> clazz) throws RMIException {
			return (T)subscript(url);
		}
	}
	
	
	
	private static String getInetAddress() {
		
		InetAddress localHost;
		try {
			localHost = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			return LOCAL_IP;
		}
		return localHost.getHostAddress();

	} 
	
	private static String getLocalAddress(){
		return IMSystemContext.getIfPossible("localIP", getInetAddress());
	}
	
}

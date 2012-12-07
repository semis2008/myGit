package com.testCD.listener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
public class SessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent httpsessionevent) {
		// TODO Auto-generated method stub
		System.out.println("session被创建了");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent httpsessionevent) {
		// TODO Auto-generated method stub
		System.out.println("session被摧毁了");
	}

}

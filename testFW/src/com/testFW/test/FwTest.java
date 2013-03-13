package com.testFW.test;

import java.net.URLEncoder;

import junit.framework.TestCase;

import org.apache.log4j.Logger;

/**
 * ≤‚ ‘¿‡
 * 
 * @author kalor
 * @time 2012-12-14
 */
public class FwTest extends TestCase {
	private final static Logger logger = Logger.getLogger(FwTest.class);
	
	public static void main(String args[]) {
//		String currentURL = "www.testFW.com/html/index.jsp";
//		String targetURL = currentURL.substring(currentURL.indexOf("/", 1));
//		logger.info("currentURL:"+currentURL);
		
		String sss = "°≤ 2012°≥";
		logger.info("targetURL:"+URLEncoder.encode(sss));
	}
}

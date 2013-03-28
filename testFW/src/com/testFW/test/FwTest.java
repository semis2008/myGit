package com.testFW.test;

import java.net.URLDecoder;
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
//		%D2%AC%C1%D6   %D2%AC+%C1%D6

		String sss = "“¨ ¡÷";
		logger.info("targetURL:"+URLDecoder.decode("%D2%AC%C1%D6"));
	}
}

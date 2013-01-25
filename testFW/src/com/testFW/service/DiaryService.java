package com.testFW.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 日志业务处理类 
 * @author kalor
 * @time 2013-1-24 at 下午04:12:06
 */
public interface DiaryService {
	
	/**
	 * 发布日志
	 * @param req
	 * @param resp
	 * @return
	 */
	 int newDiary(HttpServletRequest req, HttpServletResponse resp);
}

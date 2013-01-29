package com.testFW.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testFW.bo.DiaryBO;

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
	 
	 /**
	  * 获取日志列表
	  * @param req
	  * @param resp
	  * @return 日志列表
	  */
	 List<DiaryBO> getDiaryList(HttpServletRequest req, HttpServletResponse resp);
}

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
	  * 登录用户发表回复
	  * @param req
	  * @param resp
	  * @return
	  */
	 int newUserReply(HttpServletRequest req, HttpServletResponse resp);
	 
	 /**
	  * 游客发表回复
	  * @param req
	  * @param resp
	  * @return
	  */
	 int newGuestReply(HttpServletRequest req, HttpServletResponse resp);
	 /**
	  * 获取日志列表
	  * @param req
	  * @param resp
	  * @return 日志列表
	  */
	 List<DiaryBO> getDiaryList(HttpServletRequest req, HttpServletResponse resp);
	 
	 /**
	  * 获取最新日志列表 (取前5条)
	  * @param req
	  * @param resp
	  * @return
	  */
	 List<DiaryBO> getNewDiaryList(HttpServletRequest req, HttpServletResponse resp);
	 
	 /**
	  * 通过日志id获取日志信息
	  * @param diaryId 日志id
	  * @return 日志实体类
	  */
	 DiaryBO getDiaryByID(String diaryId);
}

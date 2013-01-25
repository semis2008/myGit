package com.testFW.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testFW.bo.UserBO;
import com.testFW.dao.DiaryDao;
import com.testFW.service.DiaryService;
import com.testFW.util.UserUtil;

/**
 * 日志业务处理接口实现类
 * @author kalor
 * @time 2013-1-24 at 下午04:14:37
 */
public class DiaryServiceImpl implements DiaryService{
	private DiaryDao diaryDao;

	public void setDiaryDao(DiaryDao diaryDao) {
		this.diaryDao = diaryDao;
	}

	@Override
	public int newDiary(HttpServletRequest req, HttpServletResponse resp) {
		String title = req.getParameter("title");
		String tags = req.getParameter("tags");
		String diaryContent = req.getParameter("diaryContent");
		UserBO user = UserUtil.getLoginUser(req, resp);
		if(!"".equals(tags.trim())) {
			tags = tags.replace(" ", "_");
		}
		return diaryDao.insertDiary(title,tags,diaryContent,user.getId());
	}
	 
}

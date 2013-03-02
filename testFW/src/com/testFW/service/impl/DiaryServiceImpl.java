package com.testFW.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.testFW.bo.DiaryBO;
import com.testFW.bo.DiaryReplyBO;
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
		return diaryDao.insertDiary(title,tags,diaryContent,user.getId(),user.getName());
	}

	@Override
	public List<DiaryBO> getDiaryList(HttpServletRequest req,
			HttpServletResponse resp) {
		UserBO visitUser = UserUtil.getVisitedUser(req, resp);
		String pageNum = req.getParameter("p1");
		if(pageNum==null||pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		/*
		 * 获取日志总页数
		 */
		int totalDiary = diaryDao.queryDiaryNumByUserId(visitUser.getId()); 
		int totalPage = totalDiary/10+1;
		
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage", totalPage);
		List<DiaryBO> diaryList = diaryDao.queryDiaryList(visitUser.getId(), 10*(currentPage-1), 10*currentPage);
		/*
		 * 置顶业务处理
		 */
		List<DiaryBO> afterDiaryList = new ArrayList<DiaryBO>();
		if(UserUtil.getVisitedUser(req, resp).getUser_level().equals("3")) {
			for(DiaryBO diary:diaryList) {
				if(diary.getTags().contains("置顶")) {
					afterDiaryList.add(diary);
					diaryList.remove(diary);
					break;
				}
			}
			afterDiaryList.addAll(diaryList);
		}
		return afterDiaryList;
	}

	@Override
	public List<DiaryBO> getNewDiaryList(HttpServletRequest req,
			HttpServletResponse resp) {
		UserBO visitUser = UserUtil.getVisitedUser(req, resp);
		return diaryDao.queryDiaryList(visitUser.getId(),0,5);
	}

	@Override
	public DiaryBO getDiaryByID(String diaryId) {
		return diaryDao.queryDiaryById(Long.parseLong(diaryId));
	}

	@Override
	public int newGuestReply(HttpServletRequest req, HttpServletResponse resp) {
		String reply = req.getParameter("reply");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String website = req.getParameter("website");
		String diaryId = req.getParameter("diaryid");
		String parentId = req.getParameter("parentid");
		 
		int result = diaryDao.insertReply(diaryId,parentId,reply,name,email,website);
		/*
		 * 更新日志回复数
		 */
		diaryDao.updateDiaryReplyNum(diaryId);
		
		return result;
	}

	@Override
	public int newUserReply(HttpServletRequest req, HttpServletResponse resp) {
		String reply = req.getParameter("reply");
		String diaryId = req.getParameter("diaryid");
		String parentId = req.getParameter("parentid");
		UserBO user = UserUtil.getLoginUser(req, resp);
		 
		return diaryDao.insertReply(diaryId,parentId,reply,user);
	}

	@Override
	public List<DiaryReplyBO> getDiaryReplyById(String diaryid) {
		return  diaryDao.queryDiaryReplyById(Long.parseLong(diaryid));
	}

	@Override
	public int updateDiaryRead(String diaryid) {
		return diaryDao.updateDiaryRead(diaryid);
	}
	 
}

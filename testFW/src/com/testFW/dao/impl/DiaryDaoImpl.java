package com.testFW.dao.impl;

import java.util.List;
import java.util.Map;

import com.testFW.bo.DiaryBO;
import com.testFW.bo.DiaryReplyBO;
import com.testFW.bo.UserBO;
import com.testFW.dao.DiaryDao;
import com.testFW.dao.template.DbUtilsTemplate;
import com.testFW.util.DateUtil;

/**
 * 用户数据操作接口实现类
 * 
 * @author Kalor
 * @time 2012-12-17
 */
public class DiaryDaoImpl implements DiaryDao {
	private DbUtilsTemplate dbUtilsTemplate;

	public void setDbUtilsTemplate(DbUtilsTemplate dbUtilsTemplate) {
		this.dbUtilsTemplate = dbUtilsTemplate;
	}

	@Override
	public int insertDiary(String title, String tags, String diaryContent,
			Long userId,String userName) {
		String sql = "insert into diary(title,content,author_id,author_name,publish_time,tags) values (?,?,?,?,now(),?)";
		Object[] params = {title,diaryContent,userId,userName,tags};
		dbUtilsTemplate.update(sql, params);
		return Integer.parseInt(dbUtilsTemplate.getLastActPriId()+"");
	}

	@Override
	public List<DiaryBO> queryDiaryList(Long userId, int start, int end) {
		String sql = "select * from diary where author_id = ? order by publish_time desc limit ?,?";
		Object[] param = {userId,start,end};
		return dbUtilsTemplate.find(DiaryBO.class, sql, param);
	}

	@Override
	public int queryDiaryNumByUserId(Long userId) {
		String sql = "select count(*) totalNum from diary where author_id = ?";
		Map<String,Object> result = dbUtilsTemplate.findFirst(sql, userId);
		return Integer.parseInt((Long)result.get("totalNum")+"");
		
	}

	@Override
	public DiaryBO queryDiaryById(Long diaryId) {
		String sql = "select * from diary where id = ?";
		return dbUtilsTemplate.findFirst(DiaryBO.class, sql,diaryId);
	}

	@Override
	public int insertReply(String diaryId, String parentId, String reply,
			UserBO user) {
		String sql = "insert into diary_reply (diary_id,user_id,user_name,reply,email,reply_time,parent_id,type) values(?,?,?,?,?,now(),?,?)";
		Object[] params = {diaryId,user.getId(),user.getName(),reply,user.getEmail(),parentId,"1"};
		dbUtilsTemplate.update(sql, params);
		return Integer.parseInt(dbUtilsTemplate.getLastActPriId()+"");
	}

	@Override
	public int insertReply(String diaryId, String parentId, String reply,
			String name, String email, String website) {
		String sql = "insert into diary_reply (diary_id,user_name,reply,email,website,reply_time,parent_id,type) values(?,?,?,?,?,now(),?,?)";
		Object[] params = {diaryId,name,reply,email,website,parentId,"0"};
		dbUtilsTemplate.update(sql, params);
		return  Integer.parseInt(dbUtilsTemplate.getLastActPriId()+""); 
	}

	@Override
	public List<DiaryReplyBO> queryDiaryReplyById(String diaryid) {
		String sql =  "select * form diary_reply where diary_id = ?";
		return dbUtilsTemplate.find(DiaryReplyBO.class, sql, diaryid);
	}

	@Override
	public int updateDiaryReplyNum(String diaryid) {
		String sql = "update diary set reply = reply+1 where id = ?";
		return dbUtilsTemplate.update(sql, diaryid);
	}

}

package com.testFW.dao.impl;

import java.util.List;
import java.util.Map;

import com.testFW.bo.DiaryBO;
import com.testFW.dao.DiaryDao;
import com.testFW.dao.template.DbUtilsTemplate;

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
		String sql = "select * from diary where author_id = ? limit ?,?";
		Object[] param = {userId,start,end};
		return dbUtilsTemplate.find(DiaryBO.class, sql, param);
	}

	@Override
	public int queryDiaryNumByUserId(Long userId) {
		String sql = "select count(*) totalNum from diary where author_id = ?";
		Map<String,Object> result = dbUtilsTemplate.findFirst(sql, userId);
		return Integer.parseInt((Long)result.get("totalNum")+"");
		
	}

}

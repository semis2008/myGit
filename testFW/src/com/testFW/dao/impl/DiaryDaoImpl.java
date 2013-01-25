package com.testFW.dao.impl;

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
			Long userId) {
		String sql = "insert into diary(title,content,author_id,publish_time,tags,status) values (?,?,?,now(),?,?)";
		Object[] params = {title,diaryContent,userId,tags,0};
		return dbUtilsTemplate.update(sql, params);
	}

}

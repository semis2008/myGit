package com.testFW.dao;

/**
 * 日志数据处理接口 
 * @author kalor
 * @time 2013-1-24 at 下午04:15:41
 */
public interface DiaryDao {
	
	/**
	 * 新增日志
	 * @param title 日志标题
	 * @param tags 标签
	 * @param diaryContent 日志内容
	 * @param userId 作者id
	 * @return 受影响的行数
	 */
	 int insertDiary(String title,String tags,String diaryContent,Long userId);
}

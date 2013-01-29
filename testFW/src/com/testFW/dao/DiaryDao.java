package com.testFW.dao;

import java.util.List;

import com.testFW.bo.DiaryBO;

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
	 int insertDiary(String title,String tags,String diaryContent,Long userId,String userName);
	 
	 /**
	  * 查询日志列表
	  * @param userId 用户id
	  * @param start 开始下标
	  * @param end 结束下标
	  * @return 日志实体类的List
	  */
	 List<DiaryBO> queryDiaryList(Long userId,int start,int end);
	 
}

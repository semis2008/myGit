package com.testFW.dao;

import java.util.List;

import com.testFW.bo.AlbumBO;

/**
 * 图册操作Dao
 * @author kalor
 *
 */
public interface AlbumDao {
	
	/**
	 * 获取所有的图册
	 * @return
	 */
	List<AlbumBO> queryAlbums();
	
	/**
	 * 获取指定id的图册
	 * @param id
	 * @return
	 */
	AlbumBO queryAlbumById(Long id);
}

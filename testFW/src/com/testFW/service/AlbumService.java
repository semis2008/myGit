package com.testFW.service;

import java.util.List;

import com.testFW.bo.AlbumBO;

/**
 * 图册业务处理
 * @author kalor
 *
 */
public interface AlbumService {
	
	/**
	 * 获取系统所有的图册
	 * @return
	 */
	List<AlbumBO> getAllAlbums();
	
	/**
	 * 获取指定id的图册
	 * @param id
	 * @return
	 */
	AlbumBO getAlbumById(String id);
}

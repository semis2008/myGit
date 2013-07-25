package com.testFW.service.impl;

import java.util.List;

import com.testFW.bo.AlbumBO;
import com.testFW.dao.AlbumDao;
import com.testFW.service.AlbumService;

public class AlbumServiceImpl implements AlbumService {
	private AlbumDao albumDao; 
	
	public void setAlbumDao(AlbumDao albumDao) {
		this.albumDao = albumDao;
	}

	@Override
	public List<AlbumBO> getAllAlbums() {
		return albumDao.queryAlbums();
	}

	@Override
	public AlbumBO getAlbumById(String id) {
		return albumDao.queryAlbumById(Long.valueOf(id));
	}

}

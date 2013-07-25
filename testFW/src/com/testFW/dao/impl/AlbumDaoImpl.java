package com.testFW.dao.impl;

import java.util.List;

import com.testFW.bo.AlbumBO;
import com.testFW.dao.AlbumDao;
import com.testFW.dao.template.DbUtilsTemplate;

public class AlbumDaoImpl implements AlbumDao {
	private DbUtilsTemplate dbUtilsTemplate;

	public void setDbUtilsTemplate(DbUtilsTemplate dbUtilsTemplate) {
		this.dbUtilsTemplate = dbUtilsTemplate;
	}
	
	@Override
	public List<AlbumBO> queryAlbums() {
		String sql = "select * from album where 1=1";
		return dbUtilsTemplate.find(AlbumBO.class, sql);
	}

	@Override
	public AlbumBO queryAlbumById(Long id) {
		String sql = "select * from album where id = ?";
		return dbUtilsTemplate.findFirst(AlbumBO.class,sql,id);
	}

}

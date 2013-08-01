package org.albumup.service;

import java.util.Date;

import org.bson.types.ObjectId;
import org.albumup.dao.AlbumDAO;
import org.albumup.model.Album;
import org.albumup.model.Photo;
import org.albumup.util.ObjectIdGenerator;

public class AlbumService {
	
	private AlbumDAO albumdao = new AlbumDAO();
	public boolean saveAlbum(Album album){
		album.setId(ObjectIdGenerator.generate().toString());
		album.setCtime(new Date());
		album.setSize(album.getPhotos().size());
		album.setVisit(0);
		album.setCtime(new Date());
		
		for(Photo photo: album.getPhotos()){
			photo.setLikes(0);
			photo.setCtime(new Date());
		}		
		return albumdao.saveAlbum(album);
	}
	
	public Album getAlbum(ObjectId id){
		return null;
	}
}

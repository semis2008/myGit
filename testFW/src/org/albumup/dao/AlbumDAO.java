package org.albumup.dao;

import java.util.ArrayList;
import java.util.List;

import org.bson.types.ObjectId;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import org.albumup.db.MongoDBPool;
import org.albumup.model.Album;
import org.albumup.model.Photo;

public class AlbumDAO {

	public boolean saveAlbum(Album album){
		DBCollection albumColl = MongoDBPool.getInstance().getCollection("album");
		BasicDBObject doc = new BasicDBObject("_id",new ObjectId(album.getId())).
							append("albumname", album.getAlbumname()).
					        append("uid", album.getUid()).
					        append("username", album.getUsername()).
					        append("size", album.getSize()).
					        append("ctime", album.getCtime()).
					        append("visit", album.getVisit()).
					        append("desc", album.getDesc());
		
		List<BasicDBObject> photos = new ArrayList<BasicDBObject>();	
		for(Photo photo: album.getPhotos()){
			photos.add(new BasicDBObject("_id", new ObjectId(photo.getId())).
										 append("desc", photo.getDesc()).
										 append("ctime", photo.getCtime()).
										 append("likes", photo.getLikes()) );
		}
		doc.append("photos", photos);
		albumColl.insert(doc);
		return true;
	}
	public Album getAlbum(){
		return null;
	}
}

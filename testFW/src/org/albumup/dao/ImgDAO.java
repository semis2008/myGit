package org.albumup.dao;

import java.io.InputStream;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.bson.types.ObjectId;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import org.albumup.db.MongoDBPool;
import org.albumup.model.Photo;
import org.albumup.util.ImgTools;
import org.albumup.util.ObjectIdGenerator;

public class ImgDAO {
	
	private static final Log log = LogFactory.getLog(ImgDAO.class);
	
	public Photo saveImg(FileItem item) throws Exception{
		Photo photo = new Photo();
		String filename = item.getName();
		if(filename == null || filename.length() == 0)
		{
			log.error("img name illegal");
			return null;
		}
		int index = filename.lastIndexOf(".");
		String type = filename.substring(index+1);
		if(!ImgTools.checkImgFormatValidata(type)){
			log.error("img type illegal");
			return null;
		}
		ObjectId id = ObjectIdGenerator.generate();
		//filename = new ObjectId() + filename.substring(index);
		photo.setId(id.toString());
		photo.setType(type);
		
		GridFS mphoto = new GridFS(MongoDBPool.getInstance().getDB(), "imgs");
		GridFSInputFile in = null;
		in = mphoto.createFile(item.getInputStream());
		in.setId(id);
		in.setFilename(id.toString()+"."+type);
		in.setContentType(type);
		in.save();
		item.getInputStream().close();
		return photo;
	}
	
	public InputStream getImg(String filename){
		log.info("getting img:"+filename+" from mongo");
		if(filename == null || filename.length() == 0){
			log.info("img filename null");
			return null;
		}
		GridFS photo = new GridFS(MongoDBPool.getInstance().getDB(), "imgs");
		GridFSDBFile imgout = photo.findOne(filename);
		if(imgout != null)
			return imgout.getInputStream();
		return null;
	}
}

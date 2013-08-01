package org.albumup.control;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.albumup.model.Album;
import org.albumup.model.Photo;
import org.albumup.service.ImgService;

public class ImgAction{

	private static final Log log = LogFactory.getLog(ImgAction.class);
	private static String TEMPPATH;	
	
	public Photo saveImg(HttpServletRequest request, String temppath){
		TEMPPATH = temppath;
		return execute(request);
	}
	

	public Photo execute(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			return null;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(4 * 1024);			//4M
		factory.setRepository(new File(TEMPPATH));  //
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(4*1024*1024);

		
		ImgService imgService = new ImgService();
		Photo photo = null;
		
		try {
			@SuppressWarnings("unchecked")
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> it = items.iterator(); 
			while(it.hasNext()){
				DiskFileItem item = (DiskFileItem)it.next();
				if(item.isFormField()){
					
				}
				else{
					photo = imgService.processUploadFile(item);
					if(photo != null){
						//cacheImgToSession(request.getSession(), photo);
						log.info("upload img id:"+photo.getId().toString());
					}
					item.delete();
				}
			}
			
		} catch (FileUploadException e) {
			log.info("img upload error");
			return null;
		} catch (Exception e) {
			log.info("img upload error");
			return null;
		}
		return photo;
	}

	private void cacheImgToSession(HttpSession session, Photo photo){
		Album album = (Album) session.getAttribute("album");
		if(album == null){
			album = new Album();
			session.setAttribute("album", album);
		}
		album.getPhotos().add(photo);
		log.info("cache img:"+photo.getId().toString()+" to session");
	}
	
}

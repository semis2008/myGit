package org.albumup.service;

import java.io.InputStream;
import org.apache.commons.fileupload.FileItem;
import org.albumup.dao.ImgDAO;
import org.albumup.model.Photo;

public class ImgService {
	
	private ImgDAO imgdao;
	public ImgService(){
		imgdao = new ImgDAO();
	}

	/* not use here
	public void processFormField(FileItem item){
		String name = item.getFieldName();
		String value = item.getString();
		System.out.println(name+":"+value);
	}
	*/
	
	/*
	 * return img filename
	 */
	public Photo processUploadFile(FileItem item) throws Exception{
		return imgdao.saveImg(item);
	}
	
	/*
	 * get img stream
	 */
	public InputStream getImg(String filename){
		return imgdao.getImg(filename);
	}
}

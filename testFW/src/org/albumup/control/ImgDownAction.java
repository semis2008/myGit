package org.albumup.control;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import org.albumup.service.ImgService;
import org.albumup.util.ImgTools;

	

public class ImgDownAction {

	private static final Log log = LogFactory.getLog(ImgDownAction.class);
	
	public void downLoadImg(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		request.setCharacterEncoding("utf-8");
		String filename = request.getParameter("id");   //[0-9]+.jpg
		String height = request.getParameter("height");
		String width = request.getParameter("width");
		if(filename == null){
			log.error("img name null");
			return ;
		}
		String[] fields = StringUtils.split(filename, ".");
		if(fields.length != 2){
			log.error("img name format error");
			return ;
		}
		if(!ImgTools.checkImgFormatValidata(fields[1])){
			log.error("img ext format error");
			return ;
		}
		
		String ext = fields[1];
		InputStream imgstream = new ImgService().getImg(filename);
		if(imgstream == null){
			return;
		}
		String type = "image/" + ext;
		response.setContentType(type);
		ServletOutputStream out = response.getOutputStream();
		BufferedImage img = null;
		if((height != null && height.length() != 0) &&
		   (width != null && width.length() != 0)){
			int h = Integer.parseInt(height);
			int w = Integer.parseInt(width);
			img = ImgTools.resizeImg(imgstream, h, w);
		}
		else{
			img = ImageIO.read(imgstream);
		}
		ImgTools.write(img, ext, out);
	}
	
	
}

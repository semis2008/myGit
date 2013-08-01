package org.albumup.control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.albumup.model.Photo;

/**
 * Servlet implementation class ImgUploadServlet
 */
public class ImgUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String temppath;
    
    public void init()
    {
    	temppath = getInitParameter("temppath");
    	temppath = getServletContext().getRealPath(temppath);
    }
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImgUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ImgAction imgAction = new ImgAction();
		Photo photo = imgAction.saveImg(request, temppath);
		response.setCharacterEncoding("utf-8");	
		
		//from post or album
		String url = "/imgs?id=" + photo.getId().toString() +"."+ photo.getType();
		String attr = request.getParameter("attr");
		System.out.println("attr:"+attr);
		if("post".equals(attr)){
			PrintWriter out = response.getWriter();	
			String callback = request.getParameter("CKEditorFuncNum");
			out.println("<script type=\"text/javascript\">");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
			+ ",'" + url + "',''" + ")");
			out.println("</script>");
			out.close();
		}else if("album".equals(attr)){
			/*
			 * 这里最好设置成text/plain 以防止IE下不兼容
			 */
			response.setContentType("text/plain; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write("{\"success\":true,\"url\":\""+url+"&height=100&width=100\""+
			",\"id\":\""+photo.getId().toString()+"\"}");
			out.close();
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

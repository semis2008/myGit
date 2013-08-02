package com.testFW.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.testFW.bo.DiaryBO;
import com.testFW.bo.DiaryReplyBO;
import com.testFW.bo.LeaveMsgBO;
import com.testFW.bo.UserBO;
import com.testFW.bo.UserInfoBO;
import com.testFW.service.AlbumService;
import com.testFW.service.DiaryService;
import com.testFW.service.UserService;
import com.testFW.util.UserUtil;
import com.testFW.vo.DynamicVO;

/**
 * WN Chat系统处理类
 * @author Kalor
 *
 */
@Component
public class AlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(UserServlet.class);
	private AlbumService albumService;

	 

	public void setAlbumService(AlbumService albumService) {
		this.albumService = albumService;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String fun = (String) req.getParameter("fun");
		if ("albumup".equals(fun)) {
			albumUp(req, resp);
		}
	}



	/**
	 * 上传图册
	 * 
	 * @param req
	 * @param resp
	 * @return
	 * @throws IOException
	 */
	private void albumUp(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String randImg = req.getParameter("randImg");
		String msg = "";
		 
		out.print(msg);
		out.flush();
		out.close();
	}
	
}

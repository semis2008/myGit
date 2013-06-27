package com.chatBear.comet;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.chatBear.model.CrawlContent;
import com.chatBear.model.CrawlSite;

/**
 * WN Chat系统处理类
 * 
 * @author Kalor
 * 
 */
@Component
public class GetMsgAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(GetMsgAjax.class);
	private Map<String,List<CrawlContent>> contentPool = new HashMap<String,List<CrawlContent>>();
	private Map<String,Integer> countPool = new HashMap<String,Integer>();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}
	
	
	
	
	private List<CrawlContent> contents = null;
	private Integer count;
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		
		super.service(arg0, arg1);
	}




	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String msg = "";
		 
		
		resp.setContentType("text/html;charset=utf-8");
		String msgId = req.getParameter("id");
		
		if(contentPool.containsKey(msgId)) {
			contents = contentPool.get(msgId);
		}else{
			contents =  MsgFactory.getSiteMsg(msgId).getContents();
			contentPool.put(msgId, contents);
		}
		if(countPool.containsKey(msgId)) {
			count = countPool.get(msgId);
		}else {
			count = 0;
			countPool.put(msgId, count);
		}
		
		
		
		if(contents.size()-1<count) {
			//内容发布完毕，循环
			count = 0;
		} 
		msg = contents.get(count).getContent() +"- -"+ contents.get(count).getSiteName();
		count++;
		try {
			int time = (int) (Math.random() * 10000) + 3000;
			logger.info("推送间隔:" + time +"---Content余量："+contents.size()+"---计数器："+count);
			Thread.sleep(time);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		out.write(msg + "<br>");
		out.flush();
		out.close();
	}
	
	
	/**
	  * List深度clone
	  * @param src
	  * @return
	  */
	 public static ArrayList<Object> copyList(ArrayList<Object> src){   
	  ArrayList<Object> list = null;
	  try{
	   ByteArrayOutputStream byteout = new ByteArrayOutputStream();   
	         ObjectOutputStream out = new ObjectOutputStream(byteout);   
	         out.writeObject(src);
	         ByteArrayInputStream bytein = new ByteArrayInputStream(byteout.toByteArray());   
	         ObjectInputStream in =new ObjectInputStream(bytein);   
	         list = (ArrayList<Object>)in.readObject();
	        }catch(Exception e){
	         System.out.println("cache copy error !");
	         e.printStackTrace();
	        }
	        return list;   
	    }
}

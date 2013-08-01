package org.albumup.model;

import java.io.Serializable;
import java.util.Date;

public class Photo implements Serializable{

	private static final long serialVersionUID = 4596526198993228200L;
	private String id;
	private String type;
	private String desc;
	private Date ctime;
	private int likes;
	//private List<PhotoComment> comments = new ArrayList<PhotoComment>();
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setType(String type){
		this.type = type;
	}
	public String getType(){
		return type;
	}
	
	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	/*
	public List<PhotoComment> getComments() {
		return comments;
	}

	public void setComments(List<PhotoComment> comments) {
		this.comments = comments;
	}
	*/
	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}
}

package com.testFW.bo;

import java.util.Date;
 
/**
 * 图册照片实体
 * @author kalor
 *
 */
public class PictureBO {
	
	private Long id;
	private Long album_id;
	private String title;
	private String info;
	private String src;
	private Long praise_num;
	private Long down_num;
	private Long status;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getAlbum_id() {
		return album_id;
	}
	public void setAlbum_id(Long album_id) {
		this.album_id = album_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public Long getPraise_num() {
		return praise_num;
	}
	public void setPraise_num(Long praise_num) {
		this.praise_num = praise_num;
	}
	public Long getDown_num() {
		return down_num;
	}
	public void setDown_num(Long down_num) {
		this.down_num = down_num;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
}
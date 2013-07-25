package com.testFW.bo;

import java.util.Date;

/**
 * 图册实体
 * @author kalor
 *
 */
public class AlbumBO{
	
	private Long id;
	private String title;
	private Long author_id;
	private String author_name;
	private Date creat_time;
	private String description;
	private String address;
	private String equipment;
	private String front_cover;
	private Long praise_num;
	private Long status;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(Long author_id) {
		this.author_id = author_id;
	}
	public String getAuthor_name() {
		return author_name;
	}
	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}
	public Date getCreat_time() {
		return creat_time;
	}
	public void setCreat_time(Date creat_time) {
		this.creat_time = creat_time;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public String getFront_cover() {
		return front_cover;
	}
	public void setFront_cover(String front_cover) {
		this.front_cover = front_cover;
	}
	public Long getPraise_num() {
		return praise_num;
	}
	public void setPraise_num(Long praise_num) {
		this.praise_num = praise_num;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	
	
}
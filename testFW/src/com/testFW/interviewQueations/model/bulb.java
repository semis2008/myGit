package com.testFW.interviewQueations.model;

import com.testFW.interviewQueations.enums.bulbEnum;

/**
 * 电灯泡的实体
 * @author kalor
 *
 */
public class bulb {
	/*
	 * 唯一标识
	 */
	private int id;
	/*
	 * 灯泡的状态
	 */
	private bulbEnum state;

	/*
	 * 构造函数
	 */
	public bulb(int id, bulbEnum state) {
		super();
		this.id = id;
		this.state = state;
	}

	 
	public bulbEnum getState() {
		return state;
	}


	public void setState(bulbEnum state) {
		this.state = state;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	
}

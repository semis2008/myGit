package com.testFW.bo;

/**
 * 邀请码实体类
 * @author kalor
 * @time 2013-1-14 at 下午04:11:43
 */
public class InvitationCodeBO {
	private Long id;
	private String code;
	private int state;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}
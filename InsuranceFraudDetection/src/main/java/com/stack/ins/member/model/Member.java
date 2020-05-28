package com.stack.ins.member.model;

import java.util.Date;

public class Member {
	
	private int userNum;
	private String userId;
	private String name;
	private String password;
	private String email;
	private String phone;
	private int delCount;
	private Date birth;
	private Date insertDay;
	private Date delDay;
	private int custManagerId;
	private int custId;
	
	
	public int getCustManagerId() {
		return custManagerId;
	}
	public int getCustId() {
		return custId;
	}
	public void setCustManagerId(int custManagerId) {
		this.custManagerId = custManagerId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public Date getInsertDay() {
		return insertDay;
	}
	public void setInsertDay(Date insertDay) {
		this.insertDay = insertDay;
	}
	public Date getDelDay() {
		return delDay;
	}
	public void setDelDay(Date delDay) {
		this.delDay = delDay;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getDelCount() {
		return delCount;
	}
	public void setDelCount(int delCount) {
		this.delCount = delCount;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
	@Override
	public String toString() {
		return "Member [userNum=" + userNum + ", userId=" + userId + ", name=" + name + ", password=" + password
				+ ", email=" + email + ", phone=" + phone + ", delCount=" + delCount + ", birth=" + birth
				+ ", insertDay=" + insertDay + ", delDay=" + delDay + ", custManagerId=" + custManagerId + ", custId="
				+ custId + "]";
	}
	

	
	
	
    
}

package com.stack.ins.member.model;

public class CustManager {
	
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
	@Override
	public String toString() {
		return "Cust_Manager [custManagerId=" + custManagerId + ", custId=" + custId + "]";
	}
}

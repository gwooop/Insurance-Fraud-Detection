package com.stack.ins.member.model;

public class CustManager {
	
	private int custManagerId;
	private int custId;
	private int rownum;
	
	
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
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	@Override
	public String toString() {
		return "CustManager [custManagerId=" + custManagerId + ", custId=" + custId + ", rownum=" + rownum + "]";
	}
	
}

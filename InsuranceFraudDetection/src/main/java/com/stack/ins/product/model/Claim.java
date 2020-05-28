package com.stack.ins.product.model;

public class Claim {
	private int custId;
	private int polyNo;
	private int acciDvsn;
	private int dmndResnCode;
	private int vlidHospOtda;
	private double hospCode;
	private double chmeLiceNo;
	private String heedHospYn;
	private int id;
	
	public int getCustId() {
		return custId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public int getPolyNo() {
		return polyNo;
	}
	public void setPolyNo(int polyNo) {
		this.polyNo = polyNo;
	}
	public int getAcciDvsn() {
		return acciDvsn;
	}
	public void setAcciDvsn(int acciDvsn) {
		this.acciDvsn = acciDvsn;
	}
	public int getDmndResnCode() {
		return dmndResnCode;
	}
	public void setDmndResnCode(int dmndResnCode) {
		this.dmndResnCode = dmndResnCode;
	}
	public int getVlidHospOtda() {
		return vlidHospOtda;
	}
	public void setVlidHospOtda(int vlidHospOtda) {
		this.vlidHospOtda = vlidHospOtda;
	}
	public double getHospCode() {
		return hospCode;
	}
	public void setHospCode(double hospCode) {
		this.hospCode = hospCode;
	}
	public double getChmeLiceNo() {
		return chmeLiceNo;
	}
	public void setChmeLiceNo(double chmeLiceNo) {
		this.chmeLiceNo = chmeLiceNo;
	}
	public String getHeedHospYn() {
		return heedHospYn;
	}
	public void setHeedHospYn(String heedHospYn) {
		this.heedHospYn = heedHospYn;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "Claim [custId=" + custId + ", polyNo=" + polyNo + ", acciDvsn=" + acciDvsn + ", dmndResnCode="
				+ dmndResnCode + ", vlidHospOtda=" + vlidHospOtda + ", hospCode=" + hospCode + ", chmeLiceNo="
				+ chmeLiceNo + ", heedHospYn=" + heedHospYn + ", id=" + id + "]";
	}
}
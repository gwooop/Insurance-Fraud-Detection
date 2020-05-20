package com.stack.ins.product.model;

public class Cust {
	
	private int custId;
	private int dividedSet;
	private String siuCustYN;
	private int sex;
	private int age;
	private int resiCost;
	private double resiTypeCode;
	private String ctpr;
	private String occpGrp1;
	private double totalPrem;
	private String weddYn;
	private String mateOccpGrp1;
	private double chldCnt;
	private int ltbnChldAge;
	private double maxPrm;
	private double custIncm;
	private int rcbaseHshdIncm;
	private double jpbaseHshdIncm;
	public int getCustId() {
		return custId;
	}
	public int getDividedSet() {
		return dividedSet;
	}
	public String getSiuCustYN() {
		return siuCustYN;
	}
	public int getSex() {
		return sex;
	}
	public int getAge() {
		return age;
	}
	public int getResiCost() {
		return resiCost;
	}
	public double getResiTypeCode() {
		return resiTypeCode;
	}
	public String getCtpr() {
		return ctpr;
	}
	public String getOccpGrp1() {
		return occpGrp1;
	}
	public double getTotalPrem() {
		return totalPrem;
	}
	public String getWeddYn() {
		return weddYn;
	}
	public String getMateOccpGrp1() {
		return mateOccpGrp1;
	}
	public double getChldCnt() {
		return chldCnt;
	}
	public int getLtbnChldAge() {
		return ltbnChldAge;
	}
	public double getMaxPrm() {
		return maxPrm;
	}
	public double getCustIncm() {
		return custIncm;
	}
	public int getRcbaseHshdIncm() {
		return rcbaseHshdIncm;
	}
	public double getJpbaseHshdIncm() {
		return jpbaseHshdIncm;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public void setDividedSet(int dividedSet) {
		this.dividedSet = dividedSet;
	}
	public void setSiuCustYN(String siuCustYN) {
		this.siuCustYN = siuCustYN;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setResiCost(int resiCost) {
		this.resiCost = resiCost;
	}
	public void setResiTypeCode(double resiTypeCode) {
		this.resiTypeCode = resiTypeCode;
	}
	public void setCtpr(String ctpr) {
		this.ctpr = ctpr;
	}
	public void setOccpGrp1(String occpGrp1) {
		this.occpGrp1 = occpGrp1;
	}
	public void setTotalPrem(double totalPrem) {
		this.totalPrem = totalPrem;
	}
	public void setWeddYn(String weddYn) {
		this.weddYn = weddYn;
	}
	public void setMateOccpGrp1(String mateOccpGrp1) {
		this.mateOccpGrp1 = mateOccpGrp1;
	}
	public void setChldCnt(double chldCnt) {
		this.chldCnt = chldCnt;
	}
	public void setLtbnChldAge(int ltbnChldAge) {
		this.ltbnChldAge = ltbnChldAge;
	}
	public void setMaxPrm(double maxPrm) {
		this.maxPrm = maxPrm;
	}
	public void setCustIncm(double custIncm) {
		this.custIncm = custIncm;
	}
	public void setRcbaseHshdIncm(int rcbaseHshdIncm) {
		this.rcbaseHshdIncm = rcbaseHshdIncm;
	}
	public void setJpbaseHshdIncm(double jpbaseHshdIncm) {
		this.jpbaseHshdIncm = jpbaseHshdIncm;
	}
	@Override
	public String toString() {
		return "Cust [custId=" + custId + ", dividedSet=" + dividedSet + ", siuCustYN=" + siuCustYN + ", sex=" + sex
				+ ", age=" + age + ", resiCost=" + resiCost + ", resiTypeCode=" + resiTypeCode + ", ctpr=" + ctpr
				+ ", occpGrp1=" + occpGrp1 + ", totalPrem=" + totalPrem + ", weddYn=" + weddYn + ", mateOccpGrp1="
				+ mateOccpGrp1 + ", chldCnt=" + chldCnt + ", ltbnChldAge=" + ltbnChldAge + ", maxPrm=" + maxPrm
				+ ", custIncm=" + custIncm + ", rcbaseHshdIncm=" + rcbaseHshdIncm + ", jpbaseHshdIncm=" + jpbaseHshdIncm
				+ "]";
	}

}

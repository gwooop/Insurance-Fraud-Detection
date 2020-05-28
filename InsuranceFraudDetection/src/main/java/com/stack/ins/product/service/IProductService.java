package com.stack.ins.product.service;

import java.util.List;

import com.stack.ins.member.model.CustManager;
import com.stack.ins.product.model.Claim;
import com.stack.ins.product.model.Cust;

public interface IProductService {
	// 고객 정보 넣기
	void insertCustData(Cust cust);
	// 고객 청구 정보 넣기
	void insertClaimData(Claim claim);
	// 고객 중 제일 최근 CUST_ID값 가져오기
	int selectLastCustNumber();
	// 청구 정보 중 제일 최근 ID 값 가져오기
	int selectLastIdNumber();	
	// 고객의 청구횟수 가져오기
	int selectClaimCountNumber(CustManager custId);
	// 고객 정보 가져오기
	List<Cust> selectCustData(int custId);
	// 고객 청구 정보 가져오기
	List<Claim> selectClaimData(int custId);
	// 고객 정보 변경
	void updateCustData(Cust cust);
}

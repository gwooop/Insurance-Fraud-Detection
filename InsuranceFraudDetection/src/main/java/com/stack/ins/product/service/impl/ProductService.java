package com.stack.ins.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.stack.ins.member.model.CustManager;
import com.stack.ins.product.dao.IProductRepository;
import com.stack.ins.product.model.Claim;
import com.stack.ins.product.model.Cust;
import com.stack.ins.product.service.IProductService;
@Service
public class ProductService implements IProductService {

	@Autowired
	IProductRepository productDao;
	
	@Override
	public void insertCustData(Cust cust) {
		productDao.insertCustData(cust);
	}

	@Override
	public void insertClaimData(Claim claim) {
		productDao.insertClaimData(claim);
	}

	@Override
	public int selectLastCustNumber() {
		return productDao.selectLastCustNumber();
	}

	@Override
	public int selectLastIdNumber() {
		return productDao.selectLastIdNumber();
	}
	
	@Override
	public int selectClaimCountNumber(CustManager custId) {
		return productDao.selectClaimCountNumber(custId);
	}
	
	@Override
	public List<Cust> selectCustData(int custId) {
		return productDao.selectCustData(custId);
	}
	
	@Override
	public List<Claim> selectClaimData(int custId) {
		return productDao.selectClaimData(custId);
	}

	@Override
	public void updateCustData(Cust cust) {
		productDao.updateCustData(cust);
	}
}

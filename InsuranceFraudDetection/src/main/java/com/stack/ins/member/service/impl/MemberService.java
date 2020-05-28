package com.stack.ins.member.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stack.ins.member.dao.IMemberRepository;
import com.stack.ins.member.model.CustManager;
import com.stack.ins.member.model.Member;
import com.stack.ins.member.service.IMemberService;
@Service
public class MemberService implements IMemberService {

	@Autowired
	IMemberRepository memberDao;
	
	@Override
	public void insertMember(Member member) {
		memberDao.insertMember(member);

	}

	@Override
	public Member selectMember(String userId) {
//		System.out.println("test 성공");
		return memberDao.selectMember(userId);
		
	}

	@Override
	public List<Member> selectAllMembers() {
		// TODO Auto-generated method stub
		return memberDao.selectAllMembers();
	}

	@Override
	public void updateMember(Member member) {
		memberDao.updateMember(member);

	}

	@Override
	public void saveDeleteMember(String userId) {
		// TODO Auto-generated method stub
		memberDao.saveDeleteMember(userId);
		

	}

	@Override
	public List<Member> getDeleteMember(int delCount) {
		return memberDao.getDeleteMember(delCount);
		

	}

	@Override
	public void deleteMember(Member member) {
		memberDao.deleteMember(member);

	}

	@Override
	public String getPassword(String userId) {
		return memberDao.getPassword(userId);
	}

	@Override
	public int getAllMemberCount(int delCount) {
		return memberDao.getAllMemberCount(delCount);
	}

	@Override
	public int getAllMemberCount() {
		return memberDao.getAllMemberCount();
	}

	@Override
	public List<Member> selectLimitMembers(int start, int end) {
		return memberDao.selectLimitMembers(start, end);
	}

	@Override
	public void insertCustId(int custManagerId, int custId) {
		memberDao.insertCustId(custManagerId, custId);
	}
	
	@Override
	public void deleteCustId(int custId) {
		memberDao.deleteCustId(custId);
	}

	@Override
	public List<CustManager> getCustId(int custManagerId) {
		System.out.println();
		return memberDao.getCustId(custManagerId);
	}

	@Override
	public int getAllCountCustId(int custManagerId) {
		return memberDao.getAllCountCustId(custManagerId);
	}

	@Override
	public List<CustManager> getLimitCustId(int custManagerId, int start, int end) {
		return memberDao.getLimitCustId(custManagerId, start, end);
	}





}

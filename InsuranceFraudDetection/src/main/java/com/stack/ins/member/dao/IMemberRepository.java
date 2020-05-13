package com.stack.ins.member.dao;

import java.util.List;



import org.apache.ibatis.annotations.Param;

import com.stack.ins.member.model.CustManager;
import com.stack.ins.member.model.Member;
public interface IMemberRepository {

//	회원 가입
	void insertMember(Member member);
//  특정 회원 선택 
	Member selectMember(String userId);
//	모든 회원 선택
	List<Member> selectAllMembers();
//  회원 정보 수정하기
 	void updateMember(Member member);
// 	회원 삭제 (db 에는 삭제하지 않음) 기본 0  삭제시 1 -> 북구도 가능 함 
	void saveDeleteMember(String userId);
//  삭제된 아이디 or 삭제되지 않은 아이디 가져오기 (db에서 삭제 되지 않음)
	List<Member> getDeleteMember(int delCount);
//  회원 삭제 (db 에서 완전히 삭제)
	void deleteMember(Member member);
//  비밀번호 가져오기 
	String getPassword(String userId);
// 	회원 총 숫자 가져오기
	int getAllMemberCount();
	int getAllMemberCount(@Param("delCount") int delCount);
	
// 회원 명수 제안해서 가져오기
   List<Member> selectLimitMembers(@Param("start") int start, @Param("end") int end);
   
// custId 값 넣기
   void insertCustId(@Param("custManagerId") int custManagerId , @Param("custId")int custId);
// custId 값 가져오기
   List<CustManager> getCustId(@Param("custManagerId") int custManagerId);
   
}
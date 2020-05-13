package com.stack.ins.member.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.stack.ins.member.model.Member;
import com.stack.ins.member.service.IMemberService;


@Controller
public class MemberController {
	
	
	@Autowired
	IMemberService memberService;
	
	/*
	 * @GetMapping(value="/admin") public String showMemberList(Model model) {
	 * List<Member> memberList = memberService.selectAllMembers();
	 * model.addAttribute("memberList", memberList); return "member/admin"; }
	 */
	
	
	
	// 회원 가입 폼으로 가기

	@GetMapping(value="/member/insert")
	public String insertFrom(Model model) {
		
		List<Member> memberList = memberService.selectAllMembers();
		model.addAttribute("memberList", memberList);
		return "member/insert";
	}

	@PostMapping(value="/member/insert")
	public String insertMember(String userId, String name, String password, String email, String phone, @RequestParam("birth") @DateTimeFormat(pattern="yyyy-MM-dd") Date birth, Model model) {
		
		try {
			Member member = new Member();
			member.setUserId(userId);
			member.setName(name);
			member.setPassword(password);
			member.setEmail(email);
			member.setPhone(phone);
			member.setBirth(birth);
			System.out.println(member);
			memberService.insertMember(member);
			
			model.addAttribute("message", "회원가입 완료!");
			System.out.println("회원가입된 호원 정보  =" + member);

			return "redirect:/member/login";
		} catch (Exception e) {
			model.addAttribute("message", "이미 사용하고 있는 아이디,이메일 입니다.");
			e.printStackTrace();
			return "common/error";
		}
		

	}
//   how to post in date
//	@PostMapping(value="/member/insert")
//	public String insertMember(Member member, Model model) {
////		Member member = new Member();
////		member.setUserId(userId);
////		member.setName(name);
////		member.setPassword(password);
////		member.setEmail(email);
////		member.setPhone(phone);
////		member.setBirth(birth);
//		System.out.println(member);
//		memberService.insertMember(member);
//
//		model.addAttribute("message", "회원가입 완료!");
//		System.out.println("회원가입된 호원 정보  =" + member);
//
//		return "member/login";
//	}


	// 로그인 폼으로 가기 

	@GetMapping(value="/member/login")
	public String loginFrom() {
		return "member/login";
	}
	// 로그인 하기 

	@PostMapping(value="/member/login")
	public String login(String userId, HttpSession session, String password, Model model) {
		Member member = memberService.selectMember(userId);
		
		if(member != null  && member.getDelCount() == 0) {
			System.out.println(member.toString());
			String dbPassword = member.getPassword();
				if(dbPassword == null) {
				//아이디가 없음
					model.addAttribute("message", "아이디가 없습니다.");
			}else {
				//아이디 있음
		
				if(dbPassword.equals(password)) {
					//비밀번호 일치
					System.out.println("member.getCustManagerId():"+member.getCustManagerId());
					session.setAttribute("userId", userId);
					session.setAttribute("name", member.getName());
					session.setAttribute("email", member.getEmail());
					session.setAttribute("birth", member.getBirth());
					session.setAttribute("custManagerId", member.getCustManagerId());
					model.addAttribute("member", member);
					model.addAttribute("message", "환영 합니다!");
						return "member/login";
				}else {
					//비밀번호 불일치
					model.addAttribute("message", "비밀 번호가 일치하지 않습니다!");
				}
			}
		}else {
			model.addAttribute("message", "아이디가 존재하지 않습니다.");
		}
		session.invalidate();	
		return "member/login";
	}

	@GetMapping(value="/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/login";
	}

	@RequestMapping(value="/member/delete", method=RequestMethod.GET)
	public String deleteMember(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		if(userId != null && !userId.equals("")) {
			Member member = memberService.selectMember(userId);
			model.addAttribute("member", member);
			model.addAttribute("message", "아이디 삭제");
			return "member/delete";
		}else {
			//userid가 세션에 없을 경우 (로그인 하지 않았을 경우)
			model.addAttribute("message", "로그인을 하지 않았습니다.");
			return "member/login";
		}
	}

	@PostMapping(value="/member/delete")
	public String deleteMember(String password, String userId, HttpSession session, Model model) {
	
		
		try {
//			System.out.println(member.toString());
				Member member = memberService.selectMember(userId);
				if(password != null && password.equals(member.getPassword())) {
					
					memberService.saveDeleteMember(userId);
					model.addAttribute("message", "회원 탈퇴 성공!");
					session.invalidate();
					return "member/login";
				}else {
					model.addAttribute("message", "비밀번호가 틀립니다.");
					model.addAttribute("member", member);
					return "member/delete";
				}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "에러 입니다. 관리자에게 문의하세요");
			return "common/error";
		}
		


		
	}
	
	
//	@RequestMapping(value="/member/delete", method=RequestMethod.POST)
//	public String deleteMember(String password, HttpSession session, Model model) {
//		try {
//			Member member = new Member();
//			member.setUserId((String)session.getAttribute("userId"));
//			String dbpw = memberService.getPassword(member.getUserId());
//			System.out.println(dbpw);
//			if(password != null && password.equals(dbpw)) {
//				member.setPassword(password);
//				memberService.saveDeleteMember(member);
//				session.invalidate();//삭제되었으면 로그아웃 처리
//				return "member/login";
//			}else {
//				model.addAttribute("message", "WRONG_PASSWORD");
//				return "member/delete";
//			}
//		}catch(Exception e){
//			model.addAttribute("message", "DELETE_FAIL");
//			e.printStackTrace();
//			return "member/delete";
//		}
//	}

	// 업데이트 페이지로 가기 

	@GetMapping(value="/member/update")
	public String updateMember(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		if(userId != null && !userId.equals("")) {
			Member member = memberService.selectMember(userId);
			model.addAttribute("member", member);
			model.addAttribute("message", "회원 정보 수정");
			return "member/update";
		}else {
			model.addAttribute("message", "로그인 하지 않았습니다.");
		}
		return "member/login";
	}

	@PostMapping(value="/member/update")
	public String updateMember(Member member , HttpSession session, Model model) {
		try {
			memberService.updateMember(member);
			model.addAttribute("message", "회원 정보");
			model.addAttribute("member", member);
			session.setAttribute("email", member.getEmail());
			return "member/login";
		}catch (Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
			return "member/error";
		}
		
	}

}

package com.stack.ins.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stack.ins.board.service.IBoardService;
import com.stack.ins.member.model.Member;
import com.stack.ins.member.service.IMemberService;


@Controller
public class AdminController {
	

@Autowired
IMemberService memberService;



// ++++++++++++++++++++++++++++++++ USER 관리 +++++++++++++++++++++++++++++++++++++++++++++++++
	@GetMapping(value="/admin")
	public String showMemberList(Model model) {
		try {
			List<Member> memberList = memberService.selectAllMembers();
			model.addAttribute("memberList", memberList);
			return "admin/main";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/main";
	}	
	

//  어드민 로그인으로 가기
	@GetMapping(value="/admin/login")
	public String goToAdminPage() {
		
		return "admin/adminLogin";
	}
	
// 어드민 로그인으로 가서 검증 받기
	@PostMapping(value="/admin/login")
	public String goToAdminPage(String userId, String password, HttpSession session) {
		
		
		return "admin/main";
	}
//	어드민 USER PROFILE 로 가기 
	@GetMapping(value= {"/admin/user/{userId}", "/admin/user"})
	public String goToUser(@PathVariable String userId, Model model) {
		Member member = memberService.selectMember(userId);
		model.addAttribute("member", member);
		return "admin/user";
	}
	@GetMapping(value="/admin/table")
	public String goToUserTable(Model model) {
		
		try {
			List<Member> memberList = memberService.selectAllMembers();
			int totalCount = memberService.getAllMemberCount();
			model.addAttribute("memberList", memberList);
			model.addAttribute("totalCount",totalCount);
			
			return "admin/tables";
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/tables";
		

	}
	@GetMapping(value="/admin/table/{currentPage}")
	public String goToUserTable(@PathVariable int currentPage,Model model) {
		
		try {
			int totalCount = memberService.getAllMemberCount();
			System.out.println("currentPage:" +currentPage);
			int start = currentPage*10 - 9;
			int end = currentPage*10;
			if (end> totalCount) {
				end = 9999;
			}

			List<Member> memberList = memberService.selectLimitMembers(start, end);
			
			model.addAttribute("memberList", memberList);
			model.addAttribute("totalCount",totalCount);
			model.addAttribute("currentPage",currentPage);
			return "admin/tables";
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/tables";
		

	}	
	
	

//	관리자 페이지 ajax 테이블 
	@GetMapping(value="/del/{delCount}")
	@ResponseBody
	public List<Member> getDeleteMember(@PathVariable int delCount){
		System.out.println(delCount);
		List<Member> delMemberList = memberService.getDeleteMember(delCount);
		System.out.println(delMemberList);
		return delMemberList;
	}
	
// 관리자 페이지 유저 삭제 하기 
   @GetMapping(value="/delete/{userId}")
   @ResponseBody
   public String  DeleteMemberFromAdmin(@PathVariable String userId) {
	  
//	   memberService.saveDeleteMember(userId);
	   
	   return userId;
   }
// 관리자 페이지 유저 복구 하기 
   @GetMapping(value="/restore/{userId}")
   @ResponseBody
   public String  RestoreMemberFromAdmin(@PathVariable String userId) {
	  
//	   memberService.saveDeleteMember(userId);
	   
	   return userId;
   }	
	

// ++++++++++++++++++++++++++++++++ BOARD관리 +++++++++++++++++++++++++++++++++++++++++++++++++
	@Autowired	
	IBoardService boardService;
	
	
}

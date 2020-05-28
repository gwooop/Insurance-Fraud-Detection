package com.stack.ins.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stack.ins.member.model.CustManager;
import com.stack.ins.member.model.Member;
import com.stack.ins.member.service.IMemberService;
import com.stack.ins.product.model.Claim;
import com.stack.ins.product.model.Cust;
import com.stack.ins.product.service.IProductService;

import jdk.internal.instrumentation.InstrumentationMethod;

@Controller
public class ProductController {
	
	@Autowired
	IProductService productService;
	
	@Autowired
	IMemberService memberService;

	
// 로그인 하지 않을 시 가지는 서비스 페이지
	@GetMapping("/product/services")
	public String goservicesNotLogIn() {
		
		return "product/servicesNotLogIn";
	}
	
//	custManagerId별 서비스 페이지
	@GetMapping("/product/services/{custManagerId}/{currentPage}")
	public String goServicePage(Claim claim, @PathVariable int custManagerId, @PathVariable int  currentPage ,Model model) {
	
		
		try {
			int custCount = memberService.getAllCountCustId(custManagerId);
			System.out.println("custCount :"+ custCount);
			model.addAttribute("custCount", custCount);
			int start = currentPage*10 - 9;
			int end = currentPage*10;
			if (end> custCount) {
				end = 9999;
				}	
			
			
//			custManager에 저장된 custId 불러오기
			List<CustManager> custList = memberService.getLimitCustId(custManagerId, start, end);
			model.addAttribute("custList",custList);
			System.out.println("custList : " + custList);
//			claim 청구횟수 불러오기
			List claimList = new ArrayList();
			for (int i=0; i<custList.size(); i++) {
				CustManager custId = (CustManager) custList.get(i);
				int claimTotal = productService.selectClaimCountNumber(custId);
				claimList.add(claimTotal);
			}
			model.addAttribute("claimList", claimList);
			return "product/servicesTable";
			
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "관리자에게 문의해 주세요!");
			return "common/error";
		}

	}
	
//	신규 고객 정보 입력 페이지
	@GetMapping("/product/custServices")
	public String goCustInsertForm() {
		return "product/custInsertForm";
	}
	
//	신규 고객 정보 등록
	@PostMapping("/product/custServices/{custManagerId}")
	public String insertCustData(Cust cust, Model model, @PathVariable int custManagerId) {
		
		try {
			productService.insertCustData(cust);
			//  cust_id 값 불러 오기
			int custId = productService.selectLastCustNumber();
			model.addAttribute("custId", custId);
			
			// cust_id 값 넣기 
			memberService.insertCustId(custManagerId, custId);
			return "redirect:/product/services/{custManagerId}/1";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "관리자에게 문의해 주세요!");
			return "common/error";
		}
		

	}
	
//	고객 청구 정보 입력 페이지
	@GetMapping("/product/claimServices/{custManagerId}/{custId}")
	public String goClaimServicePage(@PathVariable int custManagerId, @PathVariable int custId) {
		return "product/claimServices";
	}
	
//	고객 청구 정보 등록
	@PostMapping("/product/claimServices/{custManagerId}/{custId}")
	public String insertClaimData(Claim claim, @PathVariable int custManagerId, Model model, @PathVariable int custId){
		// claim_data 값 넣기
		productService.insertClaimData(claim);
		return "redirect:/product/services/" + custManagerId+"/1";
	}
	
//	관리하는 고객 정보 페이지
	@GetMapping("/product/custManageServices/{userId}/{custManagerId}/{custId}/{currentPage}")
	public String custManagePage(@PathVariable int custManagerId, @PathVariable int custId, @PathVariable String userId, Model model, @PathVariable int currentPage) {
		try {
			
			int TotalCount = productService.getAllcountClaim(custId);
			model.addAttribute("TotalCount",TotalCount);
			model.addAttribute("custId", custId);
			int start = currentPage*10 - 10;
			int end = currentPage*10;
			if (end> TotalCount) {
				end = 9999;
			}	
			List<Claim> claimTotal = productService.selectLimitClaimData(custId, start, end);
			/* List<Claim> claimTotal = productService.selectClaimData(custId); */
			model.addAttribute("claimTotal", claimTotal);
			
			
			
			String password = memberService.getPassword(userId);
			model.addAttribute("password", password);
//			저장된 값을 화면에 보여주기 위해 HashMap으로 값 저장
			List<Cust> custOne = productService.selectCustData(custId);
			model.addAttribute("custOne", custOne);
			
			HashMap<Integer, String> sexList = new HashMap<Integer, String>();
			sexList.put(1, "남");
			sexList.put(2, "여");
			model.addAttribute("sexList", sexList);
			
			HashMap<Integer, String> ageList = new HashMap<Integer, String>();
			ageList.put(0, "0~9");
			ageList.put(1, "10~19");
			ageList.put(2, "20~29");
			ageList.put(3, "30~39");
			ageList.put(4, "40~49");
			ageList.put(5, "50~59");
			ageList.put(6, "60~69");
			ageList.put(7, "70~79");
			ageList.put(8, "80이상");
			model.addAttribute("ageList", ageList);
			
			HashMap<Integer, String> resiTypeList = new HashMap<Integer, String>();
			resiTypeList.put(11, "일반단독주택");
			resiTypeList.put(12, "다가구단독주택");
			resiTypeList.put(13, "영업겸용단독주택");
			resiTypeList.put(20, "아파트");
			resiTypeList.put(30, "연립다가구주택");
			resiTypeList.put(40, "상가등 비거주용건물");
			resiTypeList.put(50, "오피스텔");
			resiTypeList.put(60, "숙박업소의 객실");
			resiTypeList.put(70, "기숙사");
			resiTypeList.put(99, "그외");
			model.addAttribute("resiTypeList", resiTypeList);
			
			HashMap<String, String> occiList = new HashMap<String, String>();
			occiList.put("사무직", "사무직");
			occiList.put("서비스", "서비스");
			occiList.put("자영업", "자영업");
			occiList.put("전문직", "전문직");
			occiList.put("제조업", "제조업");
			occiList.put("주부", "주부");
			occiList.put("기타", "기타");
			occiList.put("1차산업", "1차산업");
			occiList.put("없음", "없음");
			model.addAttribute("occiList", occiList);
			
			HashMap<String, String> cptrList = new HashMap<String, String>();
			cptrList.put("서울", "서울");
			cptrList.put("대구", "대구");
			cptrList.put("충북", "충북");
			cptrList.put("경기", "경기");
			cptrList.put("광주", "광주");
			cptrList.put("충남", "충남");
			cptrList.put("전북", "전북");
			cptrList.put("대구", "대구");
			cptrList.put("부산", "부산");
			cptrList.put("인천", "인천");
			cptrList.put("울산", "울산");
			cptrList.put("경남", "경남");
			cptrList.put("전남", "전남");
			cptrList.put("대전", "대전");
			cptrList.put("강원", "강원");
			cptrList.put("제주", "제주");
			cptrList.put("세종", "세종");
			model.addAttribute("cptrList", cptrList);
			
			HashMap<String, String> weddList = new HashMap<String, String>();
			weddList.put("Y", "네");
			weddList.put("N", "아니요");
			model.addAttribute("weddList", weddList);
			
			HashMap<String, String> mateOcciList = new HashMap<String, String>();
			mateOcciList.put("사무직", "사무직");
			mateOcciList.put("서비스", "서비스");
			mateOcciList.put("자영업", "자영업");
			mateOcciList.put("전문직", "전문직");
			mateOcciList.put("제조업", "제조업");
			mateOcciList.put("주부", "주부");
			mateOcciList.put("기타", "기타");
			mateOcciList.put("1차산업", "1차산업");
			mateOcciList.put("없음", "없음");
			model.addAttribute("mateOcciList", mateOcciList);
			
			HashMap<Integer, String> chldList = new HashMap<Integer, String>();
			chldList.put(0, "없음");
			chldList.put(1, "1명");
			chldList.put(2, "2명");
			chldList.put(3, "3명");
			chldList.put(4, "4명");
			chldList.put(5, "5명");
			chldList.put(6, "6명이상");
			model.addAttribute("chldList", chldList);
			
			HashMap<Integer, String> ltbnChldList = new HashMap<Integer, String>();
			ltbnChldList.put(0, "0~9");
			ltbnChldList.put(1, "10~19");
			ltbnChldList.put(2, "20~29");
			ltbnChldList.put(3, "30대이상");	
			model.addAttribute("ltbnChldList", ltbnChldList);
			

			return "product/custManageServices";
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "관리자에게 문의해 주세요!");
			return "common/error";
		}
	}
	
//	고객 정보 삭제
	@PostMapping("/product/custManageServices/{custManagerId}/{custId}")
	public String deleteCustId(@PathVariable int custManagerId, @PathVariable int custId, Model model) {
		
		try {
			memberService.deleteCustId(custId);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "관리자에게 문의해 주세요!");
			return "common/error";
		}
		return "redirect:/product/services/{custManagerId}/1";
	}
	
//	고객 정보 수정 페이지
	@GetMapping("/product/custUpdate/{custManagerId}/{custId}")
	public String custUpdatePage(@PathVariable int custId, Model model) {
			try {
				List<Cust> custOne = productService.selectCustData(custId);
				model.addAttribute("custOne", custOne);
	
//				저장된 값을 화면에 보여주기 위해 HashMap으로 값 저장
				HashMap<Integer, String> sexList = new HashMap<Integer, String>();
				sexList.put(1, "남");
				sexList.put(2, "여");
				model.addAttribute("sexList", sexList);
				
				HashMap<Integer, String> ageList = new HashMap<Integer, String>();
				ageList.put(0, "0~9");
				ageList.put(1, "10~19");
				ageList.put(2, "20~29");
				ageList.put(3, "30~39");
				ageList.put(4, "40~49");
				ageList.put(5, "50~59");
				ageList.put(6, "60~69");
				ageList.put(7, "70~79");
				ageList.put(8, "80이상");
				model.addAttribute("ageList", ageList);
				
				HashMap<Integer, String> resiTypeList = new HashMap<Integer, String>();
				resiTypeList.put(11, "일반단독주택");
				resiTypeList.put(12, "다가구단독주택");
				resiTypeList.put(13, "영업겸용단독주택");
				resiTypeList.put(20, "아파트");
				resiTypeList.put(30, "연립다가구주택");
				resiTypeList.put(40, "상가등 비거주용건물");
				resiTypeList.put(50, "오피스텔");
				resiTypeList.put(60, "숙박업소의 객실");
				resiTypeList.put(70, "기숙사");
				resiTypeList.put(99, "그외");
				model.addAttribute("resiTypeList", resiTypeList);
				
				HashMap<String, String> occiList = new HashMap<String, String>();
				occiList.put("사무직", "사무직");
				occiList.put("서비스", "서비스");
				occiList.put("자영업", "자영업");
				occiList.put("전문직", "전문직");
				occiList.put("제조업", "제조업");
				occiList.put("주부", "주부");
				occiList.put("기타", "기타");
				occiList.put("1차산업", "1차산업");
				occiList.put("없음", "없음");
				model.addAttribute("occiList", occiList);
				
				HashMap<String, String> cptrList = new HashMap<String, String>();
				cptrList.put("서울", "서울");
				cptrList.put("대구", "대구");
				cptrList.put("충북", "충북");
				cptrList.put("경기", "경기");
				cptrList.put("광주", "광주");
				cptrList.put("충남", "충남");
				cptrList.put("전북", "전북");
				cptrList.put("대구", "대구");
				cptrList.put("부산", "부산");
				cptrList.put("인천", "인천");
				cptrList.put("울산", "울산");
				cptrList.put("경남", "경남");
				cptrList.put("전남", "전남");
				cptrList.put("대전", "대전");
				cptrList.put("강원", "강원");
				cptrList.put("제주", "제주");
				cptrList.put("세종", "세종");
				model.addAttribute("cptrList", cptrList);
				
				HashMap<String, String> weddList = new HashMap<String, String>();
				weddList.put("Y", "네");
				weddList.put("N", "아니요");
				model.addAttribute("weddList", weddList);
				
				HashMap<String, String> mateOcciList = new HashMap<String, String>();
				mateOcciList.put("사무직", "사무직");
				mateOcciList.put("서비스", "서비스");
				mateOcciList.put("자영업", "자영업");
				mateOcciList.put("전문직", "전문직");
				mateOcciList.put("제조업", "제조업");
				mateOcciList.put("주부", "주부");
				mateOcciList.put("기타", "기타");
				mateOcciList.put("1차산업", "1차산업");
				mateOcciList.put("없음", "없음");
				model.addAttribute("mateOcciList", mateOcciList);
				
				HashMap<Integer, String> chldList = new HashMap<Integer, String>();
				chldList.put(0, "없음");
				chldList.put(1, "1명");
				chldList.put(2, "2명");
				chldList.put(3, "3명");
				chldList.put(4, "4명");
				chldList.put(5, "5명");
				chldList.put(6, "6명이상");
				model.addAttribute("chldList", chldList);
				
				HashMap<Integer, String> ltbnChldList = new HashMap<Integer, String>();
				ltbnChldList.put(0, "0~9");
				ltbnChldList.put(1, "10~19");
				ltbnChldList.put(2, "20~29");
				ltbnChldList.put(3, "30대이상");	
				model.addAttribute("ltbnChldList", ltbnChldList);
				
				List<Claim> claimTotal = productService.selectClaimData(custId); 
				model.addAttribute("claimTotal", claimTotal);
				return "product/custUpdate";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("message", "관리자에게 문의해 주세요!");
				return "common/error";
			}
	}
	
//	고객 정보 수정 완료
	@PostMapping("/product/custUpdate/{userId}/{custManagerId}/{custId}")
	public String commitUpdatePage(Cust cust, @PathVariable int custManagerId, @PathVariable int custId, @PathVariable String userId, Model model) {
		productService.updateCustData(cust);
		return "redirect:/product/custManageServices/{userId}/{custManagerId}/{custId}/1";
	}

}


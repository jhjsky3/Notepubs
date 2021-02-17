package com.notepubs.web.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.notepubs.web.entity.Member;
import com.notepubs.web.entity.MemberView;
import com.notepubs.web.service.MemberService;

@Controller("adminMemberController")
@RequestMapping("/admin/member/")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(name = "p", defaultValue = "1") int page,
			@RequestParam(name = "c1", defaultValue = "regdate") String column1,
			@RequestParam(name = "c2", defaultValue = "") String column2,
			@RequestParam(name = "c3", defaultValue = "") String column3,
			@RequestParam(name = "name", defaultValue = "") String name,
			Model model) {
		
		//가입일 노트공개수, 책공개수
//		c = 
//		regdate
//		notePubCnt,
//		bookPubCnt,
		
		System.out.printf(column1,column2, column3);
		
		List<MemberView> list = service.getViewList(page, column1, column2, column3, name); 
		int cnt = service.getCnt(page, column1, column2, column3, name);
		
		 
		model.addAttribute("list", list);
		model.addAttribute("cnt", cnt);
		
		return "admin.member.list";
	}
	
	
	@RequestMapping("detail")
	public String detail() {
		return "admin.member.detail";
	}

}


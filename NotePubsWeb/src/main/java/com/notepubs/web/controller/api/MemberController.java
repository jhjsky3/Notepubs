package com.notepubs.web.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.notepubs.web.entity.MemberView;
import com.notepubs.web.service.MemberService;

@RestController("apiMemberController")
@RequestMapping("/api/member/")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("list")
	public Map<String, Object> list(
			@RequestParam(name = "p", defaultValue = "1") int page,
			@RequestParam(name = "c1", defaultValue = "") String column1,
			@RequestParam(name = "c2", defaultValue = "") String column2,
			@RequestParam(name = "c3", defaultValue = "") String column3,
			@RequestParam(name = "name", defaultValue = "") String name) {
		
		//가입일 노트공개수, 책공개수
//		c = 
//		regdate
//		notePubCnt,
//		bookPubCnt,

		if(column1.equals("true"))
			column1 = "regdate";
		else
			column1 = "";

		
		if(column2.equals("true"))
			column2 = "notePubCnt";
		else
			column2 = "";
		
		
		if(column3.equals("true"))
			column3 = "bookPubCnt";
		else
			column3 = "";
		
		if(!column1.equals("true") && !column2.equals("true") && !column3.equals("true"))
			column1 = "regdate";
		
		List<MemberView> list = service.getViewList(page, column1, column2, column3, name); 
		int cnt = service.getCnt(page, column1, column2, column3, name);
	
		
		Map<String, Object> dto = new HashMap<>();
		dto.put("list", list);
		dto.put("cnt", cnt);
				
		return dto;
	}
	
	
	@RequestMapping("detail")
	public String detail() {
		return "admin.member.detail";
	}

}


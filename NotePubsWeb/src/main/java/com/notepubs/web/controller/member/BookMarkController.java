package com.notepubs.web.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("memberBookMarkController")
@RequestMapping("/member/bookmark/")
public class BookMarkController {
	
	@GetMapping("list")
	public String list() {
		
		return "member.bookmark.list";
	}

}

package com.notepubs.web.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("memberLikeController")
@RequestMapping("/member/like/")
public class LikeController {
	
	@GetMapping("list")
	public String list() {
		
		return "member.like.list";
	}

}

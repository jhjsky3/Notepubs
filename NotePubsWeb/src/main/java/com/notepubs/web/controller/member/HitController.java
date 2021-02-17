package com.notepubs.web.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("memberHitController")
@RequestMapping("/member/hit/")
public class HitController {
	
	@GetMapping("list")
	public String list() {
		
		return "member.hit.list";
	}

}

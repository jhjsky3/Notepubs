package com.notepubs.web.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("memberBookController")
@RequestMapping("/member/book/")
public class BookController {
	
	@RequestMapping("list")
	public String list() {
		return "member.book.list";
	}
	
	@RequestMapping("{id}")
	public String detail(@PathVariable int id) {
		
		return "member.book.detail";
	}
}

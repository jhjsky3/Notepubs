package com.notepubs.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller("adminBookController")
@RequestMapping("/admin/book/")
public class BookController {

	@RequestMapping("list")
	public String list(){
		return "admin.book.list";
	}
	
	@RequestMapping("detail")
	public String detail(){
		return "admin.book.detail";
	}

}

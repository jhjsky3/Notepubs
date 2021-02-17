package com.notepubs.web.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/notice/")
public class NoticeController {

		
	@RequestMapping("list")
	public String list() {
		
		return "admin.notice.list";
	}
	
}

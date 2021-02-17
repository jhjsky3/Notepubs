package com.notepubs.web.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.notepubs.web.entity.MyCategory;
import com.notepubs.web.service.MyCategoryService;

@Controller("memberCategoryController")
@RequestMapping("/member/category/")
public class CategoryController {
	
	@Autowired
	private MyCategoryService service;
	
	@RequestMapping("list")
	public String list(Model model) {
		
		List<MyCategory> list = service.getList();
		model.addAttribute("list", list);
		
		return "member.category.list";
	}

	
}

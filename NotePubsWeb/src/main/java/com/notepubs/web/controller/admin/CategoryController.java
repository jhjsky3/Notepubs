package com.notepubs.web.controller.admin;

import java.util.List;

import org.apache.ibatis.annotations.Lang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.notepubs.web.entity.Language;
import com.notepubs.web.service.LanguageService;

@Controller("adminCategoryController")
@RequestMapping("/admin/category/")
public class CategoryController {
	
	@Autowired
	private LanguageService service;
	
	@GetMapping("list")
	public String list(Model model) {
		
		List<Language> list = service.getList();
		
		model.addAttribute("list",list);
		
		return "admin.category.list";
	}

}

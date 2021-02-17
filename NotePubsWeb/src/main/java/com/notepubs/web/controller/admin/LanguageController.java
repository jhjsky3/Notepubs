package com.notepubs.web.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.LanguageCategory;
import com.notepubs.web.entity.LanguageView;
import com.notepubs.web.entity.Platform;
import com.notepubs.web.service.LanguageService;

@Controller
@RequestMapping("/admin/language/")
public class LanguageController {
	
	@Autowired
	private LanguageService service;
	
	@GetMapping("list")
	public String list(Model model) {
		
		List<LanguageView> list = service.getViewList();
		List<Platform> platformList = service.getPlatformList();
		List<LanguageCategory> languageCategoryList = service.getLanguageCategoryList(); 
		
		
		model.addAttribute("list",list);
		model.addAttribute("platformList",platformList);
		model.addAttribute("languageCategoryList", languageCategoryList);
		
		return "admin.language.list";
	}

	
}

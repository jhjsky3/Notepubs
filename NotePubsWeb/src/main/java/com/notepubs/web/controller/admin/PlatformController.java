package com.notepubs.web.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.notepubs.web.entity.Platform;
import com.notepubs.web.entity.PlatformCategory;
import com.notepubs.web.entity.PlatformView;
import com.notepubs.web.service.PlatformService;

@Controller
@RequestMapping("/admin/platform/")
public class PlatformController {
	
	@Autowired
	private PlatformService service;
	
	@GetMapping("list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page
			, String name, Model model) {
		
		List<Platform> list = new ArrayList<>();//service.getList(page, name);
		List<PlatformView> viewList = service.getViewList();
		List<PlatformCategory> platCategoryList = service.getPlatCategoryList();
		model.addAttribute("list", list);
		model.addAttribute("viewList",viewList);
		model.addAttribute("platCategoryList",platCategoryList);
		
		return "admin.platform.list";
	}
}

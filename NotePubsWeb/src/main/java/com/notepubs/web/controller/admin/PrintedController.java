package com.notepubs.web.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.notepubs.web.dao.PrintedDao;
import com.notepubs.web.entity.Printed;

@Controller("adminPintedController")
@RequestMapping("/admin/printed/")
public class PrintedController {
	
	@Autowired
	private PrintedDao printedDao;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(name = "t" , required = false) String title
			,Model model) {
		
//		List<Printed> list = printedDao.getList(title);
//		
//		model.addAttribute("list", list);
		
//		return "admin/printed/list";
		return "admin.printed.list";  //tiles
		
	}

}

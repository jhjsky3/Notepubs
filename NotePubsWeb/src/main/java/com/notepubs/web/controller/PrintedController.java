package com.notepubs.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.notepubs.web.dao.PrintedDao;
import com.notepubs.web.entity.Printed;

@Controller
@RequestMapping("/printed/")
public class PrintedController {
	
	@Autowired
	private PrintedDao printedDao;
	
	@RequestMapping("list")
	public String list(Model model) {
		
		List <Printed> list = printedDao.getList();
		
		model.addAttribute("list",list);
		
		return "home.printed.list";
	}

}

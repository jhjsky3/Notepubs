package com.notepubs.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.notepubs.web.entity.Book;
import com.notepubs.web.entity.BookView;
import com.notepubs.web.service.BookService;
@Controller
@RequestMapping("/book/")
public class BookController {
	@Autowired
	private BookService service;
	
	@RequestMapping("list")
	public String list(Model model) {
		
		List<BookView> list = service.getViewList(1, "title", "");
		model.addAttribute("list",list);
		
		return "home.book.list";
	}
	@RequestMapping("{id}")
	public String detail(Model model) {
		
		Book list = service.get(1);
		model.addAttribute("list",list);
		
		return "home.book.detail";
	}
}

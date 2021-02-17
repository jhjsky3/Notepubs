package com.notepubs.web.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.notepubs.web.entity.Language;
import com.notepubs.web.service.LanguageService;

@RestController("apiLanguageController")
@RequestMapping("/api/language")
public class LanguageController {
	
	@Autowired
	LanguageService service;

	@GetMapping("list")
	public List<Language> list(){
		
		List<Language> list = service.getList();
		
		return list;
	}
	
	@PostMapping("reg")
	public int reg(String name,int categoryId) {
		
		int memberId = 1;
		System.out.println("reg" + name);
		System.out.println("reg" + categoryId);
		int result = service.insert(name,memberId,categoryId);
		
		return result;
		
	}
	
	@GetMapping("{id}/delete")
	public int delete(@PathVariable("id")int id) {
		
		int result = service.langPlatDelete(id);
		result = service.delete(id);
		System.out.println("delete" + id);
		
		return result;
	}
	
	@PostMapping("{id}/update")
	public int update(String name, int id) {
		
		System.out.println("update" + id);
		System.out.println("update" + name);
		
		int result = service.update(name,id);
		
		return result;
		
	}
	
	
	
}

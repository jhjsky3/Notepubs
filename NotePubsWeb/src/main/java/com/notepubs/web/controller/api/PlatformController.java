package com.notepubs.web.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.notepubs.web.entity.Platform;
import com.notepubs.web.entity.PlatformView;
import com.notepubs.web.service.PlatformService;

@RestController("apiPlatformController")
@RequestMapping("/api/platform/")
public class PlatformController {
	
	@Autowired
	private PlatformService service;
	
	@GetMapping("list")
	public List<Platform> list() {
	
		List<Platform> list = service.getList();
				
		return list;
	}
	
	@PostMapping("reg")
	public int reg(String name, int categoryId) {
		
		int memberId = 1;
		int result = service.insert(name,memberId,categoryId);
		return result;
	}
	
	@GetMapping("{id}/delete")
	public int delete(@PathVariable("id") int id) {
		
		//int result = service.langPlatDelete(id);
		int result = service.delete(id);
		System.out.println(id);
		
		return result;
		
	}
}

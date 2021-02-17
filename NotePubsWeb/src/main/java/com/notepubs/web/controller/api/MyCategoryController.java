package com.notepubs.web.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

import com.notepubs.web.entity.MyCategory;
import com.notepubs.web.service.MyCategoryService;

@RestController("apiMyCategoryController")
@RequestMapping("/api/mycategory/")
public class MyCategoryController {

	@Autowired
	private MyCategoryService service;

	@GetMapping("list")
//	@ResponseBody
	public List<MyCategory> list(Model model) {
		
		
		 //	리스트를 가지고 넘겨준다.
		List<MyCategory> list = service.getList();
		
		System.out.println(list);
		
//		model.addAttribute("list", list);
		
		   return list;
	}
	
	@PostMapping("reg")
	public int reg(String name) {

		int memberId = 1;

		// 등록
		int result = service.insert(name, memberId);
		int id = service.getId(name, memberId);

		return result; // RestController에서 페이지 전환!!
	}
		
	@GetMapping("{id}/delete")
	public int delete(@PathVariable("id")int id) {
		
		int result = service.delete(id);
		System.out.println(id);
		
		return result;
	}
	
}

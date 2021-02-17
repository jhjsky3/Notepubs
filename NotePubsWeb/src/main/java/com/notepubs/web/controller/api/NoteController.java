package com.notepubs.web.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.notepubs.web.entity.Category;
import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.MyCategory;
import com.notepubs.web.entity.Note;
import com.notepubs.web.entity.NoteView;
import com.notepubs.web.entity.Platform;
import com.notepubs.web.service.NoteService;

@RestController("apiNoteController")
@RequestMapping("/api/note/")
public class NoteController {
	
	@Autowired
	private NoteService service;
	
	@RequestMapping("list")
	public Map<String, Object> list(
			@RequestParam (name="t", defaultValue = "") String query,
			@RequestParam (name="mc", defaultValue = "0") int myCategoryId,
			@RequestParam (name="c",defaultValue = "0")int categoryId,
			@RequestParam (name="lang",defaultValue = "0")int languageId,
			@RequestParam (name="pf",defaultValue = "0")int platformId,
			Model model, @RequestParam(defaultValue ="0") int id) {
			
		List<MyCategory> myCategoryList = service.getMyCategoryList();
		List<Category> categoryList = service.getCategoryList();
		List<Language> languageList = service.getLanguageList();
		List<Platform>	platformList = service.getPlatformList();
		
      
		int offset = id * 9;
		int size = offset +9;
		//List<NoteView> list =  service.getPubViewList(query,myCategoryId,categoryId,languageId,platformId); 
		List<NoteView> list = service.getPubViewList(query,myCategoryId,categoryId,languageId,platformId,offset,size); 
		Map<String, Object> mapList = new HashMap<>();
		
		mapList.put("list", list);
		mapList.put("myCategoryList", myCategoryList);
		mapList.put("categoryList", categoryList);
		mapList.put("languageList", languageList);
		mapList.put("platformList", platformList);
		
				
		return mapList;	
	}
	
	@GetMapping("{id}")
	public NoteView  detail(@PathVariable("id") int id) {
		System.out.println(id);
		
		NoteView n = service.get(id);
		return n;
	}
}

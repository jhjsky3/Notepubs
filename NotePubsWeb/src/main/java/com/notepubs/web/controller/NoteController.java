package com.notepubs.web.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.notepubs.web.entity.Category;
import com.notepubs.web.entity.Comment;
import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.MyCategory;
import com.notepubs.web.entity.Note;
import com.notepubs.web.entity.NoteView;
import com.notepubs.web.entity.Platform;
import com.notepubs.web.service.NoteService;

@Controller
@RequestMapping("/note/")
public class NoteController {
	
	@Autowired
	private NoteService service;
	
	@RequestMapping("list")
	public String list(@RequestParam(name="m",defaultValue="0") int myCategoryId,
			@RequestParam(name="c",defaultValue="0") int categoryId,
			@RequestParam(name="lang",defaultValue="0") int languageId,
			@RequestParam(name="plat",defaultValue="0") int platformId,
			@RequestParam(name="q",defaultValue="")String query,
       	Model model) {
		
		int offset = 0*9;
		int size = offset +9;
		
		List<NoteView> list2 = service.getPubViewList(query,myCategoryId,categoryId,languageId,platformId,offset,size); 
		
		model.addAttribute("list2", list2);
		
		List<MyCategory> myCategoryList = service.getMyCategoryList();
		List<Category> categoryList = service.getCategoryList();
		List<Language> languageList = service.getLanguageList();
		List<Platform>	platformList = service.getPlatformList();
		
		model.addAttribute("myCategoryList", myCategoryList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("languageList", languageList);
		model.addAttribute("platformList", platformList);
		
		return "home.note.list";
	}
	
	@RequestMapping("{id}/like")
	public String like(@PathVariable("id")int id, Principal principal) {
		
		if(principal != null) {
			String writerId = principal.getName();
			int memberId = service.getMemberId(writerId);
			service.likeUp(id, memberId);
		}
		
		return "redirect:../"+id;
	}
	
	@RequestMapping("{id}")
	public String detail(@PathVariable("id")int id, Model model, Principal principal) {

		if(principal != null) {
			String nicName = principal.getName();
			int memberId = service.getMemberId(nicName);
			boolean likeStatus = service.hasLike(id, memberId);
			model.addAttribute("likeStatus", likeStatus);
		}
		
		int result = service.hitUp(id);
		NoteView note = service.getView(id); //detail
		
		Note prev = service.getPrev(id);
		Note next = service.getNext(id);
		
    
		System.out.println(prev);
		System.out.println(next);
		
		
		model.addAttribute("n", note);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);
		
		return "home.note.detail";
	}
	
}

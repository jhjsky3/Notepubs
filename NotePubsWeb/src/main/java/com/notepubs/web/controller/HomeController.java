package com.notepubs.web.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.notepubs.web.entity.NoteView;
import com.notepubs.web.service.NoteService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private NoteService service; 
	
	@RequestMapping("index")
	public String index(Model model, Principal principal) {
		
		String writerId = "";
		
		if(principal==null)
			writerId = "";
		else
			writerId = principal.getName();
		
		List<NoteView> hitNoteList = service.getHitTopViewList();
		List<NoteView> newNoteList = service.getNewViewList();
		model.addAttribute("hitNoteList", hitNoteList);
		model.addAttribute("newNoteList", newNoteList);
		model.addAttribute("writerId", writerId);
		
		return "home.index";
	}
}

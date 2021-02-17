package com.notepubs.web.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.notepubs.web.dao.CommentDao;
import com.notepubs.web.dao.NoteDao;
import com.notepubs.web.entity.Comment;
import com.notepubs.web.entity.Note;

@Controller("adminNoteController")
@RequestMapping("/admin/note/")
public class NoteController {
	
	@Autowired
	private NoteDao noteDao; 
	@Autowired
	private CommentDao commentDao; 
	
	@RequestMapping("list")
	public String list(Model model) {
		
		//List<Note> list = noteDao.getList();
		List<Comment> commlist = commentDao.getList();
		
		//model.addAttribute("list", list);
		model.addAttribute("commList", commlist);
		
		return "admin.note.list";
	}
}

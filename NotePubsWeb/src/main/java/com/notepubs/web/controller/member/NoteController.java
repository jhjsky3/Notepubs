package com.notepubs.web.controller.member;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.notepubs.web.entity.Category;
import com.notepubs.web.entity.Language;
import com.notepubs.web.entity.MyCategory;
import com.notepubs.web.entity.Note;
import com.notepubs.web.entity.NoteView;
import com.notepubs.web.entity.Platform;
import com.notepubs.web.service.NoteService;

@Controller("memberNoteController")
@RequestMapping("/member/note/")
public class NoteController {
	
	@Autowired
	private NoteService service;
	
	@GetMapping("list")
	public String list(Model model, Principal principal) {
			
		//지금 로그인한 memberId를 얻어와서 리스트를 뿌리는데 이용해야한다 
		String writerId = principal.getName();
		int memberId = service.getMemberId(writerId); 
		
		List<MyCategory> myCategoryList = service.getMyCategoryListByMemberId(memberId);//카테고리는 memberId로 찾을 수 있다 writerId은 없다
		List<Category> categoryList = service.getCategoryList();
		List<Language> languageList = service.getLanguageList();
		List<Platform>	platformList = service.getPlatformList();
		
		List<NoteView> list = service.getViewListByWriterId(writerId); //로그인한 사람의 리스트 // 정렬 기본 -등록 최신순
		
//		for(int i=0; i<list.size(); i++) {
//			System.out.println(list.get(i).getTitle());
//		}
		
		model.addAttribute("myCategoryList", myCategoryList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("languageList", languageList);
		model.addAttribute("platformList", platformList);
		model.addAttribute("list", list);
		
		return "member.note.list";
	}
	
	@GetMapping("reg")
	public String reg(Model model) {
				
		return "member/note/reg";
	}
	
	@PostMapping("reg") //reg.jsp < input form="frm1"> 설정이 여기를 호출한다.
	public String reg(Note note, Principal principal) {
		
		String writerId = principal.getName();
		int memberId = service.getMemberId(writerId);
		
		note.setMemberId(memberId);
		service.insert(note);
				
		return "redirect:list";
	}
	
	@GetMapping("{id}/edit") //edit 페이지 초기 화면을 위한 컨트롤러 (저장되어 있는 내용을 기본적으로 보여주어야 한다)
	public String edit(@PathVariable("id")int id, Model model){
		

		Note note = service.get(id);//noteId 로 셀렉트해서 하나 받기 
		
		model.addAttribute("note", note);
		
		return "member/note/edit";
	}
	
	@PostMapping("{id}/edit") //edit 페이지 저장 버튼을 누르면 필요한 컨트롤러
	public String edit() {
		
		return "redirect:../list";
	}
	
	@GetMapping("{id}/pub")
	public String pub(@PathVariable("id")int id, @RequestParam("s") Boolean status){
		
		int result = service.pub(id, status);//noteId 로 셀렉트해서 하나 받기 
		
		return "redirect:../list";
	}
	
	@GetMapping("{id}/delete")
	public String delete(@PathVariable("id")int id){
		
		int result = service.delete(id);//noteId 로 셀렉트해서 하나 받기 
		
		return "redirect:../list";
	}
	
	
}

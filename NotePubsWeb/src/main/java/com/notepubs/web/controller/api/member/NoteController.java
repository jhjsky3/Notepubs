package com.notepubs.web.controller.api.member;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

import com.notepubs.web.entity.Note;
import com.notepubs.web.entity.NoteView;
import com.notepubs.web.service.NoteService;


@RestController("apiMemberNoteController")
@RequestMapping("/api/member/note/")
public class NoteController {	
	@Autowired
	private NoteService service;
	
	@GetMapping("list")
	public List<NoteView> list(Model model, Principal principal) {
		System.out.println("list 호출");
		
		//지금 로그인한 memberId를 얻어와서 리스트를 뿌리는데 이용해야한다 
		String writerId = principal.getName();
		//int memberId = service.getId(writerId);  
			
//		List<MyCategory> myCategoryList = service.getMyCategoryListByMemberId(memberId); //카테고리는 memberId로 찾을 수 있다 writerId은 없다
//		List<Category> categoryList = service.getCategoryList();
//		List<Language> languageList = service.getLanguageList();
//		List<Platform>	platformList = service.getPlatformList();
		
		List<NoteView> list = service.getListByWriterId(writerId);//로그인한 사람의 리스트 // 정렬 기본 -등록 최신순
		
		//============================================================================================
//		Map<String, Object> mapList = new HashMap<>();
//		
//		mapList.put("list", list);
//		mapList.put("myCategoryList", myCategoryList);
//		mapList.put("categoryList", categoryList);
//		mapList.put("languageList", languageList);
//		mapList.put("platformList", platformList);
//		
//		model.addAttribute("list", list);
//		model.addAttribute("myCategoryList", myCategoryList);
//		model.addAttribute("categoryList", categoryList);
//		model.addAttribute("languageList", languageList);
//		model.addAttribute("platformList", platformList);
		//============================================================================================
				
		return list;
	}
	
	@PostMapping("reg")
	public RedirectView reg(String title, String content, Principal principal ) {
		
		String writerId = principal.getName();
		int memberId = service.getMemberId(writerId);  
		
		
		int result = service.insert(memberId, writerId, title, content);
		
//		return result;
		return  new RedirectView("list"); //list 호출하지 못함
//		return  "redirect:/list";
	}
	
	@GetMapping("{id}/delete")
	public int delete(@PathVariable("id")int id) {
		
		System.out.printf("delete id: %d\n" ,id);
		
		int result = service.delete(id);
		
		return result;
	}
	
	@PostMapping("delete")
	public int delete(int [] ides) {
		
		for(int i=0; i<ides.length; i++)
			System.out.printf("삭제될 NoteId : %d\n", ides[i]);
		
		int result = service.deleteAll(ides);
		
		return result;
	}
	
	@PostMapping("edit")
	public RedirectView edit(int id,String title, String content, Principal principal ) {
		
		String writerId  = principal.getName(); 
		int memberId = service.getMemberId(writerId);  
		
		Note note = new Note();
		note.setId(id);
		note.setMemberId(memberId);
		note.setTitle(title);
		note.setContent(content);
		
		int result = service.update(note);
		
//		return result;
		return  new RedirectView("list"); //list 호출하지 못함
//		return  "redirect:/list";
	}
	
	
	@GetMapping("{id}/pub") //선택공개
	public boolean pub(@PathVariable("id")int id) {
		boolean result=false;
		
		System.out.printf("pub id:%d\n", id);
		//공개여부 값 얻어오기 
		int pub_ = service.getPub(id);
		
		System.out.println(pub_);
		
		if(pub_ == 0 ) {
			service.pub(id);
				result = true;
			
		}
		else //1이면 (이미 공개이면)
			result = false;
		
		
		return result;
	}

	@PostMapping("pub")
	public int pub(int [] ids) {
		
		for(int i=0; i<ids.length; i++)
			System.out.printf("공개될 NoteId : %d\n", ids[i]);
		
		int result = service.pubAll(ids);
//		System.out.printf("delete 수 : %d\n", result);
		
		return result;
	}
	
	
}

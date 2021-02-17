package com.notepubs.web.config;

import java.util.List;
import java.util.Map;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.notepubs.web.entity.Member;
import com.notepubs.web.entity.NoteView;
import com.notepubs.web.service.MemberService;
import com.notepubs.web.service.NoteService;

public class NoteViewPreparer implements ViewPreparer{

	@Autowired
	private NoteService service;
	
	@Autowired
	private MemberService memberService;
	
	@Override
	public void execute(Request tilesContext, AttributeContext attributeContext) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println(auth);
		System.out.println(auth.getName());
		if(auth != null) {
			String nicName = auth.getName();
			Member member = memberService.getByNicName(nicName);
			Map<String,Object>model = tilesContext.getContext("request");
			model.put("member", member);
		}
		
		List<NoteView> list = service.getPubViewList();
		Map<String,Object>model = tilesContext.getContext("request");
		model.put("asideNoteList", list);
		
	}

}

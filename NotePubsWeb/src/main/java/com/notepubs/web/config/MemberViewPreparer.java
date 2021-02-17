package com.notepubs.web.config;

import java.util.Map;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.notepubs.web.entity.Member;
import com.notepubs.web.service.MemberService;

public class MemberViewPreparer implements ViewPreparer{

	@Autowired
	private MemberService service;
	@Override
	public void execute(Request tilesContext, AttributeContext attributeContext) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		String nicName = auth.getName();
		Member member = service.getByNicName(nicName);
		Map<String,Object>model = tilesContext.getContext("request");
		model.put("member", member);
		
	}

}

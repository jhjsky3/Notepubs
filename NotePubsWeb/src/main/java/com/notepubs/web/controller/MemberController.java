package com.notepubs.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value= "/member/", method = {RequestMethod.GET, RequestMethod.POST})
public class MemberController {	
				
		
		@GetMapping("login")
		//@RequestMapping(value = "/member/login", method = {RequestMethod.GET,RequestMethod.POST})
		public ModelAndView login(HttpServletRequest req,HttpServletResponse res) {
		//public ModelAndView login(@RequestParam(value="message") @Nullable String message) {
			
			//boolean error = (boolean)req.getAttribute("error");
			String message = (String)req.getAttribute("message");
			
			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("member/login");
			//mav.addObject("error",error);
			mav.addObject("message",message);
			
			return mav;
		}

		@GetMapping("join")
		public String join() {
			
			return "member/join";
		}
		
		@GetMapping("join-confirm")
		public String joinConfirm() {
			
			return "member/join-confirm";
		}
		
		@GetMapping("find-id")
		public String findId() {
			
			return "member/find-id";
		}
		
		@GetMapping("find-pwd")
		public String findPwd() {
			
			return "member/find-pwd";
		}
		
		@GetMapping("find-confirm")
		public String findConfirm() {
			
			return "member/find-confirm";
		}
	}

package com.notepubs.web.controller.member;

import java.io.File;
import java.io.IOException;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller("memberHomeController")
@RequestMapping("/member/")
public class HomeController {
	
	@GetMapping("index")
	public String index() {
		
		return "member.index";
	}
		
	@GetMapping("edit")
	public String edit() {
		
		return "member.edit";
	}
	
	@GetMapping("edit-confirm")
	public String editConfirm() {
		
		return "member.edit-confirm";
	}

	@PostMapping("upload")
	@ResponseBody
	public String upload(MultipartFile file, HttpServletRequest request, Principal principal) throws IllegalStateException, IOException {
		String userName = principal.getName();
		
		String url = "/member/upload/"+userName;
		String realPath = request.getServletContext().getRealPath(url);
		System.out.println(realPath);
		
		File realPathFile = new File(realPath);
		if(!realPathFile.exists())
			realPathFile.mkdirs();
		
		String fileName = file.getOriginalFilename();
		
		String uploadedFilePath = realPath + File.separator + fileName;
		File uploadedFile = new File(uploadedFilePath);
				
		file.transferTo(uploadedFile);
		
		System.out.println(realPath);
		
		return url+"/"+fileName;
	}
}

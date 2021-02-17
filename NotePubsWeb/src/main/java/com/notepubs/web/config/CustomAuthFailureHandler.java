package com.notepubs.web.config;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthFailureHandler extends SimpleUrlAuthenticationFailureHandler{
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res, AuthenticationException exception) throws IOException, ServletException {
		
		String message = "";
		
		if(exception instanceof BadCredentialsException) {
			//비번 실패
			message = "아이디 또는 패스워드를 확인해 주세요.";
		}else if(exception instanceof InternalAuthenticationServiceException) {
			//아이디 없음
			message = "시스템 문제로 로그인할 수 없습니다. 관리자에게 문의해주세요.";
		}else if(exception instanceof DisabledException) {
			message = "계정이 비활성화 상태입니다. 관리자에게 문의해주세요.";
		}
		
		req.setAttribute("error", true);
		req.setAttribute("message", message);
		RequestDispatcher rdis = req.getRequestDispatcher("/member/login?error=true");
		rdis.forward(req, res);
		
		//req.getRequestDispatcher("/member/login?error=true").forward(req, res);
		
		
		//res.sendRedirect("/member/login?error=true&message="+urlMsg);
		//setDefaultFailureUrl("login?error=true&exceoption="+massage);
		
		
		//super.onAuthenticationFailure(req, res, exception);
	}
}

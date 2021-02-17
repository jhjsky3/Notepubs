<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<header id="header">
		<nav id="header-menu">
			<a href="" class="btn-img btn-expand">펼침</a>
			<h1><a class="btn-img logo" href="/index">노트펍스</a></h1>
			
			<div class="d-flex align-items-center">
				<!-- <a class="c-icon c-icon-notify active" href="">알림</a>
				<a class="c-icon-text c-icon-orange mr-3 text-white" href="">2</a> -->
				<sec:authorize access="isAuthenticated()">
				<a href="" class="btn-img btn-profile" style="background: url(/images/picture-empty.png) no-repeat center; background-size: contain;">프로필</a>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">		
					<a href="/member/login" class="btn btn-login ${loginButtonDisplay}">로그인</a>
				</sec:authorize>
			</div>
		</nav>
		
		<nav id="profile-menu" class="d-none">
			<h1 class="d-none">회원메뉴</h1>			
			<div class="header">
				<span><img src="/images/picture-empty.png"></span>
				<span>${member.nicname }</span>
				<span>${member.email}</span>
			</div>
			<ul>
				<li><a href="/member/index" class="c-symbol c-symbol-person">${loginButtonDisplay}내 홈 대시보드</a></li>				
				<li><a href="/member/logout" class="c-symbol c-symbol-exit">로그아웃</a></li>
			</ul>
			<sec:authorize access="hasRole('ADMIN')">
			<ul>
				<li><a href="/admin/index" class="c-symbol c-symbol-assignment">관리자 페이지</a></li>				
			</ul>
			</sec:authorize>
		</nav>
	</header>
	
	<script type="module" src="/js/inc/header.js"></script>
	
	
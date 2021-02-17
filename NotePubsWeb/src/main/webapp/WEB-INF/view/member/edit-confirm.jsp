<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main class="main">
	<section class="content-section content first">
		<header>
			<h1 class="c-symbol c-symbol-person">
				<span>회원 정보 변경</span>				
			</h1>
			
		</header>
		
		<section class="tool-section content-section first first">				
			<h1 class="d-none">회원 정보</h1>
			
			<div class="tool-list text-align-center p-5 border">
				<div class="text-strong">회원 정보가 변경되었습니다.</div>
				<ul class="mt-4 border p-3">
					<li>이메일 : newlec@namoolab.com</li>
					<li>비밀번호 : *****</li>
				</ul>
				
			</div>
			<div class="text-align-center mt-4">
				<a class="btn" href="edit">다시 수정하기</a>
				<a class="btn" href="index">대시보드로가기</a>
			</div>
		</section>
		
		
	</section>
</main>
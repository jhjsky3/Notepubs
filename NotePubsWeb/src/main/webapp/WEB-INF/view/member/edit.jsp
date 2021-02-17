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
		
		<section class="tool-section content-section first">	
		<form action="" method="post">		
			<h1 class="d-none">회원 정보</h1>
			
			<div class="tool-list">
				<!-- <input type="checkbox"> -->
				
				<div>
					<label>이메일</label>
					<input class="mt-3" type="text" placeholder="변경하고 싶은 이메일 주소를 입력하세요" >
				</div>
								
							
				<div>
					<label>비밀번호</label>
					<input class="mt-3" type="text" placeholder="변경하고 싶은 비밀번호를 입력하세요" >
				</div>
				
				<div>
					<label>비밀번호 확인</label>
					<input class="mt-3" type="text" placeholder="위의 비밀번호와 동일하게 입력헤주세요" >
				</div>
			</div>
			<div class="mt-4 text-align-center">
				<input class="btn btn-default btn-save" type="submit" value="저장하기" >
			</div>
		</form>
		</section>
		
		
	</section>
</main>
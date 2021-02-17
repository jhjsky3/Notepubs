<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	<main class="main">		
		<section>
			<header class="d-none">
				<h1 class="d-none">카테고리 관리</h1>
			</header>
			
			<section class="content-section first">
				<header>
					<h1 class="c-symbol c-symbol-book">내 카테고리</h1>
					<a href="reg" class="c-button c-write-button add-button">추가</a>
				</header>
				<div class="content reg-form d-none">
					<form action="reg" method="POST">
						<fieldset>
							<legend class="d-none">카테고리 등록</legend>
							<label>카테고리 이름</label>
							<input class="input-name mt-3" type="text" name="name">
							<span class="tool show-hover mt-3">
								<a class="c-btn c-btn-inline btn-reg" href="">등록</a>
								<a class="c-btn c-btn-inline c-btn-cancel " href="">취소</a>
							</span>
						</fieldset>
					</form>
				</div>
				<c:if test="${empty list}">
					<div class="list-content content blank-list none-category">
							현재 등록된 카테고리가 없습니다. 
					</div>
				</c:if>
				<div class="list-content content">
					<ul class="category-list draggable-list">
					<c:forEach var="i" items="${list}" >	
						<li class="list-item">
							<span class="title">${i.name}</span>
							
							<span class="tool show-hover">
								<a data-id="${i.id}" class="c-btn c-btn-inline edit-button" href="">수정</a>
								<a data-id="${i.id}" class="c-btn c-btn-inline del-button" href="${i.id}">삭제</a>
							</span>
						</li>
						<li class="d-none form-content">
							<span class="title"><input type="text" class="w-100" value="${i.name}"></span>
							
							<span class="tool mt-3">
								<a data-id="${i.id}" class="c-btn c-btn-inline" href="">적용</a>
								<a data-id="${i.id}" class="c-btn c-btn-inline" href="">취소</a>
							</span>
						</li>
					</c:forEach>	
						
					</ul>
				</div>
				
				<div class="margin-top align-center pager">
					<div>
						<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
					</div>
					<ul class="-list- center">
						<li><a class="" href="?p=1&amp;t=&amp;q=">1</a></li>
						<li><a class="-text- orange bold" href="?p=2&amp;t=&amp;q=">2</a></li>
						<li><a class="" href="?p=3&amp;t=&amp;q=">3</a></li>
						<li><a class="" href="?p=4&amp;t=&amp;q=">4</a></li>
						<li><a class="" href="?p=5&amp;t=&amp;q=">5</a></li>
					</ul>
					<div>
						<a class="btn btn-next" href="?p=6&amp;t=&amp;q=">다음</a>
					</div>
				</div>
			</section>
		</section>
	</main>
	<script src="../../js/member/category/list.js"></script>
  
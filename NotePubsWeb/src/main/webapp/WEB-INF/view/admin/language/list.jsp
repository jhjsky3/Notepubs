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
					<h1 class="c-symbol c-symbol-book">언어</h1>
					<a href="" class="c-button c-write-button lang-add-button bg-basic">언어 추가</a>					
				</header>
				<div class="content form-content lang-reg-form d-none">
					<form action="reg" method="post">
						<fieldset>							
							<legend class="d-none">언어 등록 필드</legend>
							<label>언어 이름</label>
							<input type="text" name="name" class="lang-input">
							<label>언어 종류</label>
							<select class="id-input">
								<option value="0">선택</option>
								<c:forEach var="lcl" items="${languageCategoryList}">
									<option value="${lcl.id}">${lcl.name}</option>
								</c:forEach>
							</select>
							<span class="text-align-right button-block">
								<a class="c-btn c-btn-inline lang-reg-form-add-btn" href="">등록</a>
								<a class="c-btn c-btn-inline c-btn-cancel lang-reg-form-cancel-btn" href="">취소</a>
							</span>
							
						</fieldset>					
					</form>
				</div>
				<div class="content border p-4 text-align-center d-none">
					현재 등록된 언어가 없습니다.
				</div>
				<div class="list-content content">
					<ul class="draggable-list lang-list">
					<c:forEach var="lang" items="${list}">
					<c:set var="current" value="" />
					<c:if test="${i==2}">
						<c:set var="current" value="current" />
					</c:if>
						<li class="list-item">
							<span class="title">${lang.name}</span>
							<span>${lang.categoryName}</span>
							<span class="tool show-hover">
								<a data-id="${lang.id}" class="c-btn c-btn-inline lang-select-btn" href="">선택</a>
								<a data-id="${lang.id}" class="c-btn c-btn-inline lang-edit-btn" href="">수정</a>
								<a data-id="${lang.id}" class="c-btn c-btn-inline lang-delete-btn" href="">삭제</a>
							</span>
						</li>
						<li class="form-content d-none lang-add-form">
							<form>
								<fieldset>							
									<legend class="d-none">언어 등록 필드</legend>
									
									<label>언어 이름</label>
									<input type="text" name="name" value="${lang.name}">
									<label>언어 종류</label>
									<select>
										<option value="0">선택</option>
										<c:forEach var="lcl" items="${languageCategoryList}">
											<option value="${lcl.id}">${lcl.name}</option>
										</c:forEach>
									</select>
									<span class="text-align-right button-block">
										<a class="c-btn c-btn-inline lang-add-form-reg-btn" href="">등록</a>
										<a class="c-btn c-btn-inline c-btn-cancel lang-add-form-cancel-btn " href="">취소</a>
									</span>
									
								</fieldset>			
							</form>													
						</li>
						<li class="flow-content">
							
							<c:forEach var="p" items="${lang.platforms}">
								<span data-id="${p.id}"class="plat-list"><span>${p.name}</span><span class="c-icon c-icon-circle-del ml-1">삭제</span></span>
							</c:forEach>
						</li>
					</c:forEach>
						
					</ul>
				</div>
				<div class="pager">
					<h2 class="d-none">페이저</h2>
					<div>
						<a class="btn" href="">이전</a>
					</div>
					<ul class="pager-list">
						<li><a href="" class="current">1</a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li><a href="">4</a></li>
						<li><a href="">5</a></li>
					</ul>
					<div>
						<a href="" class="btn">다음</a>
					</div>
				</div>
			</section>
		</section>
	</main>
<script src="../../js/admin/language/list.js"></script>

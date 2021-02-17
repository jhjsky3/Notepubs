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
					<h1 class="c-symbol c-symbol-book">플랫폼</h1>
					<a href="" class="c-button c-write-button add-button">추가</a>					
				</header>
				
				<div class="form-content d-none platform-add-btn">
					<form action="reg" method="post">
						<fieldset>
							<legend class="d-none">플랫폼 등록 필드</legend>
							<label>플랫폼 이름</label>
							<input type="text" name="name" class="plat-input">
							<select class="plat-id-input">
								<option value="0">선택</option>
								<c:forEach var="pcl" items="${platCategoryList}">
									<option value="${pcl.id}">${pcl.name}</option>
								</c:forEach>
							</select>
							<span class="tool show-hover button-block">
								<a class="c-btn c-btn-inline plat-add-reg-btn" href="">등록</a>
								<a class="c-btn c-btn-inline c-btn-cancel plat-add-cancel-btn" href="">취소</a>
							</span>
						</fieldset>					
					</form>
				</div>
				
				<div class="list-content content blank-list d-none">
					현재 등록된 플랫폼이 없습니다.
				</div>
				<div class="list-content content">
					<ul class="draggable-list platform-list">						

					<c:forEach var="p" items="${viewList}">
						<!-- --------------------------------------------------------------------- -->

						<li class="list-item">
							<span class="title">${p.name}</span>
							<span class="category">${p.categoryName}</span>

							<span class="tool show-hover">
								<a data-id="${p.id}" class="c-btn c-btn-inline plat-edit-btn" href="">수정</a>
								<a data-id="${p.id}" class="c-btn c-btn-inline plat-delete-btn" href="">삭제</a>
							</span>
						</li>
						<li class="d-none form-content">
							<span>
								<label>플랫폼 이름</label>
								
								<input class="my-3" type="text" name="name" value="">
								<label>분류</label>
								<select class="my-3">
									<option>선택</option>
									<option>플랫폼 API</option>
									<option>라이브러리</option>
								</select>
							</span>
							<span class="tool show-hover mt-3">
								<a class="c-btn c-btn-inline" href="">등록</a>
								<a class="c-btn c-btn-inline c-btn-cancel " href="">취소</a>
							</span>								
						</li>
					</c:forEach>	
						<!-- --------------------------------------------------------------------- -->
						
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
	
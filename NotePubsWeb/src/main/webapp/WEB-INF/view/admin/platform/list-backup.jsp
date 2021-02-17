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
					<a href="" class="c-button c-write-button">추가</a>					
				</header>
				
				<div class="content list-content">
					<form>
						<fieldset class="list-item">
							<legend class="d-none">플랫폼 등록 필드</legend>
							<div>
							<label>플랫폼 이름</label>
							<input type="text" name="name">
							<select>
								<option>선택</option>
								<option>플랫폼 API</option>
								<option>라이브러리</option>
							</select>
							<span class="tool show-hover">
								<a class="c-btn c-btn-inline" href="">등록</a>
								<a class="c-btn c-btn-inline c-btn-cancel " href="">취소</a>
							</span>
							</div>					
						</fieldset>					
					</form>
				</div>
				
				<div class="list-content content blank-list">
					현재 등록된 플랫폼이 없습니다.
				</div>
				<div class="list-content content">
					<ul class="draggable-list">
					<c:forEach var="p" items="${list}">
						<!-- --------------------------------------------------------------------- -->
						<li>
							<span class="title">${p.name}</span>
							<span>플랫폼 API</span>
							<span class="tool show-hover">
								<a class="c-btn c-btn-inline" href="">수정</a>
								<a class="c-btn c-btn-inline" href="">삭제</a>
							</span>
						</li>
						<li class="d-none">
							<span>
								<label>플랫폼 이름</label>
								<input type="text" name="name" value="${p.name}">
								<label>분류</label>
								<select>
									<option>선택</option>
									<option>플랫폼 API</option>
									<option>라이브러리</option>
								</select>
							</span>
							<span class="tool show-hover">
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
	
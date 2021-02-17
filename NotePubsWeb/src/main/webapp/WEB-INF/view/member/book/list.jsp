<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main class="main">
	<section>
		<header class="d-none">
			<h1 class="d-none">책 관리 3</h1>
		</header>
		<section class="book-content content-section first">
			<header>
				<h1 class="c-symbol c-symbol-book">내 서적</h1>
				<a href="" class="c-button c-write-button book-add-button">추가</a>
			</header>
			<div class="cliper">
				<div class="book-list">			
					<c:forEach var="i" begin="1" end="5" >
						<c:set var="current" value="" />
						<c:if test="${i==2}">
							<c:set var="current" value="current" />
						</c:if>
						<section class="book ${current}">					
						
							<h1><a href="1">자바 프로그래밍</a></h1>					
							<div>
								<div class="img">									
							
								<a href="1"><img src="/images/book-cover/java.png"></a>
						
								</div>
								<div class="detail">
									<dl class="info">
										<dt class="note">노트 :</dt>
										<dd>321개</dd>
										<dt class="note">챕터 :</dt>
										<dd>6개</dd>
										<dt class="note">등록일 :</dt>
										<dd>2021-01-20</dd>
										<dt class="note">수정일 :</dt>
										<dd>2021-01-20</dd>
									</dl>
									<div>
										<a href="" class="c-btn c-btn-default">수정</a>									
									</div>
								</div>
								<div class="analize d-none">
									<span class="note">320 조회수</span> <span class="chapter">6
										구독자</span> <span class="a">aaa</span> <span class="button c-symbol">버튼</span>
								</div>
							</div>
						</section>
					</c:forEach>
				</div>
			</div>
		</section>

		<section class="book-contents content-section">
			<header>
				<h1 class="c-symbol c-symbol-book">책 목차</h1>
				<h2>(위에서 목차를 편집할 책을 선택해 주세요)</h2>
				
			</header>
			
			<div class="text-align-center content">선택된 책이 없습니다.</div>
			
		</section>
	</section>
</main>
<script src="../../js/member/book/list.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main class="main">
	<section>
		<header class="d-none">
			<h1 class="d-none">책 관리 3</h1>
		</header>
		<section class="books-writing content-section first">
			<header>
				<h1 class="c-symbol c-symbol-book">집필중인 서적</h1>
				<a href="list" class="c-button c-write-button">목록</a>
			</header>
			<div class="cliper">
				<div class="book-list">
				
					<c:forEach var="i" begin="1" end="1">
						<c:set var="isCurrent" value="${param.id==Integer.parseInt(i)}" />					
						<section class="book ${isCurrent?'current':''}">
									           			            
				            
							<h1><a href="detail?id=${i}">편하게 읽는 자바 프로그래밍</a></h1>
					
							<div>
								<div class="img">
		
								
									<a href="detail?id=${i}"><img src="../../images/2020/newlec/${list[i].img}"></a>
								
								</div>	
								<div class="detail">
									<dl class="info">
										<dt class="note">노트 :</dt>
										<dd>321개</dd>
										<dt class="note">챕터 :</dt>
										<dd>6개</dd>
										<dt class="note">등록일 :</dt>
										<dd>${n.regDate}</dd>
										<dt class="note">수정일 :</dt>
										<dd>${n.editDate}</dd>
									</dl>
									<div>
										<a href="" class="c-btn c-btn-default">통계</a>
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
				<a href="" class="c-button c-write-button">챕터추가</a>
			</header>	
		
			<div class="contents-list content">
			
			<c:forEach var="c" items="${Chapters}">	
				<section>
					<header>
						<h1><span class="c-symbol c-symbol-select-button">Chapter=${c.id}</span><span class="title">${c.title }</span></h1>
						<div>
							<a href="" class="c-btn c-btn-inline">노트추가</a>
							<a href="" class="c-btn c-btn-inline">삭제</a>
							<a href="" class="c-btn c-btn-inline">수정</a>
						</div>
					
					</header>
					 <ol class="note-list">
						<li class="c-symbol c-symbol-flip">
							<span>1</span><span class="title">값의 표현방식</span>
							<span class="tool-bar">
								<a href="" class="c-btn c-btn-inline">삭제</a>
								<a href="" class="c-btn c-btn-inline">수정</a>
							</span>
						</li>
						<li class="c-symbol c-symbol-flip">
							<span>2</span><span class="title">값 형식의 종류</span>
							<span class="tool-bar">
								<a href="" class="c-btn c-btn-inline">삭제</a>
								<a href="" class="c-btn c-btn-inline">수정</a>
							</span>
						</li>
						<li class="c-symbol c-symbol-flip">
							<span>3</span><span class="title">정수 값의 범위</span>
							<span class="tool-bar">
								<a href="" class="c-btn c-btn-inline">삭제</a>
								<a href="" class="c-btn c-btn-inline">수정</a>
							</span>
						</li>
					</ol> 				
				</section>
			</c:forEach>
				
			</div>
			
		</section>
	</section>
</main>
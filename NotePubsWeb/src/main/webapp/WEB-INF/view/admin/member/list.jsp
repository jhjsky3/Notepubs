<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:parseNumber var="pageCount" integerOnly="true" value="${Math.ceil(cnt/12)}" />

<main>
	<section class="content-section first member-section">
		<header>
			<h1 class="c-symbol c-symbol-note">
				<span>회원 관리 </span>
				<span class="pl-3">${list.size()}/ ${cnt}</span>				
				<input type="hidden" class="page-count"  value="${pageCount}"/>
			</h1>			
			<!-- <a href="reg" class="c-button c-write-button add-button">추가</a> -->
		</header>
		<!-- ----------------------------------------------------------------- -->
		<section class="tool-section content-section first">			
			<h1 class="d-none">정렬기준</h1>
			<div class="tool-list">
				<label class="d-none">아이디로 검색</label>
				<input type="text" placeholder="사용자를 아이디로 검색할 수 있습니다." >
			</div>
			<div class="tool-list mt-4">				
				<a href="" class="regdate">가입일<span class="c-icon c-icon-keyboard-arrow-down filter-button regdate">상태</span></a>
				<a href="" class="notePub">노트공개수<span class="c-icon c-icon-keyboard-arrow-down filter-button notePub" >상태</span></a>
				<a href="" class="bookPub">책공개수<span class="c-icon c-icon-keyboard-arrow-down filter-button bookPub">상태</span></a>
			</div>
		</section>
		<!-- ----------------------------------------------------------------- -->
		
		<section class="tool-section content-section">			
			<h1 class="d-none">회원 목록</h1>
			<div class="member-list">
			<c:forEach var="i" begin="0" end="3"  >
				<c:forEach var="j" begin="0" end="2">		
				<div class="member">
					<div>
						<span><img src="/images/picture-empty.png"></span>
						<span>${list[(i*3)+j].name}(${list[(i*3)+j].nicname})</span>
						<span>${list[(i*3)+j].email}</span>
					</div>
					<div class="info">
						<fmt:formatDate var="t" value="${list[(i*3)+j].regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>							
							<span>가입일 :${t}</span>
						</div>
					<div class="info">
						<span class="c-symbol c-symbol-note-color1">${list[(i*3)+j].notePubCnt}/${list[(i*3)+j].noteAllCnt}</span>
						<span class="c-symbol c-symbol-book-color1">${list[(i*3)+j].bookPubCnt}/${list[(i*3)+j].bookAllCnt}</span>
					</div>
				</div>
				</c:forEach>
			</c:forEach>
<!-- 				<div class="member blank"> -->
<!-- 					<span><img src="/images/picture-empty.png"></span> -->
<!-- 					<span></span> -->
<!-- 					<span></span> -->
<!-- 				</div> -->
				
			</div>
			
			<div class="pager">
				<h2 class="d-none">페이저</h2>
				<div>
					<a class="btn prev-page" href="" >이전</a>
				</div>
				<ul class="pager-list" >
					<c:forEach begin="1" end="${pageCount}" var="i">
					
						<li><a href="" <c:if test="${i==1}"> class="current"</c:if>  > ${i} </a></li>  
						
<!-- 					<li><a href="" class="current">1</a></li> -->
<!-- 					<li><a href="">2</a></li> -->
<!-- 					<li><a href="">3</a></li> -->
<!-- 					<li><a href="">4</a></li> -->
<!-- 					<li><a href="">5</a></li> -->
					</c:forEach>	
				</ul>
				<div>
					<a class="btn next-page" href="" class="">다음</a>
				</div>
			</div>
		</section>
	</section>
</main>
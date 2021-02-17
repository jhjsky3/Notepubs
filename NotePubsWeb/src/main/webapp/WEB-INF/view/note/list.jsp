<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="user" property="principal" />

<main class="main">
	<section class="content-section content first">
		<header>
			<h1 class="c-symbol c-symbol-note">
				<span>노트목록</span>
				<span class="pl-3">20</span>				
			</h1>
			<a class="filter-button" href="">필터링<span class="c-icon c-icon-keyboard-arrow-down">상태</span></a>
			
		</header>
		
		<section class="tool-section content-section first d-none">			
			<h1 class="d-none">필터링도구</h1>
			
			<div class="tool-list">
				<!-- <input type="checkbox"> -->
				
				<div>
					<label>내카테고리</label>
					<select name="m">
						<option>선택</option>
						<c:forEach var="m" items="${myCategoryList}">
						<option value="${m.id}">${m.name}</option>
						</c:forEach>					
					</select>
				</div>					
				<div>
					<label>카테고리</label>
					<select name="c">
						<option>선택</option>
						<c:forEach var="c" items="${categoryList}">
						<option value="${c.id}">${c.name}</option>
						</c:forEach>	
					</select>
				</div>
				<div>
					<label>메인언어</label>
					<select name="lang">
						<option>선택</option>
						<c:forEach var="lang" items="${languageList}">
						<option value="${lang.id}">${lang.name }</option>
						</c:forEach>
					</select>
				</div>
				
				<div>
					<label>플랫폼</label>
					<select name="plat">
						<option>선택</option>
						<c:forEach var="plat" items="${platformList}">
						<option value="${plat.id}">${plat.name }</option>
						</c:forEach>
					</select>
				</div>
				
				<div>
					<label>제목검색</label>
					<input name="q" class="input"  type="text" placeholder="검색어를 입력하세요" >
				</div>
				
				<div>
					<label>기간으로 검색</label>
					<div class="input">
						<input checked name="term" type="radio"><label class="ml-2">모두</label>
						<input class="ml-3" name="term" type="radio"><label class="ml-2">최근 2주</label>
						<input class="ml-3" name="term" type="radio"><label class="ml-2">최근 1달</label>
					</div>
				</div>
				
			</div>
		</section>
		
		<section class="note-section list-section content-section section2">
			<h1 class="d-none">
				<span><span class="color-note">NOTE</span> PUBLIC</span>
				<span>
					<a href="">왼쪽</a>
					<a href="">오른쪽</a>
				</span>
			</h1>
			<div class="clipper">
				<div class="note-list">
				<c:forEach  var="n" items="${list2}">
					<section class="note">
						<h1><a href="${n.id}">${n.title}</a></h1>
						<div class="note-content">
							<c:if test="${not empty n.thumbImg}">
								<div class="thumb-img"><img style="width: 100%;" src="${n.thumbImg}"></div>
							</c:if>
							${n.content}
						</div>						
						<div class="info">
							<span>카테고리 없음</span>
							<span><fmt:formatDate value="${n.regDate}" pattern="yyyy-MM-dd" /></span>
						</div>
						<div class="info">
							<c:set var="likeStyle" value="${likeStatus?'c-symbol-color':'' }" />
							<span class="c-symbol c-symbol-like ${likeStatus} text-strong">${n.likeCount }</span>
							<span class="c-symbol c-symbol-hit  text-strong aaa">${n.hit}</span>
							<span class="c-symbol c-symbol-bookmark text-strong">${n.bookMarkCount }</span>
						</div>
						<sec:authorize access="isAuthenticated()">
						<c:if test="${user.username == n.writerId}">
						<div class="cover">
							<div data-id="${n.id}" class="show-button"><a class="show-detail" href="${n.id}">보기</a></div>
							<div class="edit-button"><a href="">수정</a></div>
							<div class="del-button"><a href="">삭제</a></div>
						</div>
						</c:if>
						</sec:authorize>
					</section>					     	
				</c:forEach>
				</div>
			</div>
			<div class="text-align-center">
				<span class="btn px-5">더보기</span>
			</div>
			<!-- <div class="pager">
				<h2 class="d-none">페이저</h2>
				<div>
					<a href="">이전</a>
				</div>
				<ul class="pager-list">
					<li><a href="" class="current">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li><a href="">5</a></li>
				</ul>
				<div>
					<a href="" class="">다음</a>
				</div>
			</div> -->
		</section>
		
	</section>
	
</main>

<script src="/js/note/list.js"></script>


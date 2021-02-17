<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<main class="main">
	<section class="content-section content first">
		<header>
			<h1 class="c-symbol c-symbol-note">
				<span>노트 관리</span>
				<span class="pl-3 list-size"></span>	
			</h1>
			<a href="">필터링<span class="c-icon c-icon-keyboard-arrow-down filter-button">상태</span></a>
			<a href="reg" class="c-button c-write-button add-button">추가</a>
		</header>
		
		<section class="tool-section content-section first d-none">			
			<h1 class="d-none">필터링도구</h1>
			
			<div class="tool-list">
				<!-- <input type="checkbox"> -->
				
				<div>
					<label>내카테고리</label>
					<select class="mc" >
						<option>선택</option>
						<c:forEach var="mc" items="${myCategoryList}">
						<option value="${mc.id}">${mc.name}</option>
						</c:forEach>					
					</select>
				</div>
								
				<div>
					<label>카테고리</label>
					<select class="c" >
						<option>선택</option>
						<c:forEach var="c" items="${categoryList}">
						<option value="${c.id}">${c.name}</option>
						</c:forEach>
					</select>
				</div>
			
				<div>
					<label>메인언어</label>
					<select class="lang" >
						<option>선택</option>
						<c:forEach var="lang" items="${languageList}">
						<option value="${lang.id}">${lang.name}</option>
						</c:forEach>
					</select>
				</div>
				
				<div>
					<label>플랫폼</label>
					<select class="plat" >
						<option>선택</option>
						<c:forEach var="plat" items="${platformList}">
						<option value="${plat.id}">${plat.name}</option>
						</c:forEach>
					</select>
				</div>
				
				<div>
					<label>제목검색</label>
					<input class="title-input" type="text" placeholder="검색어를 입력하세요" >
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
		
		<section class="note-section list-section content-section">
			<h1 class="d-none">
				<span><span class="color-note">NOTE</span> PUBLIC</span>
				<span>
					<a href="">왼쪽</a>
					<a href="">오른쪽</a>
				</span>
			</h1>
			<c:if test="${empty list}"> <!-- 필요할꺼 같아서 넣음 홍준  -->
				<div class="content border p-4 text-align-center reged-note">
					현재 등록된 노트가 없습니다.
				</div>
			</c:if>
			<div class="content border p-4 text-align-center reged-note d-none">
					현재 등록된 노트가 없습니다.
			</div>
			<div class="pl-5">
				<input class="check-All" type="checkbox" ><a class="ml-2" href="pub-all">일괄선택</a>
				<input class="ml-3 btn-pub-all" type="button" value="일괄 공개">
				<input class="ml-3 btn-del-all" type="button" value="일괄 삭제">
				<input class="ml-3 btn-category-all" type="button" value="카테고리 설정">
			</div>
			<div class="clipper">
				<div class="note-list">
				<c:forEach var="n" items="${list}">
					<section data-id="${n.id}" class="note">
						<h1><input class="mr-2" type="checkbox" ><a href="../../note/${n.id}" target="__blank">${n.title}</a></h1>
						<div class="note-content">
							<c:if test="${not empty n.thumbImg}">
								<div class="thumb-img"><img style="width: 100%;" src="${n.thumbImg}"></div>
							</c:if>
							${n.content}
						</div>						
						<div class="info">
							<span>카테고리 없음</span>
							<span>
							<fmt:formatDate value="${n.regDate}" pattern="yyyy-MM-dd" /> 
							</span>
						</div>
						<div class="info info-btn">
							<a data-id="${n.id}" href="${n.id}/pub?s=${not n.pub}" class="pub" >${n.pub eq false?'공개':'비공개'}</a>
							<a data-id="${n.id}" href="${n.id}/edit" class="edit" >수정</a>
							<a data-id="${n.id}" href="${n.id}/delete" class="delete" >삭제</a>
						</div>
						<div class="info">
							<c:set var="likeStyle" value="${likeStatus?'c-symbol-color':'' }" />
							<span class="c-symbol c-symbol-like ${likeStyle} text-strong">${n.likeCount}</span>
							<span class="c-symbol c-symbol-hit c-symbol-color text-strong">${n.hit}</span>
							<span class="c-symbol c-symbol-bookmark text-strong">${n.bookMarkCount}</span>
						</div>
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
<script type="text/javascript" src="../../js/member/note/list.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/css/member/note/list.css">
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
	
<main class="main">
	<section class="content-section first">
		<header>
			<h1>
				<span class="c-symbol c-symbol-note">노트 관리 20</span>
				<a href="reg" class="c-btn c-btn-default">글쓰기</a>
			</h1>
		</header>
		
		<section class="category-box">			
			<h1 class="d-none">편집도구</h1>
			
			<div>
			<form action="list" method="get">
				<div>
					<label class="cate-label">My카테고리</label>
					
					<select class="cate-input" name="mc">
						<option value="0">선택</option>
						<c:forEach var="mc" items="${myCategoryList}">
						<c:set var="current" value=""/>
						
						<c:if test="${param.mc == mc.id}">
							<c:set var="current" value="selected"/>
						</c:if>
							
						<option ${current} value="${mc.id}">${mc.name}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label class="cate-label">카테고리</label>
					<select class="cate-input" name="c" >
					<option value="0">선택</option>
					<c:forEach var="c" items="${categoryList}">
					<c:set var="current" value=""/>
					
					<c:if test="${param.c == c.id}">
						<c:set var="current" value="selected"/>
					</c:if>
						<option ${current} value="${c.id}">${c.name}</option>
						
					</c:forEach>
						
					</select>
				</div>
				<div>
					<label class="cate-label">메인언어</label>
					<select class="cate-input" name="lang">
						<option value="0">선택</option>
						<c:forEach var="lang" items="${languageList }">
						<c:set var="current" value=""/>
						
						<c:if test="${param.lang == lang.id }">
							<c:set var="current" value="selected"/>
						</c:if>
						
						<option ${current} value="${lang.id}">${lang.name}</option>
						</c:forEach>
					</select>
				</div>
				<div>
					<label class="cate-label">플랫폼</label>
					<select class="cate-input" name="pf">
						<option value="0">선택</option>
						<c:forEach var="p" items="${platformList}">
						<c:set var="current" value=""/>
						
						<c:if test="${param.pf == p.id }">
							<c:set var="current" value="selected"/>
						</c:if>
						
							<option ${current} value="${p.id}">${p.name}</option>
							
						</c:forEach>
					</select>
				</div>
				
				<div class="search-form">
					<h2 class="d-none">검색 폼</h2>
					
						<h3 class="cate-label">노트검색</h3>
						<div class="cate-input" style="display: flex;">
							<label class="d-none">제목</label>
							<input type="text" name="title" value="${param.title}"
								placeholder="제목입력" style="text-align: center;">
							<input class="c-btn c-btn-default" type="submit" value="검색">
						</div>						
				</div>	
			</form>			
				
		</div>
		</section>
		<section class="list-note">
			<h1 class="d-none">노트목록</h1>
			<table class="table">
				<tbody>
				
					<c:forEach var="n" begin="0" end="10" items="${list}">
					<tr>
						<td class="w60"><input name="id" value="" type="radio"></td>
						<td class="title text-align-left">
							<a href="">${n.title}</a>
							<span class="w250 d-none">자바수업/노트/자바</span>
							<span class="w100">
								<a href="1/edit" class="c-btn c-btn-text">수정</a>
								<a href="1/del" class="c-btn c-btn-text">삭제</a>
							</span>
						</td>
					</tr>
					</c:forEach>
				
				</tbody>
			</table>
						
			
						
			<div class="pager">
				<h2 class="d-none">페이저</h2>
				<div>
				
				<span onclick="alert('이전 페이지가 없습니다.');">이전</span>
				
				</div>
				<ul class="pager-list">
					<c:forEach var="i" begin="0" end="4">					
					
					<li><a href="?p=" class="current"></a></li>
					</c:forEach>
				</ul>
				<div>
				
				<span class="" onclick="alert('다음 페이지가 없습니다.');">다음</span>
				
				</div>
			</div>
		</section>
		<!-- <link type="text/css" href="../../resources/js/lib/modal/modal.css" rel="stylesheet"> -->
		<script type="text/javascript" src="../../js/lib/modal/modal.js"></script>
		<script>
		window.addEventListener("load", function(e){
			
			var noteTable = document.querySelector(".list-note table");
			
			noteTable.oninput = function(e){
				if(e.target.nodeName !== "INPUT")
					return;
				
				if(!e.target.checked)
					return;

				console.log(e.target);
				
				var id = e.target.value;
				var el = e.target.parentElement.nextElementSibling.querySelector(":last-child");
				
				var modal = new Modal(el);
				modal.show();
				
			};	
		});		
		</script>
	</section>
</main>
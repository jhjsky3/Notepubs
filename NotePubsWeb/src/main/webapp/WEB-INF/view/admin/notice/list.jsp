<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<main class="main">
	<section class="">
		<header class="d-none">
			<h1 class="d-none">공지사항 목록</h1>
		</header>
		
		<section class="content-section first">
			<header>
				<h1 class="c-symbol c-symbol-book">공지사항 목록</h1>				
			</header>
			
			<div class="form-content">
				<form>
					<fieldset>
						<legend class="d-none">플랫폼 등록 필드</legend>	
						<label>검색분류</label>
						<select>
							<option>선택</option>
							<option>제목</option>
							<option>내용</option>
						</select>
						<label>검색어</label>
						<input type="text" name="name">
						<span class="tool show-hover button-block">
							<input class="btn btn-default btn-color-admin" type="submit" value="검색">
							<!-- <a class="c-btn c-btn-inline c-btn-cancel " href="">취소</a> -->
						</span>
										
					</fieldset>					
				</form>
				
				<table class="table horizontal-table hoverable-table table-color-basic mt-4">
				<thead>
					<tr>
						<th class="w-1">번호</th>
						<th class="">제목</th>
						<th class="w-2">작성자</th>
						<th class="w-2">작성일</th>
						<th class="w-1">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" begin="1" end="10">
						<tr>
							<td>1</td>
							<td class="align-left indent"><a href="1">공지사항 ${n}</a></td>
							<td>newlec</td>
							<td>2020-12-26</td>

							<td>${n}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			
			<div class="text-align-right mt-4">
				<a class="btn btn-default btn-color-admin" href="reg">글쓰기</a>
			</div>
			
			
			<div class="margin-top align-center pager">

				<div>

					<c:set var="page" value="${(param.p == null)?1:param.p}" />
					<c:set var="startNum" value="${page-(page-1)%5}" />
					<c:set var="lastNum" value="50" />

					<c:if test="${startNum>1}">
						<a href="?p=${startNum-1}&t=&q=">이전</a>
					</c:if>

					<c:if test="${startNum<=1}">
						<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
					</c:if>

				</div>

				<ul class="-list- center">
					<c:forEach var="i" begin="0" end="4">
						<c:set var="orange" value="" />
						<c:if test="${i==1}">
							<li><a class="-text- orange bold"
								href="?p=${startNum+i}&t=&q=">${startNum+i}</a></li>
						</c:if>

						<c:if test="${i!=1}">
							<li><a class="${orange}" href="?p=${startNum+i}&t=&q=">${startNum+i}</a></li>
						</c:if>

					</c:forEach>
				</ul>
				<div>

					<c:if test="${startNum+5<lastNum}">
						<a class="btn btn-next" href="?p=${startNum+5}&t=&q=">다음</a>
					</c:if>

					<c:if test="${startNum+5>=lastNum}">
						<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다.');">다음</span>
					</c:if>

				</div>

			</div>
			</div>
		</section>
		
		
	</section>
</main>
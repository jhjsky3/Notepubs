<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}
</style>
<main id="main">
 
	<div class="s"></div>
	<h2 class="main title">이벤트</h2>

	<div class="search-form">
		<h3 class="hidden">이벤트 목록</h3>
		<form class="table-form">
			<fieldset>
				<legend class="hidden">이벤트 검색분류</legend>
				<label class="hidden">검색분류</label> 
				<select name="f">
					<option value="title">제목</option>
					<option value="uid">작성자</option>
				</select> 
				<label class="hidden">검색어</label> 
				<input type="text" name="q" value="" /> 
				<input type="submit" value="검색" />
			</fieldset>
		</form>
	</div>

	<div class="notice margin-top">
		<h3 class="hidden">이벤트 목록</h3>
		<table border="1" class="table" >
			<thead>
				<tr>
					<th class="w60">번호</th>
					<th class="expand">제목</th>
					<th class="w100">작성자</th>
					<th class="w100">작성일</th>
					<th class="w60">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${list}">
					<tr>
						<td>${e.id}</td>
						<td class="title ident text-align-left"><a
							href="detail?id=${e.id}">${e.title}</a></td>
						<td>${e.uid}</td>
						<td>${e.regdate}</td>

						<td>${e.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="text-align-right margin-top">
		<a class="btn-text btn-default" href="reg">글쓰기</a>
	</div>

	<div class="margin-top align-center pager">

		<div>
		
			<c:set var="page" value="${(param.p == null)?1:param.p}"/>
			<c:set var="startNum" value="${page-(page-1)%5}"/>
			<c:set var="lastNum" value="50"/>
		
			<c:if test="${startNum>1}">
					<a href="?p=${startNum-1}&t=&q=">이전</a>
			</c:if>
			
			<c:if test="${startNum<=1}">
					<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
			</c:if>
			
		</div>
			  
	          <ul class="-list- center">
				<c:forEach var="i" begin="0" end="4">
				    <c:set var="orange" value=""/>
               <c:if test="${i==1}">
                  <li><a class="-text- orange bold" href="?p=${startNum+i}&t=&q=">${startNum+i}</a></li>
               </c:if>   
				
			<c:if test="${i!=1}">
                  <li><a class="${orange}" href="?p=${startNum+i}&t=&q=">${startNum+i}</a></li>
               </c:if>   

				</c:forEach>		
			 </ul>
               <div>
				  
				  <c:if test="${startNum+5<lastNum}">
				  		<a href="?p=${startNum+5}&t=&q=">다음</a>
				  </c:if>
				  
				  <c:if test="${startNum+5>=lastNum}">	
                  		<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다.');">다음</span>
				  </c:if>
				  	
               </div>

            </div>  
   </main>
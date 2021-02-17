<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main>
	<h2 class="main title">공지사항</h2>

	<div class="margin-top first">
		<h3 class="hidden">공지사항 내용</h3>
		<table class="table">
			<tbody>
				<tr>
					<th>제목</th>
					<td class="text-align-left text-indent text-strong text-orange"
						colspan="3">${n.title}</td>
				</tr>
				
				<tr>
					<th>공지사항</th>
					<td class="text-align-left text-indent text-strong text-orange"
						colspan="3">${n.content}</td>
				</tr>
				
				<tr>
					<th>작성일</th>
					<td class="text-align-left text-indent" colspan="3">
						${n.regDate}</td>
				</tr>
		
				
				<tr>
					<th>작성자</th>
					<td colspan="3">${n.uid}</td>	
				</tr>
				
				<tr>			
					<th>조회수</th>
					<td colspan="3">${n.hit}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="margin-top text-align-center">
		<a class="btn-text btn-cancel" href="list">목록</a> <a
			class="btn-text btn-default" href="edit?id=${n.id}">수정</a> <a
			class="btn-text btn-default" href="del?id=${n.id}">삭제</a>
	</div>

</main>
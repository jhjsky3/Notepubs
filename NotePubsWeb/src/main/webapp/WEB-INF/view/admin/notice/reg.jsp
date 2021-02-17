<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<main>
	<form action="reg" method="post">
		<div class="margin-top first">
			<h3 class="hidden">공지사항 입력</h3>
			<table class="table">
				<tbody>
				
					<tr>
						<th>번호</th>
						<td class="text-align-left text-indent text-strong text-orange"
							colspan="3"><input type="text" name="id">${n.id}</td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td class="text-align-left text-indent text-strong text-orange"
							colspan="3"><input type="text" name="uid" />${n.uid}</td>
					</tr>
				
					<tr>
						<th>제목</th>
						<td class="text-align-left text-indent text-strong text-orange"
							colspan="3"><input type="text" name="title" />${n.title}</td>
					</tr>
					
					<tr>
						<th>공지사항 내용</th>
						<td class="text-align-left text-indent text-strong text-orange"
							colspan="3"><input type="text" name="content" />${n.content}</td>
					</tr>
						
					<tr>
						<th>조회수</th>
						<td class="text-align-left text-indent text-strong text-orange"
							colspan="3"><input type="text" name="hit" />${n.hit}</td>
					</tr>
				
					</tbody>
			</table>
		</div>
		<div class="margin-top text-align-center">
			<input class="btn-text btn-default" type="submit" value="등록" /> <a
				class="btn-text btn-cancel" href="list">취소</a>
		</div>
	</form>

</main>
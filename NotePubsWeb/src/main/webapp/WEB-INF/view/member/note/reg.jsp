<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>노트 등록 페이지</title>
<link href="/css/member/inc/layout.css" type="text/css" rel="stylesheet" >
<link href="/css/member/note/reg.css" type="text/css" rel="stylesheet" >
<script type="text/javascript" src="/js/member/note/reg.js"></script>
</head>

<body id="view">
	<jsp:include page="../../inc/header.jsp" />

	<div id="body" class="editor">
		<section class="content-section ml-auto mr-auto mt-0">
			<h1 class="d-none">노트 등록 폼</h1>
			
			<form id="frm1" class="note-reg-form" action="reg" method="post">				
				<section class="note-section" style="height: calc(100% - 70px);padding-bottom: 70px;">
					<h1><input type="text" name="title" placeholder="제목을 입력하세요" autocomplete="off"></h1>
					<div class="html-area" contenteditable="true">
					</div>
					<textarea rows="40" cols="80" name="content" class="text-area d-none"></textarea>

					
				</section>				
			</form>
			
		</section>
		<section class="tool-section">
			<div class="toolbar">
				<span class="panel"> 
					<input type="button" value="bold"
					class="btn btn-text btn-bold"> <input type="button"
					value="underline" class="btn btn-underline"> <input
					type="button" value="italic" class="btn btn-italic">
				</span> <span class="panel"> <input type="button" value="left"
					class="btn btn-left"> <input type="button" value="center"
					class="btn btn-center"> <input type="button" value="right"
					class="btn btn-right">
				</span> <span class="panel"> <input type="button" value="font-size"
					class="btn btn-font-size"> <input type="button"
					value="font-color" class="btn btn-font-color"> <!-- <input type="button" value="font-family" class="btn btn-font-family"/> -->
				</span> <span class="panel"> 
				<input type="button" value="image"
					class="btn btn-image"> <!-- <span class="btn btn-text btn-link">link</span> -->
					<!-- <input type="button" value="html" class="btn btn-html" /> -->
				</span> <span> <input type="file" class="file-button"
					style="display: none;">
				</span>
			</div>
			<div class="buttons-div">
				<input class="btn btn-reg" form="frm1" type="submit" value="등록">
				<a href="list" class="btn">취소</a>
			</div>	
		</section>
    </div>
	
	<%-- <jsp:include page="../../inc/footer.jsp" /> --%>

</body>
</html>

</html>
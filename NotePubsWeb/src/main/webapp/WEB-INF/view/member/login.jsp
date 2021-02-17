<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>노트펍스 회원 로그인</title>
<link href="/css/member/inc/layout.css" type="text/css" rel="stylesheet" >
<link href="/css/member/login.css" type="text/css" rel="stylesheet" >
<script>
window.addEventListener('orientationchange', function(e){
    var isUpright = (window.orientation == 'portrait');
});
</script>
</head>
<body id="view">
	<jsp:include page="../inc/header.jsp" />
	
	<div id="body">
		<section class="content-section ml-auto mr-auto first">
			<h1>NotePubs 로그인</h1>
			<form class="login-form" action="login" method="post">
				<fieldset>
					<legend class="d-none">로그인 필드</legend>
					<c:if test="${error}">
						<span class="login-error border border-danger text-danger text-center p-4">
							${message}
						</span>
					</c:if>
					
					<span>
						<label>아이디</label>
						<input type="text" name="username">
					</span>
					<span>
						<label>비밀번호</label>
						<input type="password" name="password">
					</span>
					<span>
						<input type="submit" value="로그인하기">
						<%-- <input type="submit" value="구글로그인"> --%>
						<a class="join-button mt-3 text-align-center" href="join"><span class="c-symbol c-symbol-join-green">회원가입</span></a>
						<span class="join-button mt-3 text-align-center" href="join">
							<a href="find-id">아이디 찾기</a> / <a href="find-pwd">비밀번호 찾기</a>
						</span>
					</span>
				</fieldset>
		</form>
		</section>
		
    </div>
	
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>
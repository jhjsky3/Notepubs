<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>노트펍스 회원 로그인</title>
<link href="/css/member/inc/layout.css" type="text/css" rel="stylesheet" >
<link href="/css/member/login.css" type="text/css" rel="stylesheet" >
<link href="/css/member/find-confirm.css" type="text/css" rel="stylesheet" >
<script>
window.addEventListener('orientationchange', function(e){
    var isUpright = (window.orientation == 'portrait');
});
</script>
</head>
<body>
	<jsp:include page="../inc/header.jsp" />
	
	<div id="body">
		<section class="content-section ml-auto mr-auto first">
			<h1>전송 결과</h1>							
			<span class="info text-align-center mt-4">					
				가입한 이메일을 확인하세요. 				
			</span>
			<span class="login-button mt-4 text-align-center">					
				<a href="login">로그인하러가기</a>				
			</span>
		</section>		
    </div>
	
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>
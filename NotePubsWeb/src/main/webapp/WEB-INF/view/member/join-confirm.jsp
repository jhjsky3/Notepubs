<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>노트펍스 회원 가입</title>
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
			<h1>NotePubs 회원가입</h1>
			<h2 class="text-align-center mt-4">노트펍스 회원가입을 환영합니다.</h2>
			<h2 class="text-align-center mt-4">정상적으로 회원가입 처리가 완료되었습니다.</h2>
			<div class="text-center d-block mt-3">					
				<a class="join-button mt-3 text-align-center p-2" href="login">로그인하기</a>
			</div>
		</section>
		
    </div>
	
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>
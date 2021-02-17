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
			<h1>아이디 찾기</h1>
			<form class="login-form" action="login" method="post">
				<fieldset>
					<legend class="d-none">아이디 찾기 필드</legend>
					<span>
						<label>이메일주소</label>
						<input type="text" name="email" placeholder="가입할 때 기입한 이메일 주소를 입력하세요">
					</span>					
					<span>
						<input type="submit" value="이메일로 아이디 전달해주세요">					
						<span class="join-button mt-3 text-align-center">
							<a href="login">로그인 다시 시도</a> / <a href="find-pwd">비밀번호 찾기</a>
						</span>
						<a class="join-button mt-3 text-align-center" href="javascript:alert('죄송합니다.\r\n아직 준비중입니다...')">관리자에게 문의하기</a>
					</span>
					
				</fieldset>
		</form>
		</section>
		
    </div>
	
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>
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
			<form class="login-form" action="login" method="post">
				<fieldset>
					<legend class="d-none">가입 필드</legend>
					<span>
						<label class="w-100">아이디<!-- <span class="text-danger ml-3">(* 아이디가 이미 존재합니다.)</span> --></label>
						<input type="text" name="username" placeholder="로그인 할 때 사용할 아이디를 입력하세요">
					</span>
					<span>
						<label class="w-100">필명<!-- <span class="text-danger ml-3">(* 필명이 이미 존재합니다.)</span> --></label>
						<input type="text" name="username" placeholder="본명 또는 필명으로 사용할 이름을 입력하세요.">
					</span>
					<span>
						<label class="w-100">비밀번호<!-- <span class="text-danger ml-3">(* 비밀번호가 유효하지 않습니다. -영문 6문자 이상, 숫자 1, 대문자 1 이상 포함)</span> --></label>
						<input type="password" name="password1" placeholder="로그인 할 때 사용할 비밀번호을 입력하세요">
					</span>
					<span>
						<label class="w-100">비밀번호 확인<!-- <span class="text-danger ml-3">(* 비밀번호가 일치하지 않습니다.)</span> --></label>
						<input type="password" name="password2" placeholder="위의 비밀번호와 일치하도록 다시 한번 입력해주세요">
					</span>
					<span>
						<label class="w-100">이메일<!-- <span class="text-danger ml-3">(* 이메일 주소 형식이 올바르지 않습니다.)</span> --></label>
						<input type="email" name="email" placeholder="비밀번호를 찾을 때 사용할 이메일 주소를 입력하세요.">
					</span>
					<span class="bt">
						<input type="submit" value="가입하기">						
						<a class="join-button mt-3 text-align-center" href="login">로그인하기</a>
					</span>
				</fieldset>
		</form>
		</section>
		
    </div>
	
	<jsp:include page="../inc/footer.jsp" />

</body>
</html>
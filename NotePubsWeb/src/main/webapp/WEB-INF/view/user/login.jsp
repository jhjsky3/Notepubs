<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width,initial-scale=1, viewport-fit=cover" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>Insert title here</title>
<link href="/css/login.css" type="text/css" rel="stylesheet" >
</head>
<body>
	<header id="header">
		<ul>
			<li id="ham-button"><a href="" class="icon hamburger-icon">펼치기</a></li>
		</ul>
        <h1 class="logo"><a href="/index"><img src="/images/logo/logo-ldpi.png" alt="notepubs" ></a></h1>
       	<nav class="d-inline-block main-menu">
            <h1 class="d-none">메인메뉴</h1>
            <ul class="d-flex">
                <!-- <li><a href="/member/index">MyHome</a></li> -->
                <!-- <li>menu2</li>
                <li>menu3</li> -->
            </ul>
        </nav>
        <nav class="d-inline-block user-menu">
            <h1 class="d-none">간편메뉴</h1>
            <ul class="d-flex">
                <li><a class="c-button c-write-button" href="signup">가입하기</a></li>
            </ul>
        </nav>
    </header>
	<script>
		var CSS = {};
		CSS.set = function(element, attrs){
			for(var key in attrs)
				element.style[key] = attrs[key];
		}
		
		window.addEventListener("load", function(event){
			
			// hamburger 버튼을 누를 때의 행위
			var hamButton = document.querySelector("#ham-button");
			
			var aside = document.querySelector("#aside");
			CSS.set(aside, {
				top:"66px"
			});
			
			hamButton.onclick = function(e){
				e.preventDefault();
				
				// aside 창을 펼치는 행위
				if(aside.classList.contains("show")){
					aside.nextElementSibling.remove();
					aside.classList.remove("show");
				}
				else{
					var screen = document.createElement("div")
					CSS.set(screen, {
						position: "fixed",
						top:"66px",						
						width: "100%",
						height: "100%",
						background: "#000",
						opacity: "0.5",
						zIndex: "500"
					});
					
					screen.onclick = function(e){
						aside.classList.remove("show");
						e.target.remove();
					};
					
					aside.insertAdjacentElement('afterend', screen);
				
					aside.classList.add("show");
				}
			};
			
		});
	</script>
	<div class="body">
		<jsp:include page="../inc/aside.jsp"></jsp:include>
		<section class="login-form">
			<h1 class="d-none">로그인 폼</h1>
			<form action="login" method="post">
				<fieldset>
					<legend class="d-none">사용자 정보 입력</legend>
					<div>
						<div>
							<label class="d-none">아이디:</label>
							<input type="text" name="username" placeholder="사용자 아이디">
						</div>
						<div>
							<label class="d-none">비밀번호:</label>
							<input type="password" name="password" placeholder="비밀번호">							
						</div>
						<div class="margin-top">
							<input type="submit" value="로그인" class="text-align-center">
						</div>
						<div class="margin-top text-align-center">
							<a href="">아이디/비번 찾기</a>
						</div>
					</div>
				</fieldset>
			</form>
		</section>
		
	
    </div>
	
	
    <footer>
        <section>
            <h1>노트펍스 정보</h1>
            <div>
                저작권 : 
            </div>
        </section>
    </footer>

	
</body>
</html>
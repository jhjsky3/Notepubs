<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main class="main">
	<section class="content-section content first">
		<header>
			<h1 class="c-symbol c-symbol-note">
				<span>좋아요 관리</span>
				<span class="pl-3">20</span>				
			</h1>
			<a href="">필터링<span class="c-icon c-icon-keyboard-arrow-up filter-button">상태</span></a>		
		</header>
		
		<section class="tool-section content-section first">			
			<h1 class="d-none">필터링도구</h1>
			
			<div class="tool-list">
				<!-- <input type="checkbox"> -->
				
				<div>
					<label>내카테고리</label>
					<select>
						<option>선택</option>
						<c:forEach var="cc" items="${cates}">
						<option>${c.title}</option>
						</c:forEach>					
					</select>
				</div>
								
				<div>
					<label>카테고리</label>
					<select>
						<option>선택</option>
						<option>에러</option>
						<option>코드</option>
						<option>노트</option>	
					</select>
				</div>
			
				<div>
					<label>메인언어</label>
					<select>
						<option>선택</option>
						<c:forEach var="lang" items="${langs}">
						<option>${lang.engName }</option>
						</c:forEach>
					</select>
				</div>
				
				<div>
					<label>플랫폼</label>
					<select>
						<option>선택</option>
						<option>Java</option>
						<option>닷넷</option>
						<option>HTML5</option>
						<option>리눅스</option>
					</select>
				</div>
				
				<div>
					<label>제목검색</label>
					<input class="input" type="text" placeholder="검색어를 입력하세요" >
				</div>
				
				<div>
					<label>기간으로 검색</label>
					<div class="input">
						<input checked name="term" type="radio"><label class="ml-2">모두</label>
						<input class="ml-3" name="term" type="radio"><label class="ml-2">최근 2주</label>
						<input class="ml-3" name="term" type="radio"><label class="ml-2">최근 1달</label>
					</div>
				</div>
				
			</div>
		</section>
		
		
		<section class="note-section list-section content-section">
			<h1 class="d-none">
				<span><span class="color-note">NOTE</span> PUBLIC</span>
				<span>
					<a href="">왼쪽</a>
					<a href="">오른쪽</a>
				</span>
			</h1>
			<div class="pl-5">
				<input class="" type="checkbox" ><a class="ml-2" href="pub-all">일괄선택</a>				
				<input class="ml-3 btn-del-all" type="button" value="일괄 삭제">
			</div>
			<div class="clipper">
				<div class="note-list">
				<c:forEach var="i" begin="0" end="9">
					<section class="note">
						<h1>자바 프로그래밍</h1>
						<p>
							개발 및 테스트용으로 Windows 10 64bit에 IIS와 Tomcat을 설치하고 연동을 해보겠습니다. IIS와 Tomcat을 연동한다는 말은 웹서버로 IIS를 사용하고, Servlet/Jsp 에 대한 요청은 Tomcat이 처리하도록 한다는 뜻입니다. Tomcat도 내부에 HTTP 서버 기능이 있지만 보통 운영시에는 IIS나 Apache 같은 웹서버를 앞단에 두어 정적 데이터는 웹서버가 처리하고 동적 데이터의 처리는 Tomcat이 담당하도록 많이 구성합니다. 이때 IIS에 ISAPI(Internet Server Application Programming Interface) 확장 모듈을 사용해서 특정 URL 또는
						</p>
						<div class="info">
							<span>카테고리 없음</span>
							<span>2020-12-23 00:23</span>
						</div>
						<div class="info">
							<span class="text-strong text-danger">좋아요일 : 2021-01-23 23:12</span>
							<a href="1/pub">삭제</a>
						</div>
						<div class="info">
							<span class="c-symbol c-symbol-like text-strong">123</span>
							<span class="c-symbol c-symbol-hit c-symbol-color text-strong">323</span>
							<span class="c-symbol c-symbol-bookmark text-strong">1321</span>
						</div>
						
					</section>					     	
				</c:forEach>
				</div>
			</div>
			<div class="text-align-center">
				<span class="btn px-5">더보기</span>
			</div>
			<!-- <div class="pager">
				<h2 class="d-none">페이저</h2>
				<div>
					<a href="">이전</a>
				</div>
				<ul class="pager-list">
					<li><a href="" class="current">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li><a href="">5</a></li>
				</ul>
				<div>
					<a href="" class="">다음</a>
				</div>
			</div> -->
		</section>
		
	</section>
	
</main>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

			<main>
				<section class="todays-book">
					<h1>Today's Public Notes</h1>
					<div class="flip-note-list">						
						<c:forEach var="n" items="${hitNoteList}">
						
							<section class="flip-note">
								<div>
									<h1>${n.title}</h1>
									<div class="note-content">
										<c:if test="${not empty n.thumbImg}">
											<div class="thumb-img"><img style="object-fit: fill;" src="${n.thumbImg}"></div>
										</c:if>
										${n.content}
									</div>	
									<div class="info">
										<span>카테고리 없음</span>
										<a class="btn bg-main1 text-white text-strong" href="note/${n.id}">더보기</a>
										<fmt:formatDate var="t" value="${n.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
										<span>${t}</span>
									</div>
								</div>
							</section>					     	
						</c:forEach>
					</div>
				</section>
				<section>
					<h1 class="d-none">노트관리</h1>
					<section class="note-section list-section">
						<h1>
							<span><span class="color-note">NOTE</span> PUBLIC</span>
							<span>
								<a class="c-icon c-icon-prev btn-note-prev" href="">왼쪽</a>
								<a class="c-icon c-icon-next btn-note-next" href="">오른쪽</a>
							</span>
						</h1>
						<div class="clipper">
							<div class="note-list">
							<c:forEach begin="1" end="10" var="n" items="${newNoteList}">
								<section class="note">
									<h1><a href="note/${n.id}">${n.title}</a></h1>
									<div class="note-content">
										<c:if test="${not empty n.thumbImg}">
											<div class="thumb-img"><img style="width: 100%;" src="${n.thumbImg}"></div>
										</c:if>
										${n.content}
									</div>										
									<div class="info">
										<span>카테고리 없음</span>
										<fmt:formatDate var="t" value="${n.regDate}" pattern="yyyy-MM-dd HH:mm"/>
										<span>${t}</span>
									</div>
									<div class="info">
										<span class="c-symbol c-symbol-like c-symbol-color text-strong">${n.likeCount}</span>
										<span class="c-symbol c-symbol-hit c-symbol-color text-strong">${n.hit}</span>
										<span class="c-symbol c-symbol-bookmark c-symbol-color text-strong">${n.bookMarkCount}</span>
									</div>
									<sec:authorize access="isAuthenticated()">
									<c:if test="${user.username == n.writerId}">
									<div class="cover">									
										<div class="show-button"><a href="note/1">보기</a></div>
										<div class="edit-button"><a href="">수정</a></div>
										<div class="del-button"><a href="">삭제</a></div>
									</div>
									</c:if>
									</sec:authorize>
								</section>					     	
							</c:forEach>
							</div>
						</div>
					</section>
					<section class="book-section list-section">
						<h1>
							<span><span class="color-book">BOOK</span> PUBLIC</span>
							<span>
								<a class="c-icon c-icon-prev" href="">왼쪽</a>
								<a class="c-icon c-icon-next" href="">오른쪽</a>
							</span>
						</h1>
						<div class="clipper">
							<div class="book-list">
							<c:forEach begin="1" end="10">
								<section class="book">
									<p>
										개발 및 테스트용으로 Windows 10 64bit에 IIS와 Tomcat을 설치하고 연동을 해보겠습니다. IIS와 Tomcat을 연동한다는 말은 웹서버로 IIS를 사용하고, Servlet/Jsp 에 대한 요청은 Tomcat이 처리하도록 한다는 뜻입니다. Tomcat도 내부에 HTTP 서버 기능이 있지만 보통 운영시에는 IIS나 Apache 같은 웹서버를 앞단에 두어 정적 데이터는 웹서버가 처리하고 동적 데이터의 처리는 Tomcat이 담당하도록 많이 구성합니다. 이때 IIS에 ISAPI(Internet Server Application Programming Interface) 확장 모듈을 사용해서 특정 URL 또는
									</p>
									<div class="book-buttons">
										<!-- <a href="">펼침</a> -->
										<a href="book/1">읽기</a>
										<a href="">수정</a>
										<a href="">삭제</a>
									</div>
									<div class="cover" style="background: #fff;background-size: contain;">
										<h1>자바 프로그래밍</h1>
										<footer>
											저작자 : newlec
										</footer>					
									</div>
								</section>
							</c:forEach>
							</div>
						</div>
					</section>
					<section class="printed-section book-section list-section">
						<h1>
							<span><span class="color-printed">PRINTED</span> PUBLIC</span>
							<span>
								<a class="c-icon c-icon-prev" href="">왼쪽</a>
								<a class="c-icon c-icon-next" href="">오른쪽</a>
							</span>
						</h1>						
						<div class="clipper">
							<div class="book-list">
							<c:forEach begin="1" end="1">
								<section class="printed book">
									<h1>자바 프로그래밍</h1>
									<p>
										개발 및 테스트용으로 Windows 10 64bit에 IIS와 Tomcat을 설치하고 연동을 해보겠습니다. IIS와 Tomcat을 연동한다는 말은 웹서버로 IIS를 사용하고, Servlet/Jsp 에 대한 요청은 Tomcat이 처리하도록 한다는 뜻입니다. Tomcat도 내부에 HTTP 서버 기능이 있지만 보통 운영시에는 IIS나 Apache 같은 웹서버를 앞단에 두어 정적 데이터는 웹서버가 처리하고 동적 데이터의 처리는 Tomcat이 담당하도록 많이 구성합니다. 이때 IIS에 ISAPI(Internet Server Application Programming Interface) 확장 모듈을 사용해서 특정 URL 또는
									</p>									
									<div class="book-buttons">
										<a href="">읽기</a>
										<a href="">수정</a>
										<a href="">삭제</a>
									</div>
									<div class="cover" style="background: #fff url(/images/book-cover/java.png) no-repeat;background-size: contain;">
										
									</div>
								</section>
							</c:forEach>
							</div>
						</div>
					</section>
				</section>
			</main>

<script src="/js/lib/turnjs4/lib/turn.js"></script>
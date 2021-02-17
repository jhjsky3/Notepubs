<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <main class="main">
            <section class="content-section first count-board">
                <h1 class="d-none">집계보드</h1>
                <dl>
                    <dt>오늘 조회수</dt>
                    <dd>12</dd>
                    <dt>어제 조회수</dt>
                    <dd>24</dd>
                    <dt>28일 조회수</dt>
                    <dd>3212</dd>
                </dl>
            </section>
            <%-- <section class="books-writing content-section">
                <header>
                    <h1>집필중인 서적</h1>
                    
                </header>
                <div class="book-list">
                    <c:forEach var="i" begin="1" end="2">
						<c:set var="isCurrent" value="${param.id==Integer.parseInt(i)}" />					
						<section class="book ${isCurrent?'current':''}">
							<h1><a href="book/detail?id=1">편하게 읽는 자바 프로그래밍</a></h1>
							<div>
								<div class="img">
									<a href="book/detail?id=1"><img src="../../resource/images/book/cover-java.png"></a>
								</div>
								<div class="detail">
									<dl class="info">
										<dt class="note">노트 :</dt>
										<dd>321개</dd>
										<dt class="note">챕터 :</dt>
										<dd>6개</dd>
										<dt class="note">수정일 :</dt>
										<dd>2020-05-12</dd>
									</dl>
									<div>
										<a href="" class="c-btn c-btn-default">통계</a>
									</div>
								</div>
								<div class="analize d-none">
									<span class="note">320 조회수</span> <span class="chapter">6
										구독자</span> <span class="a">aaa</span> <span class="button c-symbol">버튼</span>
								</div>
							</div>
						</section>
					</c:forEach>
                </div>
            </section> --%>
            
            <section class="recent-note content-section">                
                <header>
                    <h1>조회수 상위 노트</h1>                    
                </header>
                <div>
                <c:forEach var="n" items="${list}" >
                    <section>
                    	<h1><a href="/note/detail?id=${n.id}" target="_blank">${n.title }</a></h1>
                    	<div>
                    		<!-- <p><img src="https://img1.daumcdn.net/thumb/C217x122/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FKKCxE%2FbtqAhWwu6zY%2Ft5GjiHWsaiqDkYZkuptfd0%2Fimg.png"></p> -->
                    		<p>${n.notetext}</p>
                    	</div>
                    	<dl>
                    		<dt>조회</dt>
                    		<dd>${n.hit}</dd>
                    		<dt>댓글</dt>
                    		<dd>0</dd>
                    		<dt>좋아요</dt>
                    		</dd>0</dd>
                    	</dl>
                    </section>
                </c:forEach>
                </div>
            </section>
        </main>
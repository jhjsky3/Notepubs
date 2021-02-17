<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/css/note.css" rel="stylesheet" type="text/css" />


	<main class="main">
		<section class="countable-list padding-list note-list">
				<h1>
					<span class="count"><span>노트</span><span></span></span>
					<span class="option">
					<%-- <a class="${regSelect}" href="../note/list?f=reg">최신순</a>
					<a class="${likeSelect}" href="../note/list?f=like">인기순</a>
					<a class="${hitSelect}" href="../note/list?f=hit">조회수</a> --%>
					</span>
				</h1>
				
				<ul class="">
				<c:forEach var="note" begin="0" end="4">
				
					<li>
						<article>
							<h1 class="title"><a href="1">자바 프로그래밍</a></h1>
							
							<div class="content ">
							동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세~
							동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세~
							동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세~
							동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세~
							동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세~
							동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세~
							동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세~
							동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세~
							동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세~
							동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세~
							</div>
							<footer class="footer">
								<span>newlec</span>
								<span class="regdate">2021-01-20</span>
								<span class="count hit">12</span>
							</footer>
						</article>
					</li>					
				</c:forEach>
				
				</ul>
			</section>
			<section style="margin-bottom: 30px; margin-top: 20px;">
				
				<h1 class="hidden">페이저</h1>
			</section>
	</main>




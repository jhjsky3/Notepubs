<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/css/note.css" rel="stylesheet" type="text/css" />
		
		<!-- main -->
		<main class="main note-detail">
			<article>
				<header class="header">
					<h1 class="title-box"><span class="title">${n.title}</span></h1>
					<h2 class="writer-id-box"><span class="writer-id">${n.writerId}</span></h2>
				</header>
				<footer class="footer">
					<%-- <span>${note.writerId}</span> --%>
					<span><fmt:formatDate value="${n.regDate}" pattern="yyyy-MM-dd" /> </span>
					<span class="item-count-box">
						<%-- <a href="#comment-list" class="item-count comment-count">${note.commentCount}</a>
						<span class="item-count like-count">${likeCount}</span> --%>
						<span class="item-count hit-count">${n.hit}</span>
					</span>
				</footer>
				<div class="content">${n.content}</div>
			</article>
					
			<%-- <section id="like-section">
				<h1 class="hidden">버튼</h1>
				<div class="inline-center margin-bottom">
				<c:set var="likeStyle" value="" />
				
				<c:if test="${isMyLike == true}">
					<c:set var="likeStyle" value="btn-notice" />
				</c:if>
					<a href="${note.id}/like" class="btn btn-like ${likeStyle}"><span>Good</span> <span> (${likeCount})</span></a>
				</div>
			</section> --%>
			
			<section class="margin-bottom">
				<h1 class="hidden">네비게이션</h1>
				<ul>
					<li style="text-align: center;"><a href="list" class="btn btn-normal">노트목록</a></li>
				</ul>
			</section>
			
			<script>
				window.addEventListener("load", function(event) {
					//var likeButton = document.querySelector(".btn-like");
					//likeButton.onclick = function(e){
						//e.preventDefault();
						// 아 귀찮다... 그냥 서버 코드로하고 이건 나중에...
						
					//};
				});
			</script>
			
			<!-- === 댓글 목록 ========================================================================== -->
			<section class="countable-list comment-list" id="comment-list">
				<h1>
					<span class="count"><span>댓글</span><span>5</span></span>
					<span class="option">
						<a class="btn btn-round" href="list">노트목록보기</a>
						<a id="comment-button" class="btn btn-round" href="1#comment-form">댓글쓰기</a>
					</span>
				</h1>
				<ul class="">
				<c:forEach begin="0" end="4" >
					<li class="comment edit">
						<article>
							<footer>
							
								<img src="../..s/images/picture-empty.png" />
							
								<span class="member-id">
								newlec
								</span>
								<span style="margin-right: 10px;">2021-02-15 오후 11:23</span>
								<a href="" class="edit-button">수정</a>
								<a href="" class="del-button">삭제</a>
								<a href="" class="save-button">저장</a>
								<a href="" class="cancel-button">취소</a>
								
							</footer>
							<div class="comment-content" data-id="1">
								<p>굿</p>
								<textarea></textarea>								
							</div>
							
						</article>
					</li>
				</c:forEach>
				</ul>
			</section>
			<script>
				window.addEventListener("load", function(e) {
					var commentList = document.querySelector("#comment-list");
					commentList.onclick = function(e){
						
						e.preventDefault();
						
						var li = e.currentTarget;
						var contentDiv = li.querySelector(".comment-content");
						
						
						if(e.target.nodeName != "A")
							return;
												
						if(e.target.classList.contains("edit-button")){
							li.classList.add("edit");
						} 
						else if(e.target.classList.contains("del-button")){
							request = new XMLHttpRequest();
							
							request.onload = function(){
								
							};
							
							request.open("GET", "api/comment/1/del", true);
							request.send(null);
						}
							
												
					};
				});
			</script>
			<!-- === 댓글 등록 ============================================================================== -->
			<section class="comment-form" id="comment-form">
				<h1 class="hidden">댓글 입력 폼</h1>
				<h2 class="hidden">댓글을 달아보세요!</h2>
				<form action="2/comment/reg" method="post">
				
				
					<div>
						<label class="hidden">필명</label>
						<input type="text" placeholder="필명" name="nic-name" />
						<label class="hidden">비밀번호</label>
						<input type="password" placeholder="비밀번호"  name="pwd"/>
					</div>
				
					<div>
						<label class="hidden">댓글</label>
						<textarea cols="48" rows="5" name="content" required="required"></textarea>
					</div>
					<div>
						<span>
							<input type="checkbox" id="secret-option" name="secret" value="true" />
							<label for="secret-option">비밀댓글</label>
						</span>
						<input type="submit" value="등록" class="btn submit-button" />
					</div>
				</form>
			</section>
			
			
			<!-- === 이전 /다음 노트 ======================================================================================== -->		
			<nav class="sibling-nav">
				<h1></h1>
				<ul>					
					<li>
						<span>다음 노트가 없습니다.</span>					
					</li>
					<li>
						<span>이전 노트가 없습니다.</span>
					
					</li>
				</ul>
			</nav>
			
		</main>

	
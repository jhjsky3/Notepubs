<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/css/note.css" rel="stylesheet" type="text/css" />
<c:set var="root" value="${pageContext.request.contextPath }"  />


<%-- <fmt:setLocale value="en_US" scope="session"/> --%>
		
		<!-- main -->
		<main class="main note-detail" style="background: #fff;">
			<article>
				<header class="header">
					<h1 class="title-box"><span class="title">${note.title}</span></h1>
					<h2 class="writer-id-box"><span class="writer-id">${note.writerId}</span></h2>
				</header>
				<footer class="footer">
					<%-- <span>${note.writerId}</span> --%>
					<span><fmt:formatDate value="${note.regDate}"/></span>
					<span class="item-count-box">
						<%-- <a href="#comment-list" class="item-count comment-count">${note.commentCount}</a>
						<span class="item-count like-count">${likeCount}</span> --%>
						<span class="item-count hit-count">${note.hit}</span>
					</span>
				</footer>
				<div class="content">
					${note.content}
				</div>
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
					<li style="text-align: center;">
						<a href="list" class="btn btn-default">노트목록</a>
						<a href="${note.id}/edit" class="btn btn-normal">수정</a>
						<a href="${note.id}/del" class="btn btn-normal">삭제</a>
					</li>
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
			<%-- <section class="countable-list comment-list" id="comment-list">
				<h1>
					<span class="count"><span>댓글</span><span>${note.commentCount}</span></span>
					<span class="option">
						<a class="btn btn-round" href="list">노트목록보기</a>
						<a id="comment-button" class="btn btn-round" href="${note.id}#comment-form">댓글쓰기</a>
					</span>
				</h1>
				<ul class="">
				<c:forEach var="c" items="${note.comments}">
					<li class="comment edit">
						<article>
							<footer>
							<c:if test="${empty c.member.photo}">
								<img src="../..s/images/picture-empty.png" />
							</c:if>
							<c:if test="${not empty c.member.photo}">
								<img src="../..s/users/${c.member.id}/${c.member.photo}" />							
							</c:if>
								<span class="member-id">
								${c.memberId==null?'(비로그인)':c.memberId}
								<c:if test="${c.secret == true}">
								비공개
								</c:if>
								<c:if test="${c.secret != true}">
								${c.nicName}
								</c:if>
								</span>
								<span style="margin-right: 10px;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${c.regDate}"/></span>
								<a href="" class="edit-button">수정</a>
								<a href="" class="del-button">삭제</a>
								<a href="" class="save-button">저장</a>
								<a href="" class="cancel-button">취소</a>
								
							</footer>
							<div class="comment-content" data-id="${c.id}">
								<p>${c.content}</p>
								<textarea>${c.content}</textarea>								
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
							
							request.open("GET", "comment/del-ajax?id", true);
							request.send(null);
						}
							
												
					};
				});
			</script> --%>
			<%-- <!-- === 댓글 등록 ============================================================================== -->
			<section class="comment-form" id="comment-form">
				<h1 class="hidden">댓글 입력 폼</h1>
				<h2 class="hidden">댓글을 달아보세요!</h2>
				<form action="${note.id}/comment/reg" method="post">
				<!-- authenticated -->
				<sec:authorize access="isAuthenticated()">
					<div>									
						<input type="text" readonly="readonly" value="${pageContext.request.userPrincipal.name}"/>										
						<input type="text" readonly="readonly" value="**********"/>
					</div>
				</sec:authorize>
				<sec:authorize access="!isAuthenticated()">
					<div>
						<label class="hidden">필명</label>
						<input type="text" placeholder="필명" name="nic-name" />
						<label class="hidden">비밀번호</label>
						<input type="password" placeholder="비밀번호"  name="pwd"/>
					</div>
				</sec:authorize>
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
			
			<script>
			
			window.addEventListener("load", function(event) {
				var commentButton = document.querySelector("#comment-button");
				var commentForm = document.querySelector("#comment-form");
				
				
				commentButton.onclick = function(e){
					
					/* e.preventDefault();
					e.stopPropagation(); */
					
					commentForm.style.display = "block";				
				};	
				
			});
			
			</script> --%>
			
			<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<script src="..s/js/lib/jquery-util.js"></script>
			<script>
					
				// 비동기로 댓글 등록하는 코드
				$(function(){			
					
					var submitButton = $(".comment-form input[type='submit']");
					
					submitButton.click(function(e){
						e.preventDefault();//submit 을 막는다.
						
						// 파일이 포함되느냐.... 아니냐... encodeType
						// Multipart -> new FormData();
						// key=value&key=value&...
						
						var data = $(".comment-form form").serialize();
						//alert(data);
						//$.ajax();
						//$.get(); / $.getJSON() / $.getScript();
						//$.post();
						//?.load();
						
						//$.post("?/comment/reg-ajax", {nicName:nicNameInput.val(), })
						$.post("${note.id}/comment/reg", data, function(result){
							
							if(parseInt(result) == 1){
								alert("ok");
								
								$.getJSON("${note.id}/ajax-comment/list", function(comments){
											
									
								});
							}
						});
						
					});
				});
			</script> -->
			
			<!-- === 이전 /다음 노트 ======================================================================================== -->		
			<%-- <nav class="sibling-nav">
				<h1></h1>
				<ul>					
					<li>
					<c:if test="${not empty note.next}">
						<a href="${note.next.id}">${note.next.title}</a>
					</c:if>
					<c:if test="${empty note.next}">
						<span>다음 노트가 없습니다.</span>
					</c:if>
					</li>
					<li>
					<c:if test="${not empty note.prev}">
						<a href="${note.prev.id}">${note.prev.title}</a>
					</c:if>
					<c:if test="${empty note.prev}">
						<span>이전 노트가 없습니다.</span>
					</c:if>
					</li>
				</ul>
			</nav>		 --%>
			
		</main>

	

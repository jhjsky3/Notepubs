<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <aside id="aside">
            <h1 class="d-none">관리정보</h1>
            <section class="profile">
                <h1 class="d-none">프로필</h1>
                <div>
                    <div class="photo"><img src=""></div>
                    <div class="info">
                        <span>${member.nicname}</span>
                        <a class="url" href="">${member.email}</a>
                    </div>
                </div>
            </section>
            <nav class="fav-menu">
                <h1 class="d-none">자주사용하는메뉴</h1>
                <ul>
                    <li><a href="/member/index">회원 대시보드</a></li>
                    <li class="admin-menu d-none"><a href="/admin/index">관리자 대시보드</a></li>                                        
                </ul>
            </nav>
            <nav class="content-menu aside-menu">
                <h1 class="c-symbol c-note-symbol d-none">회원정보</h1>
                <ul>
                    <li class=""><a href="/member/edit">회원정보변경</a></li>
                </ul>
            </nav>
            <nav class="content-menu aside-menu">
                <h1 class="c-symbol c-note-symbol">콘텐츠관리</h1>
                <ul>
                    <li class="current"><a href="/member/note/list">노트관리</a></li>
                    <li><a href="/member/book/list">북관리</a></li>
                    <li><a href="/member/category/list">카테고리</a></li>
                    
                </ul>
            </nav>
            <nav class="community-menu aside-menu">
                <h1 class="c-symbol c-comment-symbol">노트 커뮤니티</h1>
                <ul>
                	<!-- <li><a href="/member/hit/list">조회</a></li> -->
                    <!-- <li><a href="">댓글</a></li> -->
                    <li><a href="/member/bookmark/list" class="">북마크</a></li>
                    <li><a href="/member/like/list">좋아요</a></li> 
                    <li><a href="/member/comment/list">댓글</a></li>                    
                </ul>
            </nav>
            
        </aside>
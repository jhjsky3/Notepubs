<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <aside id="aside">
            <h1 class="d-none">관리정보</h1>
            <section class="profile">
                <h1 class="d-none">프로필</h1>
                <div>
                    <div class="photo"><img src=""></div>
                    <div class="info">
                        <span>newlec</span>
                        <a class="url" href="">http://www.notepubs.com/newlec</a>
                    </div>
                </div>
            </section>
            <nav class="fav-menu">
                <h1 class="d-none">자주사용하는메뉴</h1>
                <ul>
                    <li class=""><a href="/admin/index">관리자 대시보드</a></li>                                                          
                </ul>
            </nav>
            <nav class="content-menu aside-menu">
                <h1 class="c-symbol c-note-symbol">콘텐츠관리</h1>
                <ul>
                    <li class=""><a href="/admin/notice/list">공지사항</a></li>
                    <li class="current"><a href="/admin/language/list">언어</a></li>
                    <li class=""><a href="/admin/platform/list">플랫폼</a></li>
                    <li><a href="/admin/event/list">이벤트</a></li>
                </ul>
            </nav>
            <nav class="content-menu aside-menu">
                <h1 class="c-symbol c-symbol-person">회원관리</h1>
                <ul>
                    <li class=""><a href="/admin/member/list">회원</a></li>         
                </ul>
            </nav>
            <nav class="community-menu aside-menu">
                <h1 class="c-symbol c-comment-symbol">커뮤니티</h1>
                <ul>
                	<li><a href="">피드백</a></li>
                	<li><a href="">신고내역</a></li>
                    <li><a href="">댓글</a></li>
                    <li><a href="" class="">북관리</a></li>
                    <li><a href="">좋아요</a></li>
                    <li><a href="">북관리</a></li>
                </ul>
            </nav>
        </aside>
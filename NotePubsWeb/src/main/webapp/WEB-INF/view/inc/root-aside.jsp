<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    		<aside class="aside">
				<nav class="top-like">
					<h1>많이 본 NOTE</h1>
					<ul>
					<c:forEach varStatus="st" var="n" items="${list}">
						<li><span class="num">${st.count}</span><a href="note/${n.id}">${n.title}</a></li>
					</c:forEach>
					</ul>
				</nav>
				
			</aside>
			<script type="module" src="/js/inc/aside.js"></script>
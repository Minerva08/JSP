<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dao" value="<%=MemberDAO.getInstance() %>" />
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day12 - quiz</title>
<style>
	body {
		width: 100%;
		overflow-x: hidden;
		margin: 0;
		padding: 0;
	}
	div {
		margin: 0;
		padding: 0;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	nav > ul {
		padding: 0;
		list-style: none;
		width: 100%;
	}
	nav > ul > li {
		width: 120px;
		height: 40px;
		margin: 10px;
		border: 1px solid black;
	}
	nav > ul > li > a {
		display: block;
		cursor: pointer;
		width: 100%;
		text-align: center;
	}
	nav > ul > li > a:hover {
		text-decoration: underline;
	}
	.flex {
		display: flex;
	}
	.jc {
		justify-content: center;
	}
	.ai {
		align-items: center;
	}
	header {
		border-bottom: 2px solid black;
		padding: 0;
		margin: 0;	
	}
	main {
		width: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-flow: column;
	}
	.info {
		display: flex;
		justify-content: flex-end;
		padding-right: 20px;
	}
</style>
</head>
<body>
<header>
	<div class="flex jc ai">
		<h1><a href="${cpath }">회원 관리</a></h1>
	</div>
	<nav>
		<ul class="flex jc">
			<li class="flex jc ai"><a href="${cpath }/join.jsp">회원가입</a></li>
			<li class="flex jc ai">
				<c:if test="${not empty login }">
					<a href="${cpath }/logout.jsp">로그아웃</a>	
				</c:if>
				<c:if test="${empty login }">
					<a href="${cpath }/login.jsp">로그인</a>	
				</c:if>
				
			</li>
			<li class="flex jc ai"><a href="${cpath }/">회원정보</a></li>
			<li class="flex jc ai"><a href="${cpath }/">회원탈퇴</a></li>
		</ul>
	</nav>	
	<div class="info">
		<c:if test="${not empty login }">
			<p><strong>${login.username }</strong> 님 접속중</p>
		</c:if>
	</div>
</header>







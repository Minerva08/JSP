<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="day07_book.BookDTO, java.util.ArrayList, java.util.Arrays"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css" />">
<title>BOOK</title>
</head>
<body>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<header>
	<div id="logo">
		<h1><a href="${cpath }">도서 베스트 셀러 - 교보문고</a></h1>
	</div>
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">목록</a></li>
			<li><a href="${cpath }/regist.jsp">등록</a></li>
			<li><a href="${cpath }/search.jsp">검색</a></li>
			<li><a href="${cpath }/modify.jsp">수정</a></li>
			<li><a href="${cpath }/delete.jsp">삭제</a></li>
		</ul>
	</nav>
</header>
<hr>

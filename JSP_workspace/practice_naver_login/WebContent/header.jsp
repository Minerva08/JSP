<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="dao" class="naver.MemberDAO" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Naver</title>
<link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css" />">
</head>
<body>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<h1><a href="${cpath }">NAVER</a></h1>
<table border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td><a href="${cpath }">로그인</a></td>
		<td><a href="${cpath }/join.jsp">회원가입</a></td>
	</tr>
</table>
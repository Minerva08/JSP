<%@page import="org.apache.tomcat.util.http.parser.Cookie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>loginTest</h1>
<hr>
<div style="display:flex; width:100%">
	<div style="width:300px">
	<c:if test="${empty login }">
		<form method="POST" action="login_pro.jsp">
			<p><input type="text" name="user_id" placeholder="아이디" required autofocus></p>
			<p><input type="password" name="user_pw" placeholder="비번" required autofocus></p>
			<p><label><input type="checkbox" name="autologin">자동로그인</label></p>
			<p><input type="submit" value="로그인"></p>
		</form>
	</c:if>
	<c:if test="${not empty login }">
		<a href="logOut.jsp"><button>${login.name }로그아웃</button></a>
	</c:if>
	</div>
	<%
	session.getId();
	%>
	<h3>${login.user_id }</h3>
	
</div>
</body>
</html>
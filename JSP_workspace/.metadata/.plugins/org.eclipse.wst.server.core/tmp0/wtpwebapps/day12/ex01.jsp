<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp - Session</title>
</head>
<body>

<h1>session 기초</h1>
<hr>

<ul>
	<li>쿠키는 클라이언트에 문자열 정보를 저장한다</li>
	<li>세션은 서버에 객체 정보를 저장한다 (JSP)</li>
	<li>서버가 하나의 거대한 건물이라면, 건물에 찾아오는 여러 손님(client)을 1:1로 상대하는 직원이 세션에 해당한다</li>
	<li>서버에서 application내장 객체는 하나이지만, 세션은 여러개가 존재할 수 있다</li>
	<li>쿠키로 처리 가능한 일이라면, 세션으로도 처리가 가능하다</li>
</ul>

<h4>세션 생성 시간 : <%=session.getCreationTime() %></h4>
<h4>세션 생성 시간 : <%=new Date(session.getCreationTime()) %></h4>
<h4>세션이 유효한 시간 (초) : <%=session.getMaxInactiveInterval() %></h4>
<h4>마지막으로 세션에 접근한 시간 : <%=new Date(session.getLastAccessedTime()) %></h4>
<h4>다수의 세션을 구분하기 위한 ID : <%=session.getId() %></h4>
<h4>마지막 사용 세션의 ID를 저장한 쿠키 : ${cookie.JSESSIONID.value }</h4>
<h4>세션이 새로 생성된 세션인가 : <%=session.isNew() %></h4>

<% 
	//session.invalidate();
	session.setMaxInactiveInterval(10);
%>

</body>
</html>
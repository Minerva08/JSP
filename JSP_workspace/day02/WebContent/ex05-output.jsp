<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-output.jsp</title>
</head>
<body>
	
	<h1>ex05 - 출력만 하는 페이지</h1>
	<hr>
<%-- 	<%=request.getParameter("name") %> 님은 --%>
<%-- 	<%=request.getParameter("age") %>살이므로, 입장 가능합니다 --%>
	<%=request.getAttribute("message") %>
	
</body>
</html>
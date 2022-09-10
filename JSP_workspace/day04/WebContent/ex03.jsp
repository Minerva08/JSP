<%@ page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03 - forward</title>
</head>
<body>

<h1>ex03 - forward</h1>

<%
	// request.getRequestDispatcher("ex02-home.jsp").forward(request, response);
	// 자바에서 구현하는 forward 문법을 간소화해서 액션태그로 사용할 수 있음
	String name = URLEncoder.encode("아이유", "UTF-8");
%>

<jsp:forward page="ex01-home.jsp">
	<jsp:param value="<%=name %>" name="name" />
</jsp:forward>


</body>
</html>
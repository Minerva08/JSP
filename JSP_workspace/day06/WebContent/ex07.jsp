<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07 - formatDate</title>
</head>
<body>
	<%
		Date date = new Date();
		pageContext.setAttribute("today",date);
	%>
	<h3>그냥 today 출력 : ${today }</h3>
	
	<h3>default :<fmt:formatDate value="${today}" dateStyle="default" /></h3>
	<h3>short :<fmt:formatDate value="${today}" dateStyle="short" /></h3>
	<h3>medium :<fmt:formatDate value="${today}" dateStyle="medium" /></h3>
	<h3>long :<fmt:formatDate value="${today}" dateStyle="long" /></h3>
	<h3>full :<fmt:formatDate value="${today}" dateStyle="full" /></h3>
	<h3>pattern :<fmt:formatDate value="${today}" pattern="yyyy-MM-dd a HH:mm:ss" /></h3>
</body>
</html>
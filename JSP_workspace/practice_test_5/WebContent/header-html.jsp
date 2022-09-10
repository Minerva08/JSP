<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#logo{
		text-align: center;
	}
	main{
		height: 500px;
	}
	
</style>
</head>
<body>
<div id="logo">
	<h1><a >KIOSK</a></h1>
	<c:if test="${not empty login}">
		${login.userid }
		<div><a href="${cpath }menu/menuupload.jsp"><button>메뉴 등록</button></a></div>
		<div><a href="${cpath }master/sales.jsp"><button>매출전표</button></a></div>
		
	</c:if>
	<c:if test="${empty login }">
		<div><a href="${cpath }master/login.jsp"><button>로그인</button></a></div>
	</c:if>
	<hr>
</div>



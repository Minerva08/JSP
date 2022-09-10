<%@page import="board.BoardDAO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="memberDAO" value="<%=MemberDAO.getInstance() %>"/>
<c:set var="boardDAO" value="<%=BoardDAO.getInstance() %>"/>
<% 	request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
	#logo>h1{
		text-align: center;
	}
	.content{
		display: flex;
		width:1000px;
		margin:10px auto;
		margin-top: 60px;
	}
	.login_state{
		border: 2px solid black;
		width:200px;
		justify-content: flex-start;
		height: 240px;
		padding: 0;
		
		
	}
	.list{
		margin-left: 100px;
		padding:0;
		
	}
	
	
}
	
	
</style>
<body>
	<header>
		<div id="logo">
			<h1>NAVER-CAFE</h1>
		</div>
		<hr>
	</header>
	
	
	

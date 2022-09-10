<%@page import="day05.PhoneBookDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div.menu {
		display: inline-block;
		width: 120px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		font-size: 16px;
		font-weight: bold;
		border: 1px solid black;
		box-sizing: border-box;
	}
</style>
</head>
<body>
<%
	ArrayList<PhoneBookDTO> list = (ArrayList<PhoneBookDTO>)application.getAttribute("list");
 
	if(list == null) {
		list = new ArrayList<PhoneBookDTO>();
		list.add(new PhoneBookDTO("이지은", "010-1234-1234"));	
		list.add(new PhoneBookDTO("홍진호", "010-2222-2222"));	
		list.add(new PhoneBookDTO("김희철", "010-2323-2323"));
	}
	
	application.setAttribute("list", list);
%>

<h1>간단 전화번호부</h1>
<hr>
<div class="menu"><a href="index.jsp">목록</a></div>
<div class="menu"><a href="regist.jsp">추가</a></div>
<div class="menu"><a href="delete.jsp">삭제</a></div>
<hr>

</body>
</html>
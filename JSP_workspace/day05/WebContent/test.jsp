<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
	// 선언부
	int n1 = 0;
%>
<%
	// 스크립틀릿
	int n2 = 0;

	ArrayList<String> list = new ArrayList<String>();
	list.add("Hello");
	list.add("C");
	list.add("python");
	list.add("java");
	
	application.setAttribute("test", list);	// list 객체의 참조 주소를 attribute에 기록
	
	list.add("c++");
	list.add("c#");
	
	System.out.println("list : " + list);	// 스크립틀릿에서 객체를 바로 출력
	System.out.println("test : " + application.getAttribute("test"));
											// attribute에서 가져와도 동일한 결과가 출력

%>
<h2>n1 : <%=n1++ %></h2>
<h2>n2 : <%=n2++ %></h2>

</body>
</html>
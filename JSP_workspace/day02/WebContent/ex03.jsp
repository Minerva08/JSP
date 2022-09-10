<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03 - form 입력과 출력을 하나의 페이지에서</title>
</head>
<body>

	<h1>form 입력과 (처리와 출력)을 하나의 페이지에서</h1>
	<hr>
	<%
		String name = null;
		switch(request.getMethod()) {	// 하나의 페이지가 method에 따라서 수행하는 내용을 달리 할 수 있다
		case "GET":
	%>
	<h4>여기는 GET</h4>
	<form action="" method="POST">
		<input name="name" placeholder="이름을 입력하세요" autofocus>
		<%--form 내부의 input이 하나인 경우 엔터키가 submit역할을 수행한다 --%>
	</form>
	<%
			break;
			
		case "POST":
	%>
	<h4>여기는 POST</h4>
	<%
			request.setCharacterEncoding("UTF-8");
			name = request.getParameter("name");
	%>
	<h3><%=name %>님, 안녕하세요 !!</h3>
	<button onclick="location.href='ex03.jsp'">다시 GET으로</button>
	<%
			break;
		}
	%>
</body>
</html>
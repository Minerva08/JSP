<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-input</title>
</head>
<body>

	<h1>ex05 - 입력만 하는 페이지</h1>
	<hr>
	
	<form method="POST" action="ex05-process.jsp">
		<input name="name" placeholder="이름">
		<input name="age" placeholder="나이">
		<input type="submit">
	</form>

</body>
</html>
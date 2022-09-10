<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

	<h1>로그인</h1>
	
	<form method="POST" action="login-process.jsp">
		<p><input name="userid" placeholder="ID" autofocus required></p>
		<p><input name="userpw" placeholder="Password" type="password" required></p>
		<p><input type="submit" value="로그인"></p>
	</form>

</body>
</html>
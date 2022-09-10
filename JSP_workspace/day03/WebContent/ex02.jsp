<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02 - 로그인 예제</title>
<style>
	.info {
		display: flex;
		justify-content: flex-end;
	}
</style>
</head>
<body>

	<h1>로그인 예제</h1>
	<div class="info">
		${login.username } 					<%--EL태그는 값이 없으면 null이라고 출력하지 않는다 --%>
		${empty login ? '' : '님, 안녕하세요' }	<%--EL태그는 삼항 연산자 사용이 가능하다 --%>
	</div>
	<hr>
	<form method="POST" action="ex02-process.jsp">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="submit" value="로그인"></p>
	</form>

</body>
</html>
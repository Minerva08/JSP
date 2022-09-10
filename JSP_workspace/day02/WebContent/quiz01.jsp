<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz01.jsp - 회원가입 양식 예시</title>
</head>
<body>

	<h1>회원가입 양식 예시</h1>
	<hr>
	<%--
			id, pw, name, email, address 5가지 항목을 입력받아서 
			action페이지로 넘겨주는 코드 
	 --%>
	<form action="quiz01-result.jsp" method="POST">
		<p><input name="id" type="text" placeholder="ID" autofocus required></p>
		<p><input name="pw" type="password" placeholder="Password" required></p>
		<p><input name="name" type="text" placeholder="Name" required></p>
		<p><input name="email" type="email" placeholder="foo@bar.com" required></p>
		<p><input name="address" type="text" placeholder="address" required></p>
		
		<p><input name="age" type="number" placeholder="age" required></p>
		
		<p>
			<input type="submit" value="submit">		<%--제출 가능 --%>
			<button>button tag</button>					<%--제출 가능 --%>
			<input type="button" value="type button">	<%--제출 불가 --%>
		</p>
		<input type="image" src="http://221.164.9.222/img/danbi.jpg"
			   width="100px"><%--제출 가능 --%>
		<p><input type="reset"></p>	<%--사용을 추천하지 않음 --%>		   
	</form>

</body>
</html>
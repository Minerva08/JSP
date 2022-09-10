<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05 - 파라미터 활용 예시</title>
</head>
<body>

	<h1>파라미터 활용 예시</h1>
	<hr>
	
	<%--일반적인 웹 환경에서, 사용자가 주소창에 직접 파라미터를 작성하는 경우는 거의 없다 --%>
	<%--현재 페이지에서는 입력만 받고, 입력받은 파라미터를 다른 페이지에 전달해서 처리하도록 설정 --%>
	
	<form action="ex05-result.jsp">
		<input type="number" name="num" placeholder="번호" min="1" max="5" autofocus>
		<input type="submit">
	</form>
	
</body>
</html>
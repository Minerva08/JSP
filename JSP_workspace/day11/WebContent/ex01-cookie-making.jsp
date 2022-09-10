<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-cookie-making</title>
</head>
<body>

<%
	String test = request.getParameter("test");				// 파라미터를 받아서

	Cookie c = new Cookie("test", test);					// 새로운 쿠키 객체를 생성한다
	c.setMaxAge(60 * 60 * 24 * 30);							// 쿠키의 유효시간을 30일로 설정한다
	// Cookie c = new Cookie(String name, String value);
	
	response.addCookie(c);									// 클라이언트에게 보낼 응답에 쿠키를 적재한다
	
	response.sendRedirect("ex01-cookie-check.jsp");			// 확인 페이지로 이동
%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01-cookie-delete.jsp</title>
</head>
<body>
<%
	// 쿠키를 삭제하려면 동일한 이름의 쿠키를 생성하고, 유효시간을 0으로 설정한 이후 클라이언트에게 보낸다
	// 쿠키 문자열은 인코딩이 제한되기 때문에 띄워쓰기를 포함하지 않고 언더바(_) 나 다른 기호로 대체한다
	
	Cookie c = new Cookie("test", "어차피_사라질건데_값은_뭐_아무거나");
	c.setMaxAge(0);			// 남은시간이 0인 쿠키를 클라이언트에게 보내기
	response.addCookie(c);
	response.sendRedirect("ex01-cookie-check.jsp");
%>
</body>
</html>
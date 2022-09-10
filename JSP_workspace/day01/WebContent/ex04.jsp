<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04 - request</title>
</head>
<body>

	<h1>request 내장 객체</h1>
	<hr>
	
	<%
		String name = request.getParameter("name");	// 파라미터의 이름을 문자열로 전달하면, 값을 문자열로 반환
		// value = map.get(key)
		
		// request : 클라이언트가 웹 서버에게 전달하는 요청을 객체화 한 형태
		
		// 보내는 사람	: 클라이언트(IP)
		// 받는 사람	: 서버(IP)
		// 요청 형식	: 내가 문서를 받고싶다면 GET, 내가 어떤 내용을 담아서 보낸다면 POST
		// 요청 내용	: 받고싶은 문서의 이름이나, 클라이언트가 보내는 내용을 받기 원하는 서버의 페이지 이름 (자원의 위치)
		// URL		: Uniform Resource Locator (웹 브라우저의 주소창을 통해서 전달)
	%>
		<h4>보내는 사람 : <%=request.getRemoteAddr() %></h4>
		<h4>받는 사람 : <%=request.getLocalAddr() %></h4>
		<h4>요청 형식 : <%=request.getMethod() %></h4>
		<h4>요청 내용 : <%=request.getRequestURL() %></h4>
		<h4>자원 식별자 (서버 내에서 자원을 식별할 수 있는 유일한 이름) : <%=request.getRequestURI() %></h4>
	<%
		// http://search.naver.com/search.naver?query=이지은
		
		// http://				프로토콜, 서버와 클라이언트가 통신하는 규칙과 약속
		// search.naver.com		서버 도메인(IP), 어떤 서버에게 요청을 전달하는가 (받는 사람)
		// search.naver			문서, 페이지의 이름 (자원의 이름)
		// ?query=이지은			파라미터, ?변수이름1=변수값1&변수이름2=변수값...
		//						클라이언트가 서버에게 전달하고자 하는 값 (내가 원하는 문서를 특정하기 위해서)
		
		// http://도서관.com/대여.html?책이름=드래곤볼&책번호=3
		// 도서관에 가서 대여 창구에서 "책 이름은 드래곤볼이구요, 번호는 3권입니다. 이 책을 저에게 주세요(GET)"
		
		// request의 방향은 항상 클라이언트 -> 서버
	%>
	
	<h3>name : <%=name %></h3>

</body>
</html>
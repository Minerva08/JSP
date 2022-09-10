<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Cookie[] cookies = request.getCookies();		// 요청에 담긴 쿠키의 배열(쿠키는 하나 이상일 수도 있다)
	String value = null;							// 내가 원하는 쿠키의 값을 저장할 변수

	for(int i = 0; cookies != null && i < cookies.length; i++) {	// 첫 방문이면 쿠키가 아예 없다
		Cookie c = cookies[i];				// 쿠키 배열의 i번째 요소를 꺼내서
		if(c.getName().equals("test")) {	// 이름이 일치하는 쿠키를 찾아서
			value = c.getValue();			// 그 값을 저장하고
		}
	}
%>

<h1>쿠키 확인하기</h1>
<hr>

<h2>입력한 쿠키 내용은 [<%=value %>] 입니다</h2>		<%--저장한 쿠키 값을 출력한다 --%>
<h2>입력한 쿠키 내용은 ${cookie.test.value } 입니다</h2>	<%--EL 태그로 출력하려면 위 스크립틀릿 없이 출력 가능 --%>

<a href="ex01.jsp"><button>입력 페이지로 이동 (ex01)</button></a>
<a href="ex01-cookie-delete.jsp"><button>쿠키 삭제</button></a>

</body>
</html>
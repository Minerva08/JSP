<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01 - cookie</title>
</head>
<body>

<h1>cookie : 웹 처리에 사용되는 어떤 데이터를 클라이언트에 문자열 형식으로 저장하는 방식</h1>
<hr>

<form action="ex01-cookie-making.jsp">
	<input type="text" name="test" placeholder="문자열 입력" value="${cookie.test.value }">
	<input type="submit">
</form>


<ul>
	<li>http 프로토콜은 요청-응답 이후 연결이 유지되지 않는다 (keep alive 제외)</li>
	<li>페이지가 변경되어도, 다음번에 사이트에 재방문해도 유지되어야 하는 정보</li>
	<li>클라이언트에 저장하면 Cookie, 서버에 저장하면 Session</li>
	<li>초창기에는 Cookie에 ID/Password, 주민등록번호, 열어본 게시물의 목록(한번이라도 본 상품)</li>
	<li>Cookie는 브라우저가 관리하므로, 사용자의 컴퓨터에 저장이 된다</li>
	<li>개인정보 도난의 위험이 있어서, 최근에는 사이트마다 Cookie수집에 대한 허용을 확인한다</li>
	
	<li>서버가 쿠키를 생성하여 클라이언트에게 넘겨준다</li>
	<li>클라이언트는 쿠키를 보유하고 있다가, 해당 사이트에 재방문시 받았던 쿠키를 지참하여 방문한다</li>
	<li>서버는 클라이언트가 가져온 쿠키를 식별하여 클라이언트 마다 서로 다른 처리를 수행할 수 있다</li>
</ul>

</body>
</html>
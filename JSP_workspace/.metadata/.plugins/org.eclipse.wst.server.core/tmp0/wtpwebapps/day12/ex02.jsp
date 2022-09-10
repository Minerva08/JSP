<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02 - session cookie</title>
</head>
<body>

<h1>session cookie</h1>
<hr>
<div style="display: flex; width: 100%;">
	<div style="width: 300px;">
		<c:if test="${empty login }">
			<form method="POST" action="ex02-process.jsp">
				<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
				<p><input type="password" name="userpw" placeholder="Password" required></p>
				<p><label><input type="checkbox" name="autologin">자동 로그인</label></p>
				<p><input type="submit" value="로그인"></p>
			</form>
		</c:if>
		<c:if test="${not empty login }">
			<a href="ex02-logout.jsp"><button>${login.username } 로그아웃</button></a>
		</c:if>
	</div>
	<ul>
		<li>서버에는 여러개의 세션이 존재하고, 구분을 위하여 각각 ID를 가지고 있다</li>
		<li>클라이언트 입장에서 세션이란 서버에 둘 수 있는 임시 사물함과 같은 개념이다</li>
		<li>일반적으로, 브라우저를 종료하면 기존 세션이 사라지지는 않으나 다른 세션을 만나게 된다</li>
		<li>이때, 내가 마지막으로 사용했던 세션의 ID를 쿠키에 적어두었다가, 다음 요청시 ID를 서버에 제시할 수 있다</li>
		<li>서버는 클라이언트가 제시한 마지막 사용한 세션의 ID로 세션 객체를 찾아보고, 있으면 해당 세션을 다시 연결시켜준다</li>
		<li>만약 클라이언트가 제시한 세션이 없으면, 새로운 세션을 생성하여 연결해준다</li>
		<li>세션의 ID를 저장하는 세션 쿠키는 만료시간이 '브라우저 종료' 시점으로 설정되어 있다</li>
		<li>세션 쿠키의 이름을 똑같이 만들어서 유효시간만 새로 설정해서 보내면 세션쿠키가 유지될 수 있다</li>
	</ul>
</div>
<h3>session.getId() : <%=session.getId() %></h3>
<h3>JSESSIONID : ${cookie.JSESSIONID.value }</h3>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' and not empty login }">
	<c:redirect url="/example" />
</c:if>

<form method="POST">
	<p><input type="text" name="userid" placeholder="ID"></p>
	<p><input type="password" name="userpw" placeholder="Password"></p>
	<p><input type="submit" value="로그인"></p>
</form>

<c:if test="${pageContext.request.method == 'POST'}">
	<c:set var="login" value="${param.userid }" scope="session" />
	<c:redirect url="/example" />
</c:if>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>로그인 이름 : ${login }</h2>

<c:if test="${not empty login }">
	<a href="logout.jsp"><button>로그아웃</button></a>
</c:if>

</body>
</html>
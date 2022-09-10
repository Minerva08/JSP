<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="naver.MemberDAO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:set var="list" value="${dao.list }" />
	
	<c:forEach var="dto" items="${list }" >
		<c:if test="${dto.id eq param.id }" >
			<h3>${dto.name}님, 안녕하세요</h3>
			<a href="${pageContext.request.contextPath } ">로그아웃</a>
		</c:if>
	</c:forEach>
	
</body>
</html>
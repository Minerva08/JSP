<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>DB 접속 테스트2</h1>
<hr>

<jsp:useBean id="dao" class="day09.Ex02DAO" />

<%--
	만약 dao객체를 header.jsp에 포함시킨다면, 
	DAO를 새로 생성하지 않더라도 지속적인 사용이 가능하다
 --%>
	<c:forEach var="i" begin="1" end="50">
		<h3>dto.getTest ${i}회 호출 : ${dao.test }</h3>
	
	</c:forEach>

</body>
</html>
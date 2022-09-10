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

	<c:forEach var="i" begin="1" end="100">
		<div style="border:1px solid black; width:50px; margin:20px 5px;">${i}</div>
		<c:if test="${i%10==0 }">
			<p>enter</p>
		</c:if>
	</c:forEach>

</body>
</html>
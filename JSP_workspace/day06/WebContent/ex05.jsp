<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h1>c:url c:redirect</h1>

	<%=request.getContextPath() %>
	${pageContext.request.contextPath }<br>
	<c:url value="css/style.css" />
	파일 이름 앞에 문서경로를 붙여준다
	
	<c:redirect url="http://www.naver.com"></c:redirect>
</body>
</html>
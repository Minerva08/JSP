<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>DB 접속 테스트</h1>
<hr>

<jsp:useBean id="dao" class="day09.Ex01DAO" />
<h3>dto.getTest 1회 호출 : ${dao.test }</h3>
<h3>dto.getTest 2회 호출 : ${dao.test }</h3>
</body>
</html>
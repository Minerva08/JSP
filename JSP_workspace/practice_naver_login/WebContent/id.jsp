<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인</title>
</head>
<body>
<jsp:useBean id="dto" class="naver.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="naver.MemberDAO" />
<c:set var="memberid" value="${dao.searchMember(dto).getId() }"/>
<h1>아이디 : ${memberid}</h1>
<a href="index.jsp">로그인하러 가기</a>
<a href="search.jsp?search=pw">비밀번호 찾기</a>
</body>
</html>
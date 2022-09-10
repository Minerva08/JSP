<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<body>
	<h3>${empty delete ? '도서가 존재하지 않습니다' : ${delete.name}'이 삭제되었습니다.'</h3>
</body>
</html>
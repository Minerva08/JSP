<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<body>
	<form action="search-process.jsp">
		<p>검색할 도서명</p>
		<p><input type="text" name="name"></p>
		<p>저자명</p>
		<p><input type="text" name="writer"></p>
		<p><input type="submit"></p>	
	</form>
</body>
</html>
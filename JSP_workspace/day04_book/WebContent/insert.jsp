<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<body>
	<div class="component">
		<form action="insert-process.jsp">
			<p>도서명	:<input type="text" name="name" required autofocus></p>
			<p>저자	:<input type="text" name="writer" required ></p>
			<p>출판사	:<input type="text" name="company" required></p>
			<p>출판일자:<input type="text" name="date" required ></p>
			<p>가격	:<input type="number" name="price" required></p>
			<p>소개 	:<input type="text" name="info" required ></p>
			<p><input type="submit">등록</p>
		</form>
	
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="delete-process.jsp">
	<p><input type="number" name="idx" value="${param.idx }" placeholder="번호" autofocus required></p>
	<p><input type="submit"></p>
</form>

	<c:forEach var="dto" items="${list }" varStatus="st">
		<c:if test="${param.idx == dto.idx}">
				<div class="idx">${dto.idx+1 }</div>
				<div class="name">${dto.name }</div>
				<div class="author">${dto.author }</div>
				<div class="publishDate">${dto.publishDate }</div>
				<div class="publisher">${dto.publisher }</div>
				<div class="price">${dto.price }</div>
				<div class="comment">${dto.comment }</div>
		</c:if>
	</c:forEach>

</body>
</html>
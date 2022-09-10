<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>도서 검색</h2>

<form>
	<p>
		<input type="text" name="name" placeholder="도서명으로 검색하세요" 
			   value="${param.name }" autofocus required>
		<input type="submit" value="검색">
	</p>
</form>

<c:if test="${not empty param.name }">
	<c:forEach var="dto" items="${list }">
		<c:if test="${dto.name.contains(param.name) }">
			<c:set var="searchResult" value="${dto }" />
		</c:if>
	</c:forEach>
</c:if>

<c:if test="${not empty searchResult }">
	<table>
		<tr><td>도서 이름</td><td>${searchResult.name }</td></tr>
		<tr><td>저자</td><td>${searchResult.author }</td></tr>
		<tr><td>출판일자</td><td>${searchResult.publishDate }</td></tr>
		<tr><td>출판사</td><td>${searchResult.publisher }</td></tr>
		<tr><td>가격</td><td>${searchResult.price }</td></tr>
		<tr><td>소개</td><td>${searchResult.comment }</td></tr>
	</table>
</c:if>

<c:if test="${not empty param.name and empty searchResult}">
	<h3>검색 결과가 없습니다</h3>
</c:if>

</body>
</html>
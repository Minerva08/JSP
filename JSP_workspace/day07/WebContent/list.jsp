<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h1>목록</h1>

<%--	1) jsp:useBean 으로 DAO 객체를 생성하세요	 --%>
<jsp:useBean id="dao" class="day07_book.BookDAO" />

<%--	2) c:set 태그로 dao의 함수 호출 결과를 attribute로 저장하세요	 --%>
<c:set var="list" value="${dao.list }" />

<%--	3) c:forEach 를 사용하여 목록을 화면에 출력하세요 --%>
<table border="1" cellpadding="7" cellspacing="0">
<thead>
	<tr>
		<th>idx</th>
		<th>name</th>
		<th>author</th>
		<th>publisher</th>
		<th>publishDate</th>
		<th>price</th>
		<th>description</th>
	</tr>
</thead>
<tbody>
<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.idx}</td>
		<td>${dto.name}</td>
		<td>${dto.author}</td>
		<td>${dto.publisher}</td>
		<td>${dto.publishDate}</td>
		<td>${dto.price}</td>
		<td>${dto.description}</td>
	</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>
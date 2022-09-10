<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>검색</h2>


<form>
	<select name="column" required>
		<option value="">===검색 유형 선택===</option>
		<option ${param.column == 'idx' ? 'selected' : '' } value="idx">도서번호로 검색</option>
		<option ${param.column == 'name' ? 'selected' : '' } value="name">도서이름으로 검색</option>
	</select>
	<input type="search" name="word" placeholder="검색어를 입력하세요" value="${param.word }" required autofocus>
	<input type="submit" value="검색">
</form>
<br>

<c:if test="${not empty param.word }">
	<jsp:useBean id="dao" class="day07_book.BookDAO" />
	<c:set var="list" value="${dao.search(param.column, param.word) }" />
	<c:if test="${not empty list }">
		<table>
			<tr>
				<th>도서 번호</th>
				<th>도서 이름</th>
				<th>저자</th>
				<th>출판사</th>
				<th>출판일자</th>
				<th>가격</th>
				<th>개요</th>
			</tr>
			<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.idx }</td>
				<td>${dto.name }</td>
				<td>${dto.author }</td>
				<td>${dto.publisher }</td>
				<td>${dto.publishDate }</td>
				<td>${dto.price }</td>
				<td>${dto.description }</td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${empty list }">
		<h3>검색 결과를 찾을 수 없습니다</h3>
	</c:if>
</c:if>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>도서 수정</h2>

<form>
	<p>
		<input type="text" name="name" placeholder="도서명으로 검색하세요" 
			   value="${param.name }" autofocus required>
		<input type="submit" value="검색">
	</p>
</form>

<c:if test="${not empty param.name }">
	<c:forEach var="dto" items="${list }" varStatus="st">
		<c:if test="${dto.name.contains(param.name) }">
			<c:set var="searchDTO" value="${dto }" />
			<c:set var="index" value="${st.index }" />
		</c:if>
	</c:forEach>
</c:if>

<c:if test="${not empty searchDTO }">
	<form action="modifyProcess.jsp">
			<table>
				<tr>
					<td>도서 이름</td>
					<td><input name="name" value="${searchDTO.name }" required></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input name="author" value="${searchDTO.author }" required></td>
				</tr>
				<tr>
					<td>출판일자</td>
					<td><input type="date" name="publishDate" value="${searchDTO.publishDate }" required></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input name="publisher" value="${searchDTO.publisher }" required></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="price" value="${searchDTO.price }" required></td>
				</tr>
				<tr>
					<td>소개</td>
					<td><textarea name="comment" cols="40" rows="5" required>${searchDTO.comment }</textarea></td>
				</tr>
			</table>
			<p><input type="hidden" name="index" value="${index }"></p>
			<p><input type="submit" value="수정"></p>
			</form>
</c:if>

<c:if test="${empty searchDTO }">
	<h3>검색 결과가 없습니다</h3>
</c:if>

</body>
</html>
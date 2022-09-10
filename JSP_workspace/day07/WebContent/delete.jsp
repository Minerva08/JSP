<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>도서 삭제</h2>

<c:if test="${empty param.idx}">
	<form>
		<input type="number" name="idx" placeholder="삭제할 도서의 번호" min="0" required autofocus>
		<input type="submit" value="조회">
	</form>
</c:if>

<c:if test="${not empty param.idx}">
	<jsp:useBean id="dao1" class="day07_book.BookDAO" />
	<c:set var="dto" value="${dao1.selectOneByIdx(param.idx) }" />
	<c:choose>
		<c:when test="${not empty dto }">
			<table>
				<tr><td>도서번호</td><td>${dto.idx }</td></tr>
				<tr><td>도서이름</td><td>${dto.name }</td></tr>
				<tr><td>저자</td><td>${dto.author }</td></tr>
				<tr><td>출판사</td><td>${dto.publisher }</td></tr>
				<tr><td>출판일자</td><td>${dto.publishDate }</td></tr>
				<tr><td>가격</td><td>${dto.price }</td></tr>
				<tr><td>도서 소개</td><td>${dto.description }</td></tr>
			</table>
			<p><a href="delete.jsp?delete=${param.idx }"><button>삭제</button></a></p>
		</c:when>
		<c:otherwise>
			<h3>검색 결과가 없습니다</h3>
		</c:otherwise>
	</c:choose>
</c:if>

<c:if test="${not empty param.delete }">
	<jsp:useBean id="dao2" class="day07_book.BookDAO" />
	<c:choose>
		<c:when test="${dao2.delete(param.delete) == 1 }">
			<script>
				alert('삭제되었습니다')
				location.href = '${cpath}/list.jsp'
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('삭제 실패...')
				history.go(-1)
			</script>
		</c:otherwise>
	</c:choose>
</c:if>

</body>
</html>
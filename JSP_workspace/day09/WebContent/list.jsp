<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="dao" class="day09_book.BookDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>도서-교보문고</h1>
<c:if test="${pageContext.request.method == 'GET' }">
	<c:set var="list" value="${dao.list}" />
	<table border="1" cellpadding="7" cellspacing="0">
		<tr>
			<td>도서 번호</td>
			<td>도서명</td>
			<td>저자</td>
			<td>출판사</td>
			<td>출판일자</td>
			<td>가격</td>
			<td>도서 소개</td>
		</tr>
		
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.idx }</td>
				<td>${dto.name }</td>
				<td>${dto.author }</td>
				<td>${dto.publisher }</td>
				<td>${dto.publishDate }</td>
				<td>${dto.price }</td>
				<td>${dto.description }</td>
				<td><a href="${cpath }/list.jsp?delete=${dto.idx }"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
</c:if>

<c:if test="${not empty param.delete }">
	<c:choose>
		<c:when test="${dao.delete(param.delete) == 1 }">
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
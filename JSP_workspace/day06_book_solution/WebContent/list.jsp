<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<div class="booklist">
	<div class="columns">
		<div class="idx">번호</div>
		<div class="name">이름</div>
		<div class="author">저자</div>
		<div class="publishDate">출판일자</div>
		<div class="publisher">출판사</div>
		<div class="price">가격</div>
		<div class="comment">소개</div>
	</div>
</div>

<c:forEach var="dto" items="${list }" varStatus="st">
	<div class="idx">${st.count }</div>
	<div class="name">${dto.name }</div>
	<div class="author">${dto.author }</div>
	<div class="publishDate">${dto.publishDate }</div>
	<div class="publisher">${dto.publisher }</div>
	<div class="price">${dto.price }</div>
	<div class="comment">${dto.comment }</div>
</c:forEach>
</body>
</html>
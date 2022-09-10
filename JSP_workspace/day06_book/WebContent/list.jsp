<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="bookList">
	<div class="columns">
		<%-- 도서 이름, 저자, 출판일자, 출판사, 가격, 소개 --%>
		<div class="idx">번호</div>
		<div class="name">도서 이름</div>
		<div class="author">저자</div>
		<div class="publishDate">출판일자</div>
		<div class="publisher">출판사</div>
		<div class="price">가격</div>
		<div class="comment">소개</div>
	</div>
	<div class="items">
		<c:forEach var="dto" items="${list }" varStatus="st">
			<div class="item">
				<div class="idx">${st.count }</div>
				<div class="name">${dto.name }</div>
				<div class="author">${dto.author }</div>
				<div class="publishDate">${dto.publishDate }</div>
				<div class="publisher">${dto.publisher }</div>
				
				<div class="price">
					<fmt:formatNumber value="${dto.price }" type="currency" currencySymbol="\\" 
									  groupingUsed="true" />
				</div>
				
				<div class="comment">${dto.comment }</div>
			</div>
		</c:forEach>
	</div>
</div>

</body>
</html>
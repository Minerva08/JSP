<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>등록</h2>

<%--GET으로 접근하면 실행되는 부분 --%>
<c:if test="${pageContext.request.method == 'GET' }">
	<form method="POST">
		<p><input name="name" placeholder="도서 이름" required autofocus></p>
		<p><input name="author" placeholder="저자" required></p>
		<p><input name="publisher" placeholder="출판사" required></p>
		<p><input name="publishDate2" type="date" required 
				  value="<fmt:formatDate value="<%= new Date()%>" pattern="yyyy-MM-dd" />"></p>
		<p><input name="price" type="number" step="100" min="0" required placeholder="가격"></p>
		<p><textarea name="description" placeholder="도서 개요"></textarea></p>
		<p><input type="submit" value="등록"></p>
	</form>
</c:if>

<%--POST로 접근하면 실행되는 부분 --%>
<c:if test="${pageContext.request.method == 'POST' }">
	<%
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 	// 날짜 변환을 위한 객체 생성
		String publishDate2 = request.getParameter("publishDate2");	// 개별로 파라미터를 받아서
		Date publishDate = sdf.parse(publishDate2);					// String -> Date 변환하고
		pageContext.setAttribute("publishDate", publishDate);		// Date를 attribute로 등록
	%>
	<jsp:useBean id="dto" class="day07_book.BookDTO" />	<%--비어있는 dto 객체를 하나 생성 --%>
	<jsp:setProperty property="*" name="dto"/>			<%--파라미터를 dto에 세팅한다 --%>
	<jsp:setProperty property="publishDate" name="dto" value="${publishDate }" />
	<%--자동으로 처리되지 않는 publishDate에 대한 별도 처리 (input요소의 이름을 일부러 다르게 설정한다) --%>
	
	<jsp:useBean id="dao" class="day07_book.BookDAO" />	<%--초기상태의 dao 객체를 하나 생성 --%>
	<c:choose>
		<c:when test="${dao.insert(dto) == 1 }">		<%--dao의 insert()에 인자값으로 dto를 전달하고 반환이 1인가 체크 --%>
			<c:redirect url="list.jsp" />				<%--반환값이 1이면(추가 성공) 목록으로 이동 --%>
		</c:when>
		<c:otherwise>									<%--반환값이 1이 아니면 --%>
			<script>									<%--자바스크립트로--%>
				alert('추가 실패')							<%--팝업으로 경고를 띄우고--%>
				history.go(-1)							<%--이전 페이지로 이동 (입력값 남아있음) --%>
			</script>
		</c:otherwise>	
	</c:choose>
</c:if>

</body>
</html>
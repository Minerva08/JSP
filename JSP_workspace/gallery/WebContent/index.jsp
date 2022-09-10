<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:set var="page" value="${empty param.page ? 1 : param.page }"/>
<main>
	<jsp:include page="board/board.jsp" />
</main>

</body>
</html>
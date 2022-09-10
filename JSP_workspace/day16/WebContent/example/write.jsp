<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>글 작성</h2>
<c:if test="${empty sessionScope.login }">
	<c:redirect url="/example/login.jsp" />
</c:if>

<form method="POST">
	<input placeholder="여기에 내용을 입력하세요">
	<input type="text" name="writer" value="${login }" readonly>
	<input type="submit" value="작성">
</form>

</body>
</html>
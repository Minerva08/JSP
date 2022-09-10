<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%--<h1>${dao.test }</h1> --%>
<div class="main">
	<form method="POST">
		<p><input type="text" name="id" placeholder="아이디" required autofocus></p>
		<p><input type="password" name="pw" placeholder="비밀번호" required></p>
		<p><input type="submit" value="로그인" ></p>
	</form>
	
	<p><a href="${cpath }/search.jsp?search=id">아이디 찾기</a>
	<a href="${cpath }/search.jsp?search=pw">비밀번호 찾기</a></p>
</div>

<c:if test="${pageContext.request.method == 'POST'}">
	<c:set var="confrim" value="${dao.login(param.id , param.pw) }" />
		<c:if test="${confrim ==1 }">
			<jsp:forward page="home.jsp" />
		</c:if>
		
		<c:if test="${confrim ==0 }">
			<jsp:forward page="index.jsp" />
		</c:if>
</c:if>


</body>
</html>
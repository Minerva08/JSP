<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<section class="content">
	<section class="login_state">
		<c:choose>
			<c:when test="${empty login }">
				<h5><a href="${cpath }/memberonly/login.jsp">로그인</a></h5>
			</c:when>
			<c:otherwise>
				<h5>${login.username }님, 안녕하세요 </h5>
				<p><a href="${cpath }/memberonly/logout.jsp">로그아웃</a></p>
			</c:otherwise>
			
		
		</c:choose>
	</section>
	
	<section class="list">
		<jsp:include page="whoever/list.jsp"/>
	</section>
</section>
</body>
</html>
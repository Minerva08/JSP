<%@page import="naver.MemberDAO"%>
<%@page import="naver.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<c:if test="${param.search eq 'id' }">
	<h2>아이디 찾기</h2>
	<form method="POST" action="id.jsp">
		<p>이름 :<input type="text" name="name" placeholder="이름"></p>
		<p>이메일 :<input type="email" name="email" placeholder="이메일"></p>
		<p><input type="submit" value="확인"></p>
	</form>
	
</c:if>

<c:if test="${param.search eq 'pw' }">
	<h2>비밀번호 찾기</h2>
	<form method="POST"	action="modify_pw.jsp">
		<p><input type="text" name="name" placeholder="이름"></p>
		<p><input type="text" name="id" placeholder="아이디"></p>
		<p><input type="submit" value="확인"></p>
	</form>

</c:if>



</body>
</html>
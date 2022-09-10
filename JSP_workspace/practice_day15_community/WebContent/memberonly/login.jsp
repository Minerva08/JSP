<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<h2>로그인</h2>
<main>
	<form method="POST">
		<p>아이디 : <input type="text" name="userid" palceholder="ID" required autofocus></p>
		<p>비밀번호 : <input type="password" name="userpw" palceholder="PW" required></p>
		<p><input type="submit" value="로그인"></p>
	</form>
	<p><a href="${cpath }/memberonly/join.jsp">회원가입</a></p>
</main>

<c:if test="${pageContext.request.method=='POST' }">
	<jsp:useBean id="user" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="user"/>
	<c:set var="login" value="${memberDAO.login(user) }" scope="session"/>
	<script>
		const flag='${not empty login}'
		
		if(flag =='true'){
			alert('로그인 성공')
		}
		else{
			alert('로그인 실패')
			history.go(-1)
		}
	</script>
</c:if>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
	<h2>로그인</h2>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID" required autofocus value="${cookie.userid.value }"></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><label><input type="checkbox" name="saveid" ${not empty cookie.userid ? 'checked' : ''}>ID 저장</label></p>
		<p><label><input type="checkbox" name="autologin">자동 로그인</label></p>
		<p><input type="submit" value="로그인"></p>
	</form>
</main>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="user" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="user" />
	<c:set var="login" value="${dao.login(user) }" scope="session" />
	<c:if test="${empty login }">
		<script>
			alert('로그인에 실패했습니다')
			history.go(-1);
		</script>
	</c:if>
	
	<%
		if(session.getAttribute("login") != null) {	// 로그인에 성공했다면
			String saveid = request.getParameter("saveid");
			String autologin = request.getParameter("autologin");
			
			// 여기는 아이디 저장
			Cookie c1 = new Cookie("userid", user.getUserid());//useBean은 객체도 생성하고 attribute추가도 한다
			c1.setMaxAge(saveid != null ? 86400 : 0);
			response.addCookie(c1);
			
			// 여기는 자동 로그인
			Cookie c2 = new Cookie("JSESSIONID", session.getId());
			c2.setMaxAge(autologin != null ? 7200 : 0);
			response.addCookie(c2);
		}
	%>
	<c:if test="${not empty login }">
		<c:redirect url="/" />
	</c:if>
</c:if>

</body>
</html>
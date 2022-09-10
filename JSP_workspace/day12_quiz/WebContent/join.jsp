<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
<h2>회원 가입</h2>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="text" name="username" placeholder="사용자 이름" required></p>
		<p><input type="email" name="email" placeholder="foo@bar.com" required></p>
		<p>
			<label><input type="radio" name="gender" value="남성" required>남성</label>
			<label><input type="radio" name="gender" value="여성" required>여성</label>
		</p>
		<p><input type="submit" value="가입신청"></p>
	</form>
</main>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="user" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="user" />
	<c:set var="join" value="${dao.insert(user) }" />
	<script>
		const join = '${join}'
		if(join == 1) {
			alert('가입 성공을 축하드립니다 !!')
			location.href = '${cpath}/login.jsp'
		}
		else {
			alert('회원 가입 실패. 모든 항목을 다시 확인해주세요')
			history.go(-1);
		}
	</script>
</c:if>
</body>
</html>
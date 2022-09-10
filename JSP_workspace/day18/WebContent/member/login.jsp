<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main>
	<h2>로그인</h2>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<input type="hidden" name="idx" value="${param.idx }">
		<p><input type="submit" value="로그인"></p>
	</form>
	<p><a href="${cpath }/member/join.jsp">아직 회원이 아니십니까?</a></p>
</main>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="user" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="user" />
	
	<c:set var="login" value="${memberDAO.login(user) }" scope="session" />
	<script>
		const flag = '${not empty login}'
		let url = '${cpath}'	// 로그인 성공시 이동할 주소는 기본적으로 대문페이지 이지만 
		
		if(flag == 'true') {							// 로그인에 성공했으면서
			if('${not empty param.url}' == 'true') {	// 파라미터 url이 존재한다면
				url = '${param.url}?idx=${param.idx}'	// url 변수에 파라미터 값을 넣어주고
			}	
			location.href = url		// 기본값 혹은 전달받은 파라미터 주소로 페이지를 이동한다
									// 세션에 저장된 내용은 페이지 이동에 상관없이 참조할 수 있다
		}								
		else {
			alert('로그인 실패 !!')
			history.go(-1)
		}
	</script> 
</c:if>

<%@ include file="../footer.jsp" %>
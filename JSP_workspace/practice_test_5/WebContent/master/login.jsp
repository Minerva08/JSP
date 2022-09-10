<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kiosk.*,master.*"%>
<%@ include file="../header.jsp" %>
<c:set var="masterDAO" value="<%=MasterDAO.getInstance() %>" />
<form method="POST">
	<p>아이디 : <input type="text" name="userid"></p>
	<p>패스워드 : <input type="text" name="userpw"></p>
	<input type="submit" value="로그인">
</form>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="user" class="master.MasterDTO" />
	<jsp:setProperty property="*" name="user"/>
	<c:set var="login" value="${masterDAO.login(user) }" scope="session"/>
	<script>
			const flag = '${not empty login}'
			let url = '${cpath}'	// 로그인 성공시 이동할 주소는 기본적으로 대문페이지 이지만 
			
			if(flag == 'true') {							// 로그인에 성공했으면서
				if('${not empty param.url}' == 'true') {	// 파라미터 url이 존재한다면
					url = '${param.url}'// url 변수에 파라미터 값을 넣어주고
					alert('url')
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
</body>
</html>
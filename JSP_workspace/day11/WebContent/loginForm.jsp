<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 (쿠키를 활용한 ID저장)</title>
</head>
<body>

<c:set var="dao" value="<%=MemberDAO.getInstance() %>" /><%--싱글톤 사용 setting --%>
<c:set var="test" value="${dao.test }" /><%--DB연결 확인 --%>

<h1>로그인</h1>
<h4>DB 접속 여부 : ${not empty test }, 접속 시간 : ${test }, DAO : ${dao }</h4>
<div style="display: flex; justify-content: flex-end">${sessionScope.login.username }</div>
													<%--sessionScope : 웹 브라우저 별로 정보를 관리할때 사용 --%>
<hr>

<div id="root" style="display: flex;">
	<div style="width: 300px;">
		<c:if test="${empty login }">
			<form method="POST" action="login-process.jsp">
				<p><input type="text" name="userid" placeholder="ID" value="${cookie.storeid.value }" required autofocus></p>
				<p><input type="password" name="userpw" placeholder="Password" required></p>
				<p><label>
						<input name="storeid" type="checkbox" 
							   ${empty cookie.storeid.value ? '' : 'checked' }>
						ID 저장
					</label>
				</p>
				<p>
					<input type="submit" value="로그인">
				</p>
			</form>
		</c:if>
		<c:if test="${not empty login }">
			<a href="logout.jsp"><button>${login.username } 사용자 로그아웃</button></a>
		</c:if>
	</div>
	<ul>
		<li>ConnectionPool과 Singleton 이 적용된 MemberDAO 를 작성하여 활용하세요</li>
		<li>DB에 Member 테이블을 작성하고, 최소 3개의 회원 정보를 미리 준비하세요</li>
		<li>테이블은 userid, userpw, username, email, gender 5개의 컬럼을 가지고 있습니다</li>
		<li>userid는 PK로 설정하여 중복가입을 방지합니다</li>
		<li>로그인 요청이 발생하면, DB에서 id와 pw가 일치하는 계정 하나를 찾아서 객체정보를 세션에 저장합니다</li>
		<li>로그인 시에 ID저장 체크박스에 체크를 했다면, 쿠키를 생성하여 입력했던 ID를 미리 입력시켜 둡니다</li>
		<li>만약 로그인에 실패하면 기존의 쿠키는 자동으로 삭제합니다</li>
		<li>쿠키가 있다면 체크박스에도 체크가 되어 있어야 합니다 (checked)</li>
	</ul>
</div>
</body>
</html>
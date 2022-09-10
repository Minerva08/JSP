<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<h1>대문 페이지</h1>
	<div style="display: flex; 
				justify-content: flex-end; 
				width: 100%; 
				height: 30px;">
		${login.username } 
		${empty login ? '' : '님, 환영합니다' }
	</div>
	<hr>
	<p>
		<a href="join.jsp"><button>회원가입</button></a>
	</p>
	
	<p>
		<a href="${empty login ? 'login.jsp' : 'logout.jsp' }">
			<button>${empty login ? '로그인' : '로그아웃' }</button>
		</a>
	</p>	

</body>
</html>
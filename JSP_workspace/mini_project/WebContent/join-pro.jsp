<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header-java.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="user" class="cinemaMember.CinemaMemberDTO" />
	<jsp:setProperty property="*" name="user" />

	<script type="text/javascript">
		const row = ${Mdao.insertAccount(user)}
		
		if (row == 1) {
			alert('성공')
			location.href = 'main.jsp';
		}
		else {
			alert('실패')
			history.go(-1)
		}
		
	</script>
</body>
</html>
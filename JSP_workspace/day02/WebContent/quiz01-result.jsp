<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz01-result</title>
</head>
<body>
	<%	request.setCharacterEncoding("UTF-8"); %>
	<%-- post방식으로 전달받는 데이터의 인코딩을 지정한다 (request.getParameter() 호출전) --%>
	
	<jsp:useBean id="dto" class="day02.Quiz01DTO" />
	<jsp:setProperty property="*" name="dto" />
	
	<%
		if(dto.getId() == null) {	// 입력값이 null이면
			response.sendRedirect("quiz01.jsp");	// 돌아가기
		}
	%>
	<%--
			전달받은 파라미터들을 DTO클래스를 활용 (액션 태그 쓰세요)
			각 값을 table 태그를 활용해서 화면에 출력하기
			이전 페이지로 이동하는 링크가 있어야 함	
	 --%>
	 <table border="1" cellpadding="7" cellspacing="0">
	 	<tr>
	 		<td>ID</td>
	 		<td><%=dto.getId() %></td>
	 	</tr>
	 	<tr>
	 		<td>Password</td>
	 		<td><%=dto.getPw() %></td>
	 	</tr>
	 	<tr>
	 		<td>Name</td>
	 		<td><%=dto.getName() %></td>
	 	</tr>
	 	<tr>
	 		<td>E-mail</td>
	 		<td><%=dto.getEmail() %></td>
	 	</tr>
	 	<tr>
	 		<td>Address</td>
	 		<td><%=dto.getAddress() %></td>
	 	</tr>
	 	<tr>
	 		<td>Age</td>
	 		<td><%=dto.getAge() + 1 %></td>
	 	</tr>
	 </table>
	 
	 <a href="quiz01.jsp">입력 페이지로</a>

</body>
</html>





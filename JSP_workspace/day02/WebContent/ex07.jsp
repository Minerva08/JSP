<%@page import="day02.Ex07DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07 - application에 데이터 저장</title>
</head>
<body>

	<h1>application에 데이터 저장</h1>
	<hr>
	
	<fieldset>
		<legend>추가</legend>
		<form method="POST" action="ex07-process.jsp">
			<p><input name="name" placeholder="이름"></p>
			<p><input name="age" placeholder="나이"></p>
			<p><input type="submit"></p>
		</form>
	</fieldset>
	
	<br><br>
	
	<table border="1" cellpadding="7" cellspacing="0">
		<thead>
			<tr>
				<th>이름</th>
				<th>나이</th>
			</tr>
		</thead>
		<tbody>
		<%
			ArrayList<Ex07DTO> list = (ArrayList<Ex07DTO>)application.getAttribute("list");
			for(int i = 0; list != null && i < list.size(); i++) {
				Ex07DTO dto = list.get(i);
		%>
			<tr>
				<td><%=dto.getName() %></td>
				<td><%=dto.getAge() %></td>
			</tr>
		<%				
			}
		%>
		</tbody>
	</table>

</body>
</html>
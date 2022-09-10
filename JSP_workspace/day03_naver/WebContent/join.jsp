<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>

	<h1>회원가입</h1>
	
	<form method="POST" action="join-process.jsp">
		<p><input name="userid" placeholder="ID" autofocus required></p>
		<p><input name="userpw" type="password" placeholder="Password" required></p>
		<p><input name="username" placeholder="사용자 이름" required></p>
		<p>
			<input type="number" min="1910" max="2021" name="year" required placeholder="연도">
			<select name="month" required>
				<option value="">월</option>
				<%	for(int i = 1; i <= 12; i++) { %>
				<option><%=i %></option>
				<%	} %>
			</select>
			
			<select name="date" required>
				<option value="">일</option>
				<%	for(int i = 1; i <= 31; i++) { %>
				<option><%=i %></option>
				<%	} %>
			</select>
			
		</p>
		<p>
			<select name="gender" required>
				<option value="">성별</option>
				<option>남성</option>
				<option>여성</option>
				<option>선택 안함</option>
			</select>
		</p>
		<p><input type="submit" value="가입하기"></p>
	</form>

</body>
</html>
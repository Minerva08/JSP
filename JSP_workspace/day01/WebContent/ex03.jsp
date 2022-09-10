<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03 - JSP 내장 객체</title>
</head>
<body>

	<h1>JSP 내장 객체</h1>
	<hr>

	<h3>내장 객체 : 생성자를 통해서 생성하지 않아도, JSP페이지가 기본적으로 참조할 수 있는 객체</h3>
	<%=request.getRemoteAddr()%>

	<table border="1" cellpadding="7" cellspacing="0">
		<thead>
			<tr>
				<th>분류</th>
				<th>내장 객체</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>입출력 관련 객체</td>
				<td>
					<p>request</p>
					<p>response</p>
					<p>out</p>
				</td>
			</tr>
			<tr>
				<td>서블릿 관련 객체</td>
				<td>
					<p>page</p>
					<p>config</p>
				</td>
			</tr>
			<tr>
				<td>외부환경 정보를 제공하는 객체</td>
				<td>
					<p>session</p>
					<p>application</p>
					<p>pageContext</p>
				</td>
			</tr>
			<tr>
				<td>예외 관련 객체</td>
				<td>exception</td>
			</tr>
		</tbody>
	</table>


</body>
</html>
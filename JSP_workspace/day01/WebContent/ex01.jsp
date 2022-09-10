<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp - JSP의 기본 문법</title>
<style>
	tbody > tr > td:nth-child(1) {
		font-weight: bold;
		color: rgb(255, 128, 0);
	}
	tbody > tr:nth-child(5) > td:nth-child(1) {
		color: rgb(128, 128, 255);
	}
</style>
</head>
<body>
	<h1>JSP 기본 문법</h1>
	<hr>

	<table border="1" cellpadding="7" cellspacing="0">
		<thead>
			<tr>
				<th>문법</th>
				<th>이름</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>&lt;%@ %></td>
				<td>지시자 (directive)</td>
				<td>페이지 전반에 적용되는 설정, 다른 JSP파일 포함, 다른 라이브러리 불러오기</td>
			</tr>
			<tr>
				<td>&lt;%! %></td>
				<td>선언부 (declaration)</td>
				<td>필드를 선언하거나, 메서드를 정의하는 영역</td>
			</tr>
			<tr>
				<td>&lt;% %></td>
				<td>스크립틀릿 (scriptlet)</td>
				<td>메인에 해당하는 자바 코드를 작성하는 함수영역, service()</td>
			</tr>
			<tr>
				<td>&lt;%= %></td>
				<td>표현식 (expression)</td>
				<td>스크립틀릿의 out.print()를 이용해 HTML문서에 자바 값을 출력하는 구문</td>
			</tr>
			<tr>
				<td>&lt;%-- --%></td>
				<td>JSP 주석</td>
				<td>HTML의 주석과 같은 용도이지만, 브라우저에서 확인할 수 없다</td>
			</tr>
		</tbody>
	</table>
	<!-- HTML 주석, 브라우저에서 확인 가능 -->
	<%-- JSP 주석, 브라우저에서 확인 불가 --%>

</body>
</html>
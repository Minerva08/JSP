<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06 - 파라미터를 HTML 태그 요소 및 속성으로 반영하기</title>
	<%
		String fontColor = "#000000";
		String bgColor = "#ffffff";
	
		fontColor = request.getParameter("fontColor");
		bgColor = request.getParameter("bgColor");
		
		if(fontColor == null) 	fontColor = "#000000";
		if(bgColor == null) 	bgColor = "#ffffff";
	%>
<style>
	body {
		color: <%=fontColor%>;
		background-color: <%=bgColor%>;
	}
</style>
</head>
<body>
	<h1>파라미터를 HTML 태그 요소 및 속성으로 반영하기</h1>
	<hr>
	<form>	<%-- action 속성이 없으면 현재 페이지가 요청을 받아서 처리한다 --%>
		<p>글자색 : <input type="color" name="fontColor" value="<%=fontColor%>"></p>
		<p>배경색 : <input type="color" name="bgColor" value="<%=bgColor%>"></p>
		<input type="submit" value="적용">
	</form>

</body>
</html>
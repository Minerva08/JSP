<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02 - 하나의 파라미터가 여러 값을 가지는 경우</title>
</head>
<body>

	<h1>하나의 파라미터가 여러 값을 가지는 경우</h1>
	<hr>
	
	<fieldset>
		<legend>설문</legend>
		<p>다음 중, 관심있는 분야를 선택하세요 (중복 선택 가능)</p>
		<form>
			<label><input type="checkbox" name="part" value="네트워크">네트워크</label>
			<label><input type="checkbox" name="part" value="시스템">시스템</label>
			<label><input type="checkbox" name="part" value="웹(프론트)">웹(프론트)</label>
			<label><input type="checkbox" name="part" value="웹(백엔드)">웹(백엔드)</label>
			<label><input type="checkbox" name="part" value="앱개발">앱개발</label>
			<p><input type="submit"></p>
		</form>
	</fieldset>
	
	<%	// null. (X)
		System.out.println(request.getParameter("part"));
	
		// 변수이름은 하나이지만, 값이 여러개인 경우 String[] 의 형태로 값을 받을 수 있다
		String[] part = request.getParameterValues("part");
		
		out.println("희망 분야 : ");
		for(int i = 0; part != null && i < part.length; i++) {	// 배열을 반복수행하면서
			out.print(part[i]);									// i번째 값을 출력하고
			out.print(i == part.length - 1 ? "<br>" : ", ");	// 마지막 요소이면 줄바꿈, 그외에는 콤마찍기
		}
		out.println("<br>");
	%>












</body>
</html>
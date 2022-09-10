<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.Arrays, java.util.Collections"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-result</title>
</head>
<body>

	<h1>전달받은 파라미터를 활용하여 출력 내용을 결정</h1>
	<hr>
	<%
		String num = request.getParameter("num");
		int idx = 0;
		if(num != null) {	// 파라미터를 입력하지 않았을 수도 있다
			idx = Integer.parseInt(num);	
		}
		
		String[] arr = {"짱구", "훈이", "유리", "철수", "맹구"};
		ArrayList<String> list = new ArrayList<String>(Arrays.asList(arr));
		Collections.sort(list);
		
		String value = (idx > 0) ? list.get(idx - 1) : "...";
	%>
	
	<h2><%=idx %>번째 멤버의 이름은 <%=value %>입니다</h2>
	<a href="ex05.jsp">입력페이지로 돌아가기</a>

</body>
</html>


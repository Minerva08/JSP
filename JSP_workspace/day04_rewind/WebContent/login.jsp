<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	// 서버가 가지고 있는 데이터
	String[] ids = {"iu930516", "test", "itbank"};
	String[] pws = {"iu", 		"1234", "it"};
	String[] names = {"이지은", 	"테스트", "아이티뱅크"};
	
	// 사용자에게 입력받은 데이터
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean login = false;
	String username = "";
	
	for(int i = 0; i < ids.length; i++) {
		if(ids[i].equals(id)) {
			if(pws[i].equals(pw)) {
				login = true;
				username = names[i];
			}
		}
	}
%>
<h1>로그인 결과</h1>
<hr>
<%=login %>
<%=username %>

</body>
</html>
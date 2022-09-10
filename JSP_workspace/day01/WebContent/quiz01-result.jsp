<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz01-result.jsp</title>
</head>
<body>

	<%--
		전달받은 이름과 나이를 변수에 저장하고, 20세 이상이면 성인, 아니면 미성년자로 지정해서
		한줄에 <h2>태그로 이름과 나이, 성인 여부를 출력하세요
	 --%>
	 <%	
	 	String name, adult, msg = "";
	 	int age;
	 	try {
		 	name = request.getParameter("name");
		 	age = Integer.parseInt(request.getParameter("age"));
		 	
		 	adult = age >= 20 ? "성인" : "미성년자";
		 	msg = String.format("%s님은 %d살이고, %s입니다", name, age, adult);
		 	
	 	} catch(Exception e) {
	 		out.print("<h3 style=\"color: red\";>입력이 잘못되었습니다</h3>");
	 		//response.sendRedirect("quiz01.jsp");	// 지정한 주소로 새로운 요청을 시도하세요(to Client)
	 		System.out.println("예외 : " + e);
	 	}
	 %>
	 <h2><%=msg %></h2>
	 
	 <hr>
	 
	 <%
	 	// 다수의 파라미터를 한번에 처리하고 싶다면
	 	Enumeration<String> names = request.getParameterNames();// 파라미터의 이름만 묶어서 불러와서
	 	while(names.hasMoreElements()) {
	 		String key = names.nextElement();
	 		String value = request.getParameter(key);
	 		out.print(key + " : " + value + "<br>\n");
	 		
	 		switch(key) {	// 문자열을 .equals() 로 비교하기 싫으면 switch 도 사용 가능
	 		case "age":
	 			String adult2 = Integer.parseInt(value) >= 20 ? "성인" : "미성년자";
	 			out.print("adult : " + adult2);
	 			break;
	 		}
	 	}
	 %>
	 
	

</body>
</html>
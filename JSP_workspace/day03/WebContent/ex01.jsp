<%@page import="day03.MemberDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01 - pageContext</title>
</head>
<body>

	<h1>pageContext</h1>
	<hr>
	
	<h4>JSP 페이지 마다 생성되는 내장 객체이다</h4>
	<h4>다른 내장객체에 접근하기 위해서 활용할 수 있다</h4>
	<h4>attribute를 저장할 수 있다</h4>
	<h4>&lt;jsp:useBean> 태그로 객체를 생성하면 기본적으로 pageContext에 객체를 저장한다</h4>
	
	<%
		ServletRequest myRequest = pageContext.getRequest();
		String test1 = "내장 객체 request와, pageContext에서 불러낸 myRequest는 동일한 객체인가 : ";
		System.out.println(test1 + (request == myRequest));
		
		HttpSession mySession = pageContext.getSession();
		String test2 = "내장 객체 session과, pageContext에서 불러낸 mySession은 동일한 객체인가 : ";
		System.out.println(test2 + (session == mySession));
		
		ServletContext ctx = pageContext.getServletContext();
		String test3 = "내장 객체 application과, pageContext에서 불러낸 ctx는 동일한 객체인가 : ";
		System.out.println(test3 + (application == ctx));
		
		JspWriter myOut = pageContext.getOut();
		myOut.println("<h4>여기에 글자를 쓰면 문서에 기록이 되나요?</h4>");
	%>
	
	<jsp:useBean id="dto" class="day03.MemberDTO" /><%--scope="page" --%>
	<jsp:setProperty property="name" name="dto" value="이지은" />
	<jsp:setProperty property="age" name="dto" value="29" />
	
	<%
		System.out.println(dto.getName());
		System.out.println(dto.getAge());
		
		MemberDTO attr = (MemberDTO)pageContext.getAttribute("dto");
		System.out.println(attr.getName());
		System.out.println(attr.getAge());
		
		System.out.println(dto == attr);
	%>
	<h4>${dto.name }님은 ${dto.age }살입니다</h4>
	<%--
			위 h4 태그 내부에서 ${ } 로 접근하는 dto는 스크립틀릿 지역변수가 아니라
			attribute에 저장된 객체를 참조한다
	 --%>
	 <%=((MemberDTO)pageContext.getAttribute("dto")).getName() %>
	 <%--expression, 표현식 --%>

	 ${dto.name }
	 <%--expression language, 표현 언어, EL Tag --%>
	
	
	

</body>
</html>
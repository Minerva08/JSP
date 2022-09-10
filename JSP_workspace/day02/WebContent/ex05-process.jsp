<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ex05 - 처리만 하는 페이지
	
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	// parameter는 setter 가 없다
	
	int num = Integer.parseInt(age);
	
	if(num >= 20) {	// 조건이 참이면 forward
		String message = String.format("%s님은 %s살이므로 입장가능합니다~", name, age);
		request.setAttribute("message", message);
		
		request.getRequestDispatcher("ex05-output.jsp").forward(request, response);
		//response.sendRedirect("ex05-output.jsp");
	}
	else {			// 조건이 거짓이면 redirect
		response.sendRedirect("ex05-input.jsp");
	}
%>
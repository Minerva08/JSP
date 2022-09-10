<%@page import="day03_naver.NaverMemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="userInput" class="day03_naver.NaverMemberDTO" />
<jsp:setProperty property="*" name="userInput" />
<%
	ArrayList<NaverMemberDTO> list = (ArrayList<NaverMemberDTO>)application.getAttribute("list");
	
	System.out.println("1:"+list);

	for(int i = 0; list != null && i < list.size(); i++) {
		System.out.println("2:"+userInput.getUserid());
		if(userInput.getUserid().equals(list.get(i).getUserid())) {
			if(userInput.getUserpw().equals(list.get(i).getUserpw())) {
				session.setAttribute("login", list.get(i));
			}
		}
	}
	String redirectURI = "index.jsp";
	if(session.getAttribute("login") == null) {	// 로그인에 실패했다면
		redirectURI = "loginFail.jsp";
	}
	
	response.sendRedirect(redirectURI);
	
%>
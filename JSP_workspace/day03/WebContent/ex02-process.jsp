<%@ page import="day03.Ex02DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 파라미터를 받아서 처리하기
	request.setCharacterEncoding("UTF-8");

	Ex02DTO[] arr = {
		new Ex02DTO("test", "1234", "테스트"),	
		new Ex02DTO("iu930516", "iu", "이지은"),	
		new Ex02DTO("itbank", "it", "아이티뱅크"),	
	};
%>
<jsp:useBean id="userInput" class="day03.Ex02DTO" />
<jsp:setProperty property="*" name="userInput" />
<%
	// for문에서는 정보가 일치하는 계정만 찾아서 attribute로 등록
	for(int i = 0; i < arr.length; i++) {
		if(userInput.getUserid().equals(arr[i].getUserid())) {
			if(userInput.getUserpw().equals(arr[i].getUserpw())) {
				// 아이디와 비번이 모두 일치
				session.setAttribute("login", arr[i]);	// 서로 페이지가 달라도 참조 가능
			}
		}
	}
	
	// 로그인 결과에 따른 페이지 이동은 여기서
	if(session.getAttribute("login") == null) {
		response.sendRedirect("ex02-fail.jsp");
	}
	else {
		// forward 할 필요가 없고, 대신 redirect 로 페이지를 이동한다
		response.sendRedirect("ex02.jsp");
	}
%>




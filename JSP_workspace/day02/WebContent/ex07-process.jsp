<%@page import="java.util.Arrays"%>
<%@page import="day02.Ex07DTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 내장객체에서 리스트가 있는지 확인용으로 받아오기
	ArrayList<Ex07DTO> list = (ArrayList<Ex07DTO>)application.getAttribute("list");
	
	if(list == null) {	// 만약 없으면 새로 만들어냄
		
		Ex07DTO dto1 = new Ex07DTO();
		Ex07DTO dto2 = new Ex07DTO();
		dto1.setName("이지은");
		dto1.setAge(29);
		dto2.setName("홍진호");
		dto2.setAge(40);
		
		Ex07DTO[] arr = {dto1, dto2};
		
		list = new ArrayList<Ex07DTO>(Arrays.asList(arr));
	}
%>
<jsp:useBean id="dto" class="day02.Ex07DTO"  />
<jsp:setProperty name="dto" property="*" />
<%
	if(request.getParameter("name") != null) {
		list.add(dto);
	}
	application.setAttribute("list", list);
	// application.removeAttribute("list");
	// 지정한 이름의 attribute를 제거한다
	
	response.sendRedirect("ex07.jsp");
%>




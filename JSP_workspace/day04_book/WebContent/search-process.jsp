<%@page import="book.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="search" class="book.BookDTO"></jsp:useBean>
<jsp:setProperty property="*" name="search" />

<%
	ArrayList<BookDTO> list = (ArrayList<BookDTO>)application.getAttribute("list");

	for(int i = 0; list != null && i < list.size(); i++) {
		if(search.getName().equals(list.get(i).getName())) {
			if(search.getWriter().equals(list.get(i).getWriter())) {
				session.setAttribute("search", list.get(i));
			}
		}
	}
	
	if(session.getAttribute("search") == null) {	
		
		response.sendRedirect("search.jsp");
		return;
	}
	
	response.sendRedirect("search-result.jsp");
	
%>
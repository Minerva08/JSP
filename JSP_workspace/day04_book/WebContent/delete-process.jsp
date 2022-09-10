
<%@page import="book.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<jsp:useBean id="delete" class="book.BookDTO" />
<jsp:setProperty property="*" name="delete" />

<%
	ArrayList<BookDTO> list = (ArrayList<BookDTO>)application.getAttribute("list");
	
	int j=0;
	for(int i=0; list!=null && i<list.size();i++){
		if(delete.getName().equals(list.get(i).getName())){
			list.remove(i);
			System.out.println("삭제성공");
			j=1;
		}
	}
	if(j==1){
		response.sendRedirect("delete-result.jsp");
	}
	else{
		response.sendRedirect("delete.jsp");
	}

%>
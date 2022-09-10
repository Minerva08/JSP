
<%@page import="book.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<jsp:useBean id="insert" class="book.BookDTO" />
<jsp:setProperty property="*" name="insert" />

<%!
	public boolean isDuplicate(book.BookDTO insert, ArrayList<BookDTO> list) {
	String name = insert.getName();
	String writer = insert.getWriter();
	String company = insert.getCompany();
	String date = insert.getDate();
	String info = insert.getInfo();
	int price = insert.getPrice();
	
	for(int i = 0; list != null && i < list.size(); i++) {
		if(list.get(i).getName().equals(name)&&
				list.get(i).getWriter().equals(writer)&&
				list.get(i).getCompany().equals(company)&&
				list.get(i).getDate().equals(date)&&
				list.get(i).getInfo().equals(info)&&
				list.get(i).getPrice()==price) {
			return true;
		}
	}
	return false;
}
%>

<%
	ArrayList<BookDTO> list = (ArrayList<BookDTO>)application.getAttribute("list");
	
	if(list == null){
		list= new ArrayList<BookDTO>();
	}
	
	if(isDuplicate(insert, list) == false) {	// 중복이 아니면
		list.add(insert);						// 리스트에 추가
	}
	else {	
		response.sendRedirect("insert.jsp");
		return;
	}
	application.setAttribute("list", list);
	System.out.println(list);
	response.sendRedirect("insert-result.jsp");
%>


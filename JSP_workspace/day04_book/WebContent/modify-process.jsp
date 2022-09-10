<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ include file="header.jsp" %>

<jsp:useBean id="modify" class="book.BookDTO" />
<jsp:setProperty property="*" name="modify" />

<%
	
	int j=0;
	for(int i=0; list!=null && i<list.size();i++){
		if(modify.getName().equals(list.get(i).getName())){
			BookDTO book = list.get(i);
			System.out.println(book.getName());
			pageContext.setAttribute("book", book);
		}
	}
%>
<input type="text" name="name" value="${book.name }">
<input type="text" name="company" value="${book.company}">
<input type="text" name="writer" value="${book.writer}">
<input type="text" name="date" value="${book.date}">
<input type="text" name="info" value="${book.info}">
<input type="text" name="price" value="${book.price}">
<input type="submit">
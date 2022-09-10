<%@page import="book.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<body>
	<table border="1" cellpadding="7" cellsapcing="0">
		<tr>
			<td>도서명</td>
			<td>저자</td>
			<td>출판사</td>
			<td>출판일자</td>
			<td>가격</td>
			<td>소개</td>
		</tr>
		
			<%
				for(int i=0; list!=null && i<list.size();i++){
					BookDTO dto = list.get(i);
					pageContext.setAttribute("dto", dto);
			%>
				<tr>
					<td>${dto.name}</td>
					<td>${dto.writer}</td>
					<td>${dto.company}</td>
					<td>${dto.date}</td>
					<td>${dto.price}</td>
					<td>${dto.info}</td>
						
				</tr>
			<%
				}
		%>
	</table>
</body>
</html>
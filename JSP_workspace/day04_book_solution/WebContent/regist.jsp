<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>도서 등록 페이지</h2>
<%
	String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>

<form action="registProcess.jsp">
	<p><input type="text" name="name" placeholder="도서 이름" required autofocus></p>
	<p><input type="text" name="author" placeholder="저자" required></p>
	<p><input type="date" name="publishDate" placeholder="출판일자" required value="<%=today%>"></p>
	<p><input type="text" name="publisher" placeholder="출판사" required></p>
	<p><input type="number" name="price" min="0" step="100" placeholder="가격" required></p>
	<p><textarea name="comment" cols="40" rows="5" placeholder="소개" required></textarea></p>
	<p><input type="submit" value="등록"></p>
</form>

</body>
</html>
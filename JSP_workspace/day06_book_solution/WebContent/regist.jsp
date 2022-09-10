<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<form action="regist-process.jsp">
	<p><input type="text" name="name" placeholder="도서명"autofocus required></p>
	<p><input type="text" name="author" placeholder="저자"required></p>
	<p><input type="date" name="publishDate" placeholder="출판일자"required></p>
	<p><input type="text" name="publisher" placeholder="출판사" required></p>
	<p><input type="number" name="price" placeholder="가격" required></p>
	<p><input type="text" name="comment" placeholder="comment" required></p>
	<P><input type="submit"></P>
</form>


</body>
</html>
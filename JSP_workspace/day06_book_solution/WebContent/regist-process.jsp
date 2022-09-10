<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="regist" class="day04_book.BookDTO" />
<jsp:setProperty property="*" name="regist" />
<script>
	const flag = ${list.add(regist)};
	alert(flag ? '등록성공' :'등록실패');
	if(flag){
		location.replace('list.jsp');
	}
	else{
		history.back();
	}
</script>

</body>
</html>
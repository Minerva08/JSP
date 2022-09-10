<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<jsp:useBean id="regist" class="day04_book.BookDTO" />
<jsp:setProperty property="*" name="regist" />

<script>
	const flag = ${list.add(regist) }
	alert(flag ? '등록 성공 !!' : '등록 실패...')
	if(flag) {
		location.replace('list.jsp')
	}
	else {
		history.back()	// history.go(-1), 이렇게 이동하면 form에서 입력했던 값이 남아있다 (password 제외)
	}
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="modify" class="day04_book.BookDTO" />
<jsp:setProperty property="*" name="modify" />

${param.index }

<script>
	// list에서 전달받은 index의 값을 꺼내보고, 지정한 인덱스에 새로받은 값을 넣어서 반환되는 이전 값이 일치하면 성공
	const flag = ${list.get(param.index) == list.set(param.index, modify) }
	alert(flag ? '수정 성공 !!' : '수정 실패...')
	if(flag) {
		location.replace('list.jsp')
	}
	else {
		history.back()	// history.go(-1), 이렇게 이동하면 form에서 입력했던 값이 남아있다 (password 제외)
	}
</script>

</body>
</html>
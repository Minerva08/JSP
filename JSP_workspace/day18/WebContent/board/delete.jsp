<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const row = '${boardDAO.delete(param.idx) }'	// 만약 EL의 값이 없으면 빈문자열이 되면 문법상 오류는 발생하지 않는다
	
	if(row == 1) {
		location.href = '${cpath}/board/board.jsp?page=1'
	}
	else {
		alert('삭제 실패')
		history.go(-1)
	}
</script>

</body>
</html>
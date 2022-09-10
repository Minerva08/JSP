<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const flag = ${list.remove(list[param.idx - 1]) }
	// list.remove(int index)	이 방식으로 시도했는데 String으로 식별해서 아래 함수가 호출됨
	// list.remove(Object o)	리스트에서 배열처럼 접근 가능한 EL태그 방식으로 객체를 불러와서 삭제에 전달
	
	if(flag) {
		location.href = 'list.jsp'
	}
	else {
		history.go(-1)
	}
</script>
</body>
</html>
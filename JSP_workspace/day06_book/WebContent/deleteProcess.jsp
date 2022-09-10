<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	const flag = ${list.remove(list[param.idx - 1]) }
	
	if(flag) {
		location.href = 'list.jsp'
	}
	else {
		history.go(-1)
	}
</script>

</body>
</html>
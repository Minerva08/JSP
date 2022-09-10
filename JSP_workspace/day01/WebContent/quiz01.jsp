<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz01.jsp</title>
</head>
<body>
	<%-- 
		사용자의 이름과 나이를 입력받을 수 있는 form 태그를 작성하고,
		quiz01-result.jsp 로 파라미터를 넘겨줄 수 있도록 설정하세요
		
	 --%>
	 <!-- 사용자가 입력한 데이터를 묶어서 action을 취할 페이지에 넘겨준다 -->
	 <form action="quiz01-result.jsp">
	 	<input type="text" name="name" placeholder="이름" autofocus>
	 	<input type="text" name="age" placeholder="나이">
	 	<input type="submit" value="입력">
	 </form>

</body>
</html>
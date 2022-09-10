<%@page import="kiosk.FileUtil"%>
<%@page import="kiosk.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록</title>
</head>
<body>

<form method="POST" enctype="multipart/form-data">
	
		<p>메뉴이름 :<input type="text" name="name" placeholder="메뉴이름" autofocus required></p>
		<p>설명 : <input type="text" name="description" required>
		<p>이미지 : <input type="file" name="uploadFileName" required></p>
		<p>가격 : <input type="number" name="price" required></p>
		<p><input type="submit" value="메뉴등록"></p>
</form>

<c:if test="${pageContext.request.method == 'POST' }">
	<c:set var="dto" value="<%=FileUtil.getDTO(request)%>" /><%--jsp:useBean + jsp:setProperty --%>
	<c:set var="dao" value="<%=ProductDAO.getInstance()%>"/>
	<script>
		const row = '${dao.insert(dto) }'
		if(row==1){
			alert('메뉴등록 완료')
			location.href='${cpath}/index.jsp'
		}
		else{
			alert('메뉴등록 실패')
			history.go(-1)
				
		}
		
	</script>
</c:if>
</body>
</html>
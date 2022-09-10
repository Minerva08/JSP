<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="upload1.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>

<h1>단일 파일을 업로드 하고, DTO형식으로 DB에 insert 하기</h1>
<hr>

<form method="POST" enctype="multipart/form-data">
	<p><input type="file" name="uploadFile"></p>
	<p><input type="text" name="memo" placeholder="메모" required></p>
	<p><input type="submit"></p>
</form>

<c:if test="${pageContext.request.method == 'POST' }">
	<c:set var="dto" value="<%=FileUtil.getDTO(request) %>" /><%--jsp:useBean + jsp:setProperty --%>
	<c:set var="dao" value="<%=Upload1DAO.getInstance() %>"/>
	<script>
		const row = '${dao.insert(dto) }'
		alert(row == 1 ? '성공' : '실패')
	</script>
	
	<%-- 
		forEach를 이용하여 업로드된 그림과 메모를 반복문으로 띄우세요
		그림은 <img> 태그를 이용하세요
	 --%>
	 <c:set var="list" value="${dao.selectList() }" />
	 <c:set var="cpath" value="${pageContext.request.contextPath }" />
	 
	 <div style="display: flex; flex-flow: wrap; width: 800px; border: 3px solid black;">
	 <c:forEach var="dto" items="${list }">
		<div style="width: 170px; margin: 15px;">
			<div>
				<a href="${cpath }/image/${dto.uploadFileName}" target="_blank">
					<img src="${cpath }/image/${dto.uploadFileName}" width="150px">
				</a>
			</div>
			<div>${dto.idx } : ${dto.memo }</div>
		</div>	 	
	 </c:forEach>
	 </div>
</c:if>

</body>
</html>
<%@page import="gallery.FileUtil"%>
<%@page import="gallery.UploadDAO"%>
<%@page import="gallery.GalleryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<form method="POST" enctype="multipart/form-data">
		<p><input type="file" name="uploadFileName"></p>
		<p>작성자 :<input type="text" name="writer" autofocus required>
		<p>제목 :<input type="text" name="memo" placeholder="메모" required></p>
		<p>비밀번호 :<input type="text" name="userpw" required>
		<p><input type="submit" value="작성"></p>
</form>

<c:if test="${pageContext.request.method == 'POST' }">
	<c:set var="dto" value="<%=FileUtil.getDTO(request) %>" /><%--jsp:useBean + jsp:setProperty --%>
	<c:set var="dao" value="<%=UploadDAO.getInstance() %>"/>
	<script>
		const row = '${dao.insert(dto) }'
		if(row==1){
			alert('글쓰기 완료')
			location.href='${cpath}/index.jsp'
		}
		else{
			alert('글쓰기 실패')
			history.go(-1)
				
		}
		
	</script>
</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<form method="POST">
		<table class="boardList view">
			<tr>
				<td><input type="text" name="writer" placeholder="작성자"></td>
			</tr>
			<tr>
				<td><input type="text" name="title" placeholder="제목"></td>
			</tr>
			<tr>
				<td>
				<textarea name="content" placeholder="내용을 입력하세요"></textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" name="ipAddress" value="${pageContext.request.remoteAddr }">

		<div class="flex sb w800">
			<div>
				<input type="button" value="뒤로가기" onclick="history.go(-1)">
			</div>
			<div>
				<input type="submit" value="작성">
			</div>
		</div>
	</form>

	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="user" class="board.BoardDTO" />
		<jsp:setProperty property="*" name="user" />
		<c:set var="row" value="${boardDAO.insert(user) }" />
		<script>
			const flag = '${row}'
			if(flag == 1) {
				location.href = '${cpath}/board/list.jsp'				
			}
			else {
				alert('글 작성 실패')
				history.go(-1)
			}
		</script>
		
	</c:if>
</main>
</body>
</html>
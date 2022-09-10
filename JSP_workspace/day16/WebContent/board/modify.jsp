<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="dto" value="${boardDAO.selectBoard(param.idx) }" />
<main>
	<form method="POST">
		<table class="boardList view">
			<tr>
				<td><input type="text" name="writer" placeholder="작성자" value="${dto.writer }" required autofocus></td>
			</tr>
			<tr>
				<td><input type="text" name="title" placeholder="제목" value="${dto.title }" required></td>
			</tr>
			<tr>
				<td>
				<textarea name="content" placeholder="내용을 입력하세요" required>${dto.content }</textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" name="ipAddress" value="${pageContext.request.remoteAddr }">
		<input type="hidden" name="idx" value="${param.idx }">
		<%--시간은 submit 처리된 후 자바코드에서 만들기로... --%>
			
		<div class="flex sb w800">
			<div>
				<a href="${cpath }/board/board.jsp"><input type="button" value="목록"></a>
				<input type="button" value="뒤로가기" onclick="history.go(-1)">
			</div>
			<div>
				<input type="submit" value="수정">
			</div>
		</div>
	</form>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<jsp:useBean id="user" class="board.BoardDTO" />
		<jsp:setProperty property="*" name="user" />
		<script>
			const row = '${boardDAO.modify(user) }'
			if(row == 1) {
				alert('수정 성공 !!')
				location.href = '${cpath}/board/view.jsp?idx=${user.idx}'
			}
			else {
				alert('수정 실패...')
				history.go(-1)
			}
		</script>
	</c:if>
</main>

</body>
</html>


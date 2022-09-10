<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div>	
	<form method="POST">
		<table>
			<tr>
				<td><input type="text" name="writer" placeholder="작성자" value="${dto.writer }">${dto.writer }</td>
			</tr>
			<tr>
				<td><input type="text" name="title" placeholder="제목">${dto.title }</td>
			</tr>
			<tr>
				<td>
				<textarea name="content" placeholder="내용을 입력하세요">${dto.content }</textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" name="ipAddress" value="${pageContext.request.remoteAddr }">
		<input type="hidden" name="idx" value="${param.idx }">
		<a href="${cpath }/board/list.jsp"><input type="button" value="목록"></a>
		<input type="button" value="뒤로가기" onclick="history.go(-1)">
		<input type="submit" value="수정">
	</form>
		
		
	<jsp:useBean id="user" class="board.BoardDTO" />
	<jsp:setProperty property="*" name="user" />
	
	<script>
		const row = '${boardDAO.modify(user)}'
		if(row==1){
			alert('수정성공')
			location.herf='${cpath}/board/view.jsp?idx=${user.idx}'
		}
		else {
			alert('수정 실패...')
			history.go(-1)
		}
	</script>
		
</div> 

</body>
</html>
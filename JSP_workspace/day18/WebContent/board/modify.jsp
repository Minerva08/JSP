<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="dto" value="${boardDAO.selectBoard(param.idx) }" />

<c:if test="${empty login }">
	<c:redirect url="/member/login.jsp?url=${pageContext.request.requestURL }&idx=${dto.idx }" />
</c:if>

<%-- board 테이블의 writer 컬럼은 외래키 속성으로 member테이블의 userid 컬럼값을 참조해야 하므로, 일치하지 않는다면 본인 글이 아니다 --%>
<c:if test="${not empty login and login.userid != dto.writer }">
	<script>
		alert('본인의 게시글만 수정할 수 있습니다 !!')
		location.href = '${cpath}/board/view.jsp?idx=${dto.idx}'
	</script>
</c:if>

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
				<a href="${cpath }/board/board.jsp?page=${param.page}">
					<input type="button" value="목록">
				</a>
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

<%@ include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="dto" value="${boardDAO.selectBoard(param.idx) }" />
<main>
	<table class="boardList view">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.title }</td>
			<td>${dto.writer }</td>
			<td>${dto.writeDate }</td>
			<td>${dto.ipAddress }</td>
		</tr>
		<tr>
			<td colspan="5">
				<pre>${dto.content }</pre>
			</td>
		</tr>
	</table>
	<div class="flex sb w800">
		<div>
			<a href="${cpath }/board/board.jsp"><button>목록</button></a>
		</div>
		<div>
			<a href="${cpath }/board/modify.jsp?idx=${dto.idx }"><button>수정</button></a>
			<button id="deleteBtn">삭제</button>
		</div>
	</div>
<%-- 	<jsp:include page="list.jsp" /> --%>
</main>

<script>
	const deleteBtn = document.getElementById('deleteBtn')
	deleteBtn.onclick = function() {
		const idx = '${dto.idx}'
		if(confirm(idx + '번 글을 정말 삭제하시겠습니까?')) {
			location.href = '${cpath}/board/delete.jsp?idx=' + idx
		}
	}
</script>

<jsp:include page="list.jsp" />

</body>
</html>
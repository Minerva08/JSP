<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:if test="${not empty param.idx }">
	<c:set var="dto" value="${boardDAO.selectBoard(param.idx)}"/>
	
	<main>
		<table class="boardList_view" style="width: 800px; margin:50px auto;">
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
				<a href="${cpath }"><button>목록</button></a>
				<a href="${cpath }/memberonly/modify.jsp?idx=${dto.idx }"><button>수정</button></a>
				<button id="deleteBtn">삭제</button>
			</div>
		</div>
	
	</main>
	
</c:if>

</body>
</html>
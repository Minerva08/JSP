<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:choose>
	<c:when test="${empty login}">
		<c:redirect url="${cpath }/memberonly/login.jsp"/>
	</c:when>
	
	<c:otherwise>
		<form method="POST">
			<table class="boardList view">
				<tr>
					<td><input type="text" name="writer" value="${login.userid }" readonly></td>
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
		
		<jsp:useBean id="dto" class="board.BoardDTO"/>
		<jsp:setProperty property="*" name="dto"/>
		
		<c:if test="${boardDAO.insert(dto)==1 }">
			<script>
					location.href = '${cpath}'				
			</script>
		</c:if>
		
		<c:if test="${boardDAO.insert(dto)!=1  }">
			<script>
				history.go(-1)
			</script>
			
		</c:if>
	</c:otherwise>
</c:choose>



</body>
</html>
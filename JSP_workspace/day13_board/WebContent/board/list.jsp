<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header-java.jsp" %>
<%--현재 위치 기준 한단계 상위의 경로 : .. --%>

<main>
	<table class="boardList">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>IP Address</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty param.search }">
					<c:set var="list" value="${boardDAO.selectBoardList() }" />
				</c:when>
				<c:otherwise>
					<c:set var="list" value="${boardDAO.selectBoardList(param.column, param.search) }" />
				</c:otherwise>
			</c:choose>
			<c:forEach var="dto" items="${list }">
			<tr>
				<th>${dto.idx }</th>
				<td><a href="${cpath }/board/view.jsp?idx=${dto.idx}">${dto.title }</a></td>
				<th>${dto.writer }</th>
				<th>${dto.writeDate }</th>
				<th>${dto.ipAddress }</th>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="flex sb" style="width: 800px; margin-top: 30px;">
		<div><!-- 왼쪽 하단 메뉴 -->
			<form action="board.jsp">
				<select name="column">
					<option ${param.column == 'writer' ? 'selected' : '' } 	value="writer">작성자 이름으로 검색</option>
					<option ${param.column == 'title' ? 'selected' : '' } 	value="title">글 제목으로 검색</option>
					<option ${param.column == 'content' ? 'selected' : '' } value="content">내용으로 검색</option>
					<option ${param.column == 'idx' ? 'selected' : '' } value="idx">번호로 검색</option>
				</select>
				<input type="search" name="search" placeholder="검색어를 입력하세요" value="${param.search }" autocomplete="off">
				<input type="submit" value="검색">
			</form>
		</div>
		<div><!-- 오른쪽 하단 메뉴 -->
			<a href="${cpath }/board/write.jsp"><button>작성</button></a>
		</div>
	</div>
</main>

</body>
</html>
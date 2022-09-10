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
			<c:set var="list" value="${boardDAO.selectBoardList(param.page, param.column, param.search) }" />
			<c:forEach var="dto" items="${list }">
			<tr>
				<th>${dto.idx }</th>
				<td><a href="${cpath }/board/view.jsp?idx=${dto.idx}&page=${param.page}">${dto.title }</a></td>
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
				</select>
				<input type="search" name="search" placeholder="검색어를 입력하세요" value="${param.search }" autocomplete="off">
				<input type="hidden" name="page" value="1">
				<input type="submit" value="검색">
			</form>
		</div>
		<div><!-- 오른쪽 하단 메뉴 -->
			<a href="${cpath }/board/write.jsp"><button>작성</button></a>
		</div>
	</div>
	
	<c:set var="pageCount" value="${boardDAO.selectPageCount(param.column, param.search) }" />
	<fmt:parseNumber var="section" value="${(param.page - 1) / 10 }" integerOnly="true" /><%--쪽번호 진행률,10 한 페이지 내쪽번호 개수 --%>
	<c:set var="begin" value="${section * 10 + 1 }" /><%--시작 쪽번호 --%>
	<c:set var="end" value="${pageCount < begin + 9  ? pageCount : begin + 9 }" /><%--마지막 쪽번호 --%>
	<c:set var="prev" value="${section != 0 }" /><%--이전 페이지--%>
	<c:set var="next" value="${pageCount / 10 != end / 10 }" /><%--다음 페이지로 --%>
 	<p> 
 		param.page : ${param.page }<br> 
		pageCount : ${pageCount }<br> 
		section : ${section }<br> 
		begin : ${begin}<br> 
		end : ${end }<br> 
 		prev : ${prev }<br> 
	</p>
	<div class="paging">
		<c:if test="${prev }">
			<a href="${cpath }/board/board.jsp?page=${begin - 1}&column=${param.column}&search=${param.search}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${begin }" end="${end }">
			<a class="${param.page == i ? 'bold' : ''}" 
			   href="${cpath }/board/board.jsp?page=${i}&column=${param.column}&search=${param.search}">[${i }]</a>
		</c:forEach>
		<c:if test="${next }">
			<a href="${cpath }/board/board.jsp?page=${end + 1}&column=${param.column}&search=${param.search}">[다음]</a>
		</c:if>
	</div>
</main>

</body>
</html>
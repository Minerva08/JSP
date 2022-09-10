<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="boardDAO" value="<%=BoardDAO.getInstance() %>"/>
<% 	request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<div class="search">
	<form>
		<select name="column">
			<option ${param.column == 'writer' ? 'selected':'' } value="writer">작성자</option>
			<option ${param.column == 'title' ? 'selected':'' } value="title">제목</option>
			<option ${param.column == 'content' ? 'selected':'' } value="content">내용</option>
		</select>
		
		<input type="search" name="search" placeholder="검색어를 입력하세요" value="${param.search }" autocomplete="off">
		<input type="submit" value="검색">
	</form>
</div>



<table class="board_list"  cellpadding="7" cellspacing="0">
	
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
	<c:if test="${empty param.search }">
		<c:set var="list" value="${boardDAO.selectBoardList() }"/>
	</c:if>
	<c:if test="${not empty param.search }">
		<c:set var="list" value="${boardDAO.selectBoardList(param.column, param.search)}"/>
	</c:if>
	<c:forEach var="dto" items="${list }">
		<tr>
			<th>${dto.idx }</th>
			<td><a href="${cpath }/whoever/view.jsp?idx=${dto.idx}">${dto.title }</a></td>
			<td>${dto.writer }</td>
			<td>${dto.writeDate }</td>
			<td>${dto.ipAddress }</td>
		</tr>
		
	</c:forEach>
	</tbody>
</table>

<div><!-- 오른쪽 하단 메뉴 -->
	<a href="${cpath }/memberonly/write.jsp"><button>작성</button></a>
</div>
	



</body>
</html>
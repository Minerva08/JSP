<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header-java.jsp" %>
 
<table border="1">
	<tr>
		<td>번호</td>
		<td colspan="2">제목</td>
		<td>작성자</td>
		<td>작성일자</td>
	</tr>
	<c:set var="list" value="${galleryDAO.getList(param.page) }"/>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.idx }</td>
			<td><a href="${cpath }/image/${dto.uploadFileName}" target="_blank">
				<img src="${cpath }/image/${dto.uploadFileName}" width="150px"></a></td>
			<td>
				<a href="${cpath}/board/view.jsp?image=${cpath }/image/${dto.uploadFileName}&idx=${dto.idx}">${dto.memo }</a>
			</td>
			<td>${dto.writer }</td>
			<td>${dto.uploadDate }</td>
		</tr>
	</c:forEach>
</table>

<c:set var="pageCount" value="${galleryDAO.pageCount() }"/>
<fmt:parseNumber var="section" value="${(param.page-1)/ 5 }" integerOnly="true"/>
<c:set var="begin" value="${section * 5 + 1}"/>
<c:set var="end" value="${pageCount < begin + 4 ? pageCount:begin + 4}"/>
<c:set var="prev" value="${section !=0 }"/>
<c:set var="next" value="${pageCount / 5 != end /5}"/>

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
		<a href="${cpath }?page=${begin-1}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${begin }" end="${end}">
		<a class="${param.page == i ? 'bold' : ''}" 
			   href="${cpath }?page=${i}">[${i }]</a>
	</c:forEach>
	<c:if test="${next }">
		<a href="${cpath }?page=${end+1}">[다음]</a>
	</c:if>
</div>


</body>
</html>
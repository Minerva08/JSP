<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<c:set var="referer" value="${header.referer }" />
<c:set var="startIndex" value="${fn:indexOf(referer,'idx') }" />
<c:set var="endIndex" value="${fn:indexOf(referer,'&') }" />
<c:set var="idx" value="${fn:substring(referer, startIndex, endIndex) }" />
<c:set var="idx" value="${fn:split(idx,'=')[1] }" />

<h2>삭제할 댓글 번호 : ${param.idx }</h2>
<h2>삭제 이후 돌아갈 게시글 번호 : ${idx }</h2>
<script>
	const row = '${boardDAO.deleteReply(param.idx) }'
	if(row == 0) {
		alert('삭제 실패')
	}
	location.href = '${cpath}/board/view.jsp?idx=${idx }#replyList'
</script>

<%
// 	String referer = request.getHeader("referer");			// 이전 경로를 가져와서
// 	int startIndex = referer.indexOf("idx");				// idx가 위치한 문자열 index
// 	int endIndex = referer.indexOf("&");					// &가 위치한 문자열 인덱스
// 	String idx = referer.substring(startIndex, endIndex);	// idx=382 까지의 문자열을 잘라내고
// 	idx = idx.split("=")[1];								// = 을 중심으로 나누어서 [1]번째 요소를 저장
	// referer[49:54]
%>





<%--
		referer (참조자) : 현재 페이지에 도달하게 된 바로 이전 경로를 나타내는 항목
 --%>
</body>
</html>
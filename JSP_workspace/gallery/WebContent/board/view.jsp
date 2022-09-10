<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	
<c:set var="dto" value="${ galleryDAO.selectcontent(param.idx)}"/>

<main>
	<form method="POST">
		<div class="content">
			<input type="hidden" name="idx" value="${dto.idx }">
			<div class="writer">
				작성자 : ${dto.writer }
			</div>
			<div class="image">
				<img src="${param.image }" width="500px">
			</div>
		</div>
		<p>
			<input type="text" name="pw" placeholder="작성시 설정한 비밀번호 입력" autofocus required>
			<button class="deleteReplyBtn">삭제</button>
		</p>
	</form>
	
</main>

<c:if test="${pageContext.request.method == 'POST' }">
	<c:if test="${dto.userpw eq param.pw}">
		<script>
			const row = '${galleryDAO.deletecontent(param.idx) }'
			if(row==1){
				alert('삭제성공')
				location.href='${cpath}'
			}
			else{
				alert('삭제 실패')
				history.go(-1)
			}
		</script>
	</c:if>
</c:if>
</body>
</html>
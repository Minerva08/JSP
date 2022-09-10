<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>도서 삭제</h2>

<form>
	<p>
		<input type="number" name="idx" placeholder="도서번호로 검색하세요" 
			   style="width: 200px;"
			   value="${param.idx }" autofocus required min="1" max="${list.size() }">
		<input type="submit" value="검색">
	</p>
</form>

<c:if test="${not empty param.idx }">
	<table>
		<tr><td>도서 이름</td><td>${list[param.idx - 1].name }</td></tr>
		<tr><td>저자</td><td>${list[param.idx - 1].author }</td></tr>
		<tr><td>출판일자</td><td>${list[param.idx - 1].publishDate }</td></tr>
		<tr><td>출판사</td><td>${list[param.idx - 1].publisher }</td></tr>
		<tr><td>가격</td><td>${list[param.idx - 1].price }</td></tr>
		<tr><td>소개</td><td>${list[param.idx - 1].comment }</td></tr>
	</table>
	<p>
		<button id="deleteBtn">삭제</button>
	</p>
</c:if>

<script>
	const deleteBtn = document.getElementById('deleteBtn')
	const idx = '${param.idx}'
	
	deleteBtn.onclick = function() {
		const yesno = confirm('정말 ' + idx + '번 도서를 삭제하시겠습니까?')
		
		if(yesno) {
			location.href = 'deleteProcess.jsp?idx=' + idx
		}
	}
</script>

</body>
</html>
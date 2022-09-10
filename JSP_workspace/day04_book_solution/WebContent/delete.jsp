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

<%	
	if(request.getParameter("idx") != null) {
		
		// 배열이나 리스트에서 index는 고유하다(다른 값과 중복되지 않는다. unique, primary key)
		int idx = Integer.parseInt(request.getParameter("idx"));
		BookDTO dto = list.get(idx - 1);
		pageContext.setAttribute("searchDTO", dto);	// attribute에 등록
		
		// 검색 결과가 있으면 HTML 태그를 활용하여 화면에 출력
		if(pageContext.getAttribute("searchDTO") != null) {	
			%>
			<table>
				<tr><td>도서 이름</td><td>${searchDTO.name }</td></tr>
				<tr><td>저자</td><td>${searchDTO.author }</td></tr>
				<tr><td>출판일자</td><td>${searchDTO.publishDate }</td></tr>
				<tr><td>출판사</td><td>${searchDTO.publisher }</td></tr>
				<tr><td>가격</td><td>${searchDTO.price }</td></tr>
				<tr><td>소개</td><td>${searchDTO.comment }</td></tr>
			</table>
			<p>
<%-- <a style="display: inline;" href="deleteProcess.jsp?idx=${param.idx }"> --%>
				<button id="deleteBtn">삭제</button>
<!-- </a> -->
			</p>
			<%
		}
		// 검색 결과가 없으면
		else {		
			out.println("<h3>검색 결과가 없습니다</h3>");
		}
	} 
%>
<script>
	const deleteBtn = document.getElementById('deleteBtn')
	const idx = '${param.idx}'
	
	deleteBtn.onclick = function() {
		const yesno = confirm('정말 ' + idx + '번 도서를 삭제하시겠습니까?')
		
		// alert() 함수는 팝업창으로 메시지를 출력하고, 확인버튼만 받는다면
		// confirm() 함수는 팝업창으로 메시지를 출력하고, 확인/취소를 받아서 그 결과에 따라 true / false를 반환한다
		
		if(yesno) {
			location.href = 'deleteProcess.jsp?idx=' + idx
		}
	}
	
</script>

</body>
</html>
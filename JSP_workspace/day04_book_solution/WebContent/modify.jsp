<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>도서 수정</h2>

<form>
	<p>
		<input type="text" name="name" placeholder="도서명으로 검색하세요" 
			   value="${param.name }" autofocus required>
		<input type="submit" value="검색">
	</p>
</form>

<%	
	if(request.getParameter("name") != null) {
		
		// 반복문으로 검색어를 포함하는 객체가 있으면 searchDTO 에 저장하기
		for(int i = 0; list != null && i < list.size(); i++) {
			String search = request.getParameter("name");
			BookDTO dto = list.get(i);
			if(dto.getName().contains(search)) {
				pageContext.setAttribute("searchDTO", dto);	// attribute에 등록
				pageContext.setAttribute("index", i);	// 수정을 위한 index 전달
				break;
			}
		}
		// 검색 결과가 있으면 HTML 태그를 활용하여 화면에 출력
		if(pageContext.getAttribute("searchDTO") != null) {	
			%>
			<form action="modifyProcess.jsp">
			<table>
				<tr>
					<td>도서 이름</td>
					<td><input name="name" value="${searchDTO.name }" required></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input name="author" value="${searchDTO.author }" required></td>
				</tr>
				<tr>
					<td>출판일자</td>
					<td><input type="date" name="publishDate" value="${searchDTO.publishDate }" required></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input name="publisher" value="${searchDTO.publisher }" required></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="price" value="${searchDTO.price.replace(',', '') }" required></td>
				</tr>
				<tr>
					<td>소개</td>
					<td><textarea name="comment" cols="40" rows="5" required>${searchDTO.comment }</textarea></td>
				</tr>
			</table>
			<p><input type="hidden" name="index" value="${index }"></p>
			<p><input type="submit" value="수정"></p>
			</form>
			<%
		}
		// 검색 결과가 없으면
		else {		
			out.println("<h3>검색 결과가 없습니다</h3>");
		}
	} 
%>
</body>
</html>
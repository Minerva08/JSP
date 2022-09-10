<%@ page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ex01-header.jsp" %>
<%--먼저 합치고, 이후 컴파일 --%>

<%
	//String name = "아이유"; // - Duplicate local variable name
	request.setCharacterEncoding("UTF-8");
%>

<div class="component">
	<h1>ex01-home</h1>
	<%=URLDecoder.decode(request.getParameter("name"), "UTF-8") %>
	<ul>
		<li>다른 웹 문서를 가져와서 소스코드를 합친 상태로 컴파일 한다</li>
		<li>상단 메뉴, 하단 메뉴 등의 공통된 페이지 요소를 처리하기에 좋다</li>
		<li>서로 다른 두 메뉴는 컴파일 이전에 소스코드가 합쳐지므로, 변수이름이 중복되면 안된다</li>
		<li>include 대상 파일에서 선언한 변수는 include를 처리하는 파일에서 모두 사용가능</li>
	</ul>
</div>


</body>
</html>
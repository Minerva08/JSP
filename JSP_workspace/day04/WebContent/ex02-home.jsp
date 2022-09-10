<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="ex02-header.jsp" />
<%--먼저 각자 컴파일, 결과를 합친다 --%>
<%
	String name = "아이유";
%>

<div class="component">
	<h1>include 액션태그</h1>
	<h3><%=name %>님, 안녕하세요</h3>
	<ul>
		<li>액션 태그를 사용해서 include를 구현할 수도 있다</li>
		<li>다른 페이지의 내용을 불러와서 현재 페이지에 포함시킨다는 개념은 동일하다</li>
		<li>단, 액션태그 include는 서로 다른 두 파일을 컴파일 해서 만든 HTML 소스를 합친다</li>
		<li>컴파일 단계에서 서로 다른 파일이므로, 변수이름이 겹쳐도 문제가 되지 않는다</li>
		<li>두 파일은 변수를 공유할 수 없다</li>
		<li>상단/하단에 포함시키기보다는, 중간에 이미 만든 페이지의 내용을 불러오는 용도로 사용한다</li>
	</ul>
</div>




</body>
</html>
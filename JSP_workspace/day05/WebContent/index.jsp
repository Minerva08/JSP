<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%
	// header.jsp 에 선언된 리스트를 참조할 수 있으나, index와 regist가 서로 다른 객체이므로, 
	// 서로 다른 객체의 이름만 같은 멤버필드는 같은 대상이라고 할 수 없다
	// 따라서, 서로 다른 페이지간에 공유할 객체를 session이나, application 내장 객체에 저장해야 한다
	
	// 서버 콘솔창에 출력
	for(int i = 0; i < list.size(); i++) {
		PhoneBookDTO dto = list.get(i);
		System.out.println(dto.getName() + " : " + dto.getPnum());
	}
	System.out.println("====================");
	
	// HTML 문서에 출력
	for(int i = 0; i < list.size(); i++) {
		PhoneBookDTO dto = list.get(i);
		out.println(dto.getName() + " : " + dto.getPnum() + "<br>");
	}
	out.println("====================<br>");
%>



<h2>리스트의 객체 해시코드 : <%=list.hashCode() %></h2>

</body>
</html>
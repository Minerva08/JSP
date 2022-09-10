<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>등록</h2>

<form>
	<p><input name="name" placeholder="이름"></p>
	<p><input name="pnum" placeholder="전화번호"></p>
	<p><input type="submit"></p>
</form>

<jsp:useBean id="regist" class="day05.PhoneBookDTO" />
<jsp:setProperty name="regist" property="*" />

<%
	if(regist.getName() != null && regist.getName().equals("") == false) {
		
		list.add(regist);
		
		for(PhoneBookDTO dto : list) {
			System.out.println("name : " + dto.getName());
			System.out.println("pnum : " + dto.getPnum());
		}
		
		response.sendRedirect(request.getContextPath());
	}
%>

<h2>리스트의 객체 해시코드 : <%=list.hashCode() %></h2>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="dao" value="<%=MemberDAO.getInstance() %>" />

<%	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="member.MemberDTO" />
<jsp:setProperty property="*" name="user" />

<c:set var="login" value="${dao.login(user) }" scope="session" />

<%
	String checkbox = request.getParameter("autologin");
	
	if(checkbox != null) {
		Cookie c = new Cookie("JSESSIONID", session.getId());
		c.setMaxAge(3600);	// 자동로그인이 허용되는 시간은 1시간
		response.addCookie(c);
	}
%>

<c:redirect url="/ex02.jsp" />

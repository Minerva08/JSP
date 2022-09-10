<%@ include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cinemaMember.*"%>


<jsp:useBean id="user" class="cinemaMember.CinemaMemberDTO"/>
<jsp:setProperty property="*" name="user"/>

<c:set var="login" value="${Mdao.login(user)}" scope="session"/>

 				
<!-- 자동로긴 확인하기 -->
<%
	String checkbox = request.getParameter("autologin");
	if(checkbox !=null){
		Cookie ck = new Cookie("JSESSIONID",session.getId());
		ck.setMaxAge(3600); //자동로그인 허용 1시간제한
		response.addCookie(ck);
	}
%>

<c:redirect url="login.jsp"/>
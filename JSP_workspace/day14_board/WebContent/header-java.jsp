<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*, member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 	request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="boardDAO" value="<%=BoardDAO.getInstance() %>" />
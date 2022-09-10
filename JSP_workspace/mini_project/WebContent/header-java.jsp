<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="cinemaMember.*, ticketing.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="Tdao" value="<%=TicketingDAO.getInstance()%>"></c:set>
<c:set var="Mdao" value="<%=CinemaMemberDAO.getInstance()%>"></c:set>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<link href="css/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>

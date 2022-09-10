<%@page import="gallery.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% 	request.setCharacterEncoding("UTF-8"); %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="galleryDAO" value="<%=GalleryDAO.getInstance() %>" />

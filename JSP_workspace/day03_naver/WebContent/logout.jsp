<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	
	// 현재 웹 프로젝트에서 문서를 배치하는 최상위 폴더
	String contextPath = request.getContextPath();

	response.sendRedirect(contextPath);
	// 경로만 요청하고 자원이름이 없으면, 경로 안에 index.***이 있는지 보고 있으면 그 문서를 보여준다
%>
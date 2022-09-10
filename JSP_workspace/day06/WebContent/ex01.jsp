<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--라이브러리 파일을 통해서 새로운 태그를 사용할 것이고, 내용은 uri를 참조하며, 태그는 C로 시작하는 형식으로 사용한다 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSTL</h1>
<hr>
<fieldset>
	<ul>
		<li>JSP Standard Tag Library</li>
		<li>JSP는 원래 자바로 작동할 내용을 스크립트 형식의 언어로 만들었기 때문에 임의로 태그를 만들어서 사용할수 있다</li>
		<li>여러 개발자들이 필요에 따라 각자 태그를 만들어서 사용하다 보니, 표준이 없어 여러문제가 발생했다</li>
		<li>여러 태그들을 모아서, 표준을 맞추고, 묶어서 라이브러리화 시킨게 현재의 JSTL이다</li>
		<li>core : 객체 생성/삭제(attribute), 제어문(if for),web(url,redirect)</li>
		<li>fmt : 날짜 및 시간, 통화에 대해 서식을 지정할 수 있는 태그</li>
		<li>function : 데이터를 잘라내거나, 합치거나 기본적인 문자열 처리를 수행하는 함수 모음</li>
		<li>sql : 자바 코드를 통하지 않고서도, JDBC에 접근 및 DBCP를 활용할 수 있는 형식의 태그 지원</li>
		
	</ul>
</fieldset>
<c:set var="member1" scope="page" value="이지은" />
<h2>${member1}</h2>
</body>
</html>
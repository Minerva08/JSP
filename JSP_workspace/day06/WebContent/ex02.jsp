
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02 - JSTL:core</title>
</head>
<body>


<h1>JSTL:core</h1>
<hr>

<ul>
	<li>c:set		-객체를 생성하거나 객체의 속성을 지정한다(attribute로 등록된다)</li>
	<li>c:if		-조건을 판단하여 내부 코드를 실행한다</li>
	<li>c:forEach	-컬렉션을 대상으로 반복문을 수행하거나, 횟수를 전달받아 반복문을 수행한다</li>
	<li>c:redirect	-클라이언트에게 리다이렉트로 응답을 보낸다</li>
	<li>c:remove	-지정한 scope의 attribute를 제거한다</li>
	<li>c:choose	-switch ~ case 처럼 여러 조건에 대한 분기를 설정한다. 하위로,c:when c:otherwise가 있다</li>
	
</ul>

<h2>c:set</h2>

<c:set var="member1" value="이지은" scope="page" />
<%
	String mem1 = new String("이지은");
	pageContext.setAttribute("mem1", mem1);
%>
<c:set var="member2" value="${'홍진호'}" scope="request" />
<%--value에 EL Tag를 사용할 수 있다 --%>

<c:set var="member3" scope="session">나단비</c:set>
<%--시작태그와 마무리태그 사이에 값을 저장할 수도 있다 --%>

<c:set var="member4" scope="application" value="<%=new Scanner(System.in) %>" />

<h4>member1 : ${member1 }</h4>
<h4>member2 : ${member2 }</h4>
<h4>member3 : ${member3 }</h4>
<h4>member4 : ${member4 }</h4>

<jsp:useBean id="st1" class="day06.Student" />
<h4>st1.name : ${st1.name }</h4>
<h4>st1.score : ${st1.score }</h4>


<c:set target="${st1}" property="name" value="이지은" />
<c:set target="<%=st1 %>" property="score" value="100" />
<h4>st1.name : ${st1.name }</h4>
<h4>st1.score : ${st1.score }</h4>

<%--
	c:set으로 이미 생성된 객체의 속성값을 지정할 수도 있는데
	이때 target속성은 객체를 참조해야 하므로, 표현식이나 EL Tag형식으로 접근하자
 --%>

</body>
</html>
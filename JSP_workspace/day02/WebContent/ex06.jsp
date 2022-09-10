<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06 - attribute</title>
</head>
<body>

	<h1>attribute</h1>
	<hr>
	
	<h3>JSP 내장 객체 중, attribute를 저장하고 불러올 수 있는 객체는 총 4가지 종류가 있다</h3>
	<ol>
		<li>pageContext : 현재 페이지에서만 유효함, 페이지가 변경되면 새로운 내장객체가 생성되므로 attribute가 사라짐</li>
		<li>request : 현재 요청에서만 유효함, 기본적으로 pageContext와 비슷하지만 forward상황이라면 조금 더 긴 시간 유지됨</li>
		<li>session : 현재 세션에서만 유효함, 클라이언트가 브라우저 종료/로그아웃 하기전까지 유지됨</li>
		<li>application : 현재 서버가 지속중인 경우에 유효함, 서버를 종료하거나 재시작하면 사라짐</li>
	</ol>
	
	<h4>request.setAttribute(String name, Object o)</h4>
	
	<p>지정한 name으로 객체 o를 attribute로 등록한다. 모든 유형의 객체를 저장할 수 있다</p>
	
	<h4>request.getAttribute(String name)</h4>
	
	<p>지정한 name으로 객체를 찾아서 반환한다. 반환되는 타입은 Object이며, 필요하다면 형변환(Casting)을 해야한다</p>
	<p>만약 지정한 name의 객체가 없으면 null을 반환한다</p>
	
	<h3>서로 다른 JSP 페이지간에 원활한 객체 전달을 위해서이다</h3>
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>
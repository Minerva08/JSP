<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03 - EL Tag</title>
</head>
<body>

	<h1>EL Tag</h1>
	<hr>
	<ol>
		<li>
			내장 객체의 attribute에 접근할 수 있다
			<ul>
				<li>attribute에 접근하여, 내부 멤버 요소를 참조할때, getter 형식은 생략한다</li>
				<li>별도의 형 변환이 필요 없다</li>
				<li>pageContext -> request -> session -> application 순서로 탐색한다</li>
				<li>특정 scope의 attribute에 지정하여 접근할 수 있다</li>
				<li>만약, attribute의 자료형이 Collection이면, 내부요소에도 접근이 가능하다</li>
			</ul>
		</li>
		<li>
			파라미터에도 접근하여 출력할 수 있다 - \${param.name }
		</li>
		<li>
			연산자를 사용할 수 있다
			<ul>
				<li>산술 연산자 : +, -, *, /, %</li>
				<li>비교 연산자 : >, <, >=, <=, ==, !=</li> 
				<li>null 여부 : empty(== null), not empty(!= null)</li>
				<li>EL Tag 내부에서는 + 연산이 무조건 숫자에 대한 연산으로 취급된다</li>
				<li>문자열 상수는 ' 로 묶어준다</li>
				<li>삼항 연산자 사용 가능</li>
			</ul>
		</li>
		<li>
			EL Tag에서 pageContext를 출발점으로, 다른 내장객체에 접근이 가능하다
		</li>
	</ol>
	${'안녕하세요' }<br>
	${'123' + 1 }<br>
	${pageContext }<br>
	${pageContext.request }<br>
	${pageContext.session }<br>
	${pageContext.servletContext }<br>
	
	<%
		pageContext.setAttribute("num", 1);
		request.setAttribute("num", 2);
		session.setAttribute("num", 3);
		application.setAttribute("num", 4);
	%>
	
	<p>${num }</p>
	<p>${pageScope.num }</p>
	<p>${requestScope.num }</p>
	<p>${sessionScope.num }</p>
	<p>${applicationScope.num }</p>
	<p>${param.name }</p>
	<p>${empty param.name ? 'Guest' : param.name } 님, 안녕하세요</p>
		
	
	<%
		// 배열
		String[] arr = {"BTS", "에스파", "마마무", "ITZY"};
		pageContext.setAttribute("arr", arr);
		
		// 리스트
		List<String> list = Arrays.asList(arr);
		request.setAttribute("list", list);
		
		// 맵
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("박진영", "JYP");
		map.put("이수만", "SM");
		map.put("방시혁", "Hive");
		map.put("양현석", "YG");
		session.setAttribute("map", map);
	%>
	
	${arr[0] }<br>
	${list[1] }<br>
	${map['박진영'] }<br>
	
	<%=((HashMap<String, String>)session.getAttribute("map")).get("양현석") %>












</body>
</html>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리 (쿠키를 활용한 ID저장)</title>
</head>
<body>
<%	request.setCharacterEncoding("UTF-8"); %>

<c:set var="dao" value="<%=MemberDAO.getInstance() %>" />
<c:set var="test" value="${dao.test }" />
<h4>DB 접속 여부 : ${not empty test }, 접속 시간 : ${test }, DAO : ${dao }</h4>

<jsp:useBean id="user" class="member.MemberDTO" />
<jsp:setProperty property="*" name="user"/>

<c:set var="login" value="${dao.login(user) }" scope="session" />
<%--
		dao의 login함수를 호출하면서 사용자의 파라미터가 담긴  user 객체를 전달하고
		함수호출의 반환값을 login이라는 객체로 다시 받고
		그 로그인 객체를 session에 attribute형식으로 저장하면서 이름은 login, 값은 DB에서 받아온 dto객체
 --%>
 
 <%		
 		String storeid = request.getParameter("storeid");	// 1) 체크박스의 값이 널인가 아닌가 확인
		System.out.println("1 : "+storeid);
 		Object login = session.getAttribute("login");		// 2) 로그인 결과가 세션에 잘 저장되어 있는가 확인
 		System.out.println("2 : "+login);
 		boolean flag = storeid != null && login != null;
 		
		Cookie c = new Cookie("storeid", request.getParameter("userid"));
		System.out.println("3 : "+c);
		// 만약 체크박스에 체크가 되어 있다면, 사용자가 입력한 ID값을 storeid라는 이름으로 쿠키에 저장한다
		
		c.setMaxAge(flag ? 60 : 0);	// 조건에 따라서 하루의 유효기간을 설정하거나, 0으로 설정한다(삭제)
		
		response.addCookie(c);	// 클라이언트에게 전송될 응답에 쿠키를 적재한다
%>

<c:redirect url="/loginForm.jsp" />
<%--
		c:url 이나 c:redirect 와 같이 웹 주소를 다루는 JSTL은 contextPath 처리를 해주기 때문에, 
		주소에 프로젝트 이름을 쓰지 않는다
 --%>

</body>
</html>



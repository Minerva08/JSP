<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01 - jdbc test</title>
</head>
<body>

<jsp:useBean id="dao" class="day07.Ex01DAO" />
<%--useBean은 지정한 클래스의 기본 생성자로 객체를 생성하며 scope에 따라 attribute로 등록한다. (기본값은 page) --%>
<%--
		Ex01DAO dao = new Ex01DAO();
		pageContext.setAttribute("dao", dao);
 --%>

<h1>JDBC 접속 테스트</h1>
<hr>
<h3>banner : ${dao.test }</h3>
<%-- dao.getTest() --%>

</body>
</html>
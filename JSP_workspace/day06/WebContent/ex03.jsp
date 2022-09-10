<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03 - c:if</title>
</head>
<body>

        <h1>c:if</h1>
        <hr>
        <ul>
                <li>else 의 개념이 없다</li>
                <li>조건은 c:if 태그의 test 속성에 작성하며, 보통 EL Tag형식으로 처리한다</li>
        </ul>
        
        <form>
                <p><input type="text" name="name" placeholder="이름을 입력하세요"></p>
                <p><input type="text" name="age" placeholder="나이를 입력하세요"></p>
                <p><input type="submit"></p>
        </form>
        
        <c:if test="${not empty param.name and not empty param.age}">
                <c:if test="${param.age >= 20 }">
                		<h4>${param.name }님의 나이는 ${param.age }살이고, 성인입니다</h4>
                </c:if>
                <c:if test="${param.age < 20 }">
                        <h4>${param.name }님의 나이는 ${param.age }살이고, 미성년자 입니다</h4>
                </c:if>
        </c:if>
        

</body>
</html>
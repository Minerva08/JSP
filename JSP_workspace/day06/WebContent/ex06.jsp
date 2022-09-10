<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06 - c:choose</title>
</head>
<body>

        <h1>c:choose</h1>
        <hr>
        
        <form>
                <h3>최종학력을 선택하세요</h3>
                <select name="school">
                        <option ${param.school eq '초등학교' ? 'selected' : ''}>초등학교</option>
                        <option ${param.school eq '중학교' ? 'selected' : ''}>중학교</option>
                        <option ${param.school eq '고등학교' ? 'selected' : ''}>고등학교</option>
                        <option ${param.school eq '기타' ? 'selected' : ''}>기타</option>
                </select>
                <input type="submit">
        </form>
        <%-- if ~ else if ~ else 와 같이 작동한다 --%>
        <c:if test="${not empty param.school }">
                <c:choose>
                        <c:when test="${param.school eq '초등학교' }">
                                <h3>초등학생입니다</h3>
                        </c:when>
                        <c:when test="${param.school == '중학교' }">
                                <h3>중학생입니다</h3>
                        </c:when>
                        <c:when test="${param.school eq '고등학교' }">
                                <h3>고등학생입니다</h3>
                        </c:when>
                        <c:otherwise>
                                <h3>다른 속성을 선택했습니다</h3>
                        </c:otherwise>
                </c:choose>
        </c:if>

</body>
</html>
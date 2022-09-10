<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

%>

<jsp:useBean id="dao" class="naver.MemberDAO" />

<c:if test="${pageContext.request.method == 'POST'}">
	<jsp:useBean id="dto" class="naver.MemberDTO" />
	<jsp:setProperty property="*" name="dto" />
	<c:set var="memberData" value="${dao.searchMember(dto) }"/>

	<c:choose>
		<c:when test="${memberData!=null }">
		
			<h1>비밀번호 재설정</h1>
			<div class="main">
				<form method="POST">
					<p><input type="hidden" name="id" value="${dto.id}"></p>
					<p>비밀번호 : <input type="password" name="pw" placeholder="비밀번호"></p>
					<p>비밀번호 재확인 : <input type="password" name="repw" placeholder="비밀번호 재확인"></p>
					<p><input type="submit" value="확인"></p>
				</form>
			</div>
			
			<c:if test="${not empty param.pw and not empty param.repw and param.pw eq param.repw }">
				<%
	
					String id = request.getParameter("id");	// 개별로 파라미터를 받아서
					pageContext.setAttribute("id", id);		// Date를 attribute로 등록
					String pw = request.getParameter("pw");		// Date를 attribute로 등록
					pageContext.setAttribute("pw", pw);		// Date를 attribute로 등록
				%>
			
				<jsp:useBean id="dto2" class="naver.MemberDTO" />
				<jsp:setProperty name="dto2" property="id" value="${id }" />
				<jsp:setProperty name="dto2" property="pw" value="${pw }"  />
				
				<c:if test="${dao.modify(dto2)==1 }">
					<c:redirect url="index.jsp" />
				</c:if>
				<c:if test="${dao.modify(dto2)!=1 }">
					<script>
						alert('비밀번호가 다릅니다')
						location.go(-1)
					</script>
				</c:if>
			</c:if>
	
		</c:when>
		<c:otherwise>
			<script>
				history.go(-1)
			</script>
		</c:otherwise>
		
	</c:choose>
	
</c:if>
	
	




</body>
</html>
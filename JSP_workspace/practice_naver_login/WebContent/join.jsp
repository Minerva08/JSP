<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="main">
	<form method="POST">
		<p>이름 : <input type="text" name="name" placeholder="이름" autofocus required></p>
		<p>아이디 : <input type="text" name="id" placeholder="아이디" required></p>
		<p>비밀번호 : <input type="password" name="pw" placeholder="비밀번호" required></p>
		<p>비밀번호 확인 : <input type="password" name="repw" placeholder="비밀번호 확인" required></p>
		<P>이메일 : <input type="email" name="email" placeholder="이메일" required></P>		
		<p>생년월일 : <input name="brithDate" type="date" required 
				  value="<fmt:formatDate value="<%= new Date()%>" pattern="yyyy-MM-dd" />"></p>
		<p>성별 : <input type="radio" name="gender" value="여성">여성
				<input type="radio" name="gender" value="남성">남성</p>
				
		<p><input type="submit" value="가입하기"></p>
	</form>
</div>



<c:if test="${pageContext.request.method == 'POST'}">

	<%
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String brithDate = request.getParameter("brithDate");
		Date brith = sdf.parse(brithDate);
		pageContext.setAttribute("brith", brith);
	
	%>
	<jsp:useBean id="dto" class="naver.MemberDTO" />
	<jsp:setProperty property="*" name="dto" />
	<jsp:setProperty property="brith" name="dto" value="${brith }" />
	
	<c:if test="${param.pw ne param.repw }">
		<script>
			alert('비밀번호 불일치')							
			history.go(-1)
		</script>
	</c:if>
	
	<c:if test="${dao.durationId(param.id) == 'true' }">
			<script>
				alert('아이디 중복')
				history.go(-1)
			</script>
	</c:if>
	
	
	<c:choose>
		<c:when test="${dao.insert(dto) == 1 }">
			<script>
				alert('가입 성공')
			</script>
			<c:redirect url="success.jsp" />

		</c:when>
		
		<c:otherwise>									<%--반환값이 1이 아니면 --%>
			<script>									<%--자바스크립트로--%>
				alert('추가 실패')							<%--팝업으로 경고를 띄우고--%>
				history.go(-1)							<%--이전 페이지로 이동 (입력값 남아있음) --%>
			</script>
		</c:otherwise>	
	</c:choose>


</c:if>



</body>
</html>
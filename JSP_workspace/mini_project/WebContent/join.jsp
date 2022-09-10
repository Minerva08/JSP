<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<h1>회원가입</h1>
<hr>
<div style="display: flex; width: 100%">
	<div style="width: 300px">
		<form action="join_pro.jsp" method="POST">
			<p>
				<input type="text" name="user_id" placeholder="아이디" required
					autofocus>
			</p>
			<p>
				<input type="password" name="user_pw" placeholder="비밀번호" required
					autofocus>
			</p>
			<p>
				<input type="text" name="name" placeholder="이름" required autofocus>
			</p>
			<p class="birth">
				<input type="text" name="year_u" placeholder="년도"> <input
					type="text" name="month_u" placeholder="월"> <input
					type="text" name="day_u" placeholder="일">
			</p>
			<p>
				<input type="text" name="email" placeholder="itbank@itbank.com"
					required autofocus>
			</p>
			<p>
				<input type="submit" value="등록">
			</p>
		</form>
	</div>
</div>

<%@ include file="footer.jsp"%>
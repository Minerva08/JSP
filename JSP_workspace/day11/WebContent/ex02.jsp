<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp - 색상 테마 쿠키로 유지하기</title>
<style>
	.root marquee {
		width: 500px;
		height: 400px;
		border: 3px solid black;
		padding: 20px;
		margin: 20px auto;
		box-sizing: border-box;
		font-weight: bold;
		user-select: none;
	}
	.brownTheme {
		background-color: antiquewhite;
		color: chocolate;
		font-family: '궁서';
		font-weight: normal;
	}
	.blackAndWhiteTheme {
		background-color: black;
		color: white;
		font-family: '나눔스퀘어';
	}
	.puttyTheme {
		background-color: rgb(64, 64, 64);
		color: rgb(0, 255, 0);
		font-family: 'Consolas';
	}
</style>
</head>
<body>

<%
	String theme = request.getParameter("theme"); 	// 파라미터가 없을 수도 있다
	if(theme != null) {
		Cookie c = new Cookie("theme", theme);
		c.setMaxAge(60 * 1);	//쿠키 1분간 유효
		response.addCookie(c);	// 쿠키를 보내고 나면, 이후 클라이언트의 재 방문시 쿠키를 지참하여 가져온다
								// 재방문(새로고침)을 유도해야 쿠키가 곧바로 적용된다
		response.sendRedirect("ex02.jsp");
	}
%>

<h1>색상 테마 유지 (쿠키)</h1>
<hr>
<form method="POST">
	<select name="theme">
		<option ${cookie.theme.value == 'brownTheme' ? 'selected' : '' }>brownTheme</option>
		<option ${cookie.theme.value == 'blackAndWhiteTheme' ? 'selected' : '' }>blackAndWhiteTheme</option>
		<option ${cookie.theme.value == 'puttyTheme' ? 'selected' : '' }>puttyTheme</option>
	</select>
	<input type="submit" value="테마 변경">
</form>

<%--
		C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default
 --%>

<div class="root">
	<h3>윤종신 - 좋니</h3>
	
	<marquee class="${cookie.theme.value }" direction="up" scrollamount="2">
		<p>이제 괜찮니 너무 힘들었잖아</p>
		<p>우리 그 마무리가 고작 이별뿐인 건데</p>
		<p>우린 참 어려웠어</p>
		<p>잘 지낸다고 전해 들었어 가끔</p>
		<p>벌써 참 좋은 사람</p>
		<p>만나 잘 지내고 있어</p>
		<p>굳이 내게 전하더라</p>
		<p>잘했어 넌 못 참았을 거야</p>
		<p>그 허전함을 견뎌 내기엔</p>
		<p>좋으니 사랑해서</p>
		<p>사랑을 시작할 때</p>
		<p>니가 얼마나 예쁜지 모르지</p>
		<p>그 모습을 아직도 못 잊어</p>
		<p>헤어 나오지 못해</p>
		<p>니 소식 들린 날은 더</p>
		<p>좋으니 그 사람</p>
		<p>솔직히 견디기 버거워</p>
		<p>네가 조금 더 힘들면 좋겠어</p>
		<p>진짜 조금 내 십 분의 일만이라도</p>
		<p>아프다 행복해줘</p>
		<p>억울한가 봐 나만</p>
		<p>힘든 것 같아</p>
		<p>나만 무너진 건가</p>
		<p>고작 사랑 한번 따위</p>
		<p>나만 유난 떠는 건지</p>
		<p>복잡해 분명 행복 바랬어</p>
		<p>이렇게 빨리 보고 싶을 줄</p>
		<p>좋으니 사랑해서</p>
		<p>사랑을 시작할 때</p>
		<p>니가 얼마나 예쁜지 모르지</p>
		<p>그 모습을 아직도 못 잊어</p>
		<p>헤어 나오지 못해</p>
		<p>니 소식 들린 날은 더</p>
		<p>혹시 잠시라도 내가 떠오르면</p>
		<p>걘 잘 지내 물어 봐줘</p>
		<p>잘 지내라고 답할 걸 모두 다</p>
		<p>내가 잘 사는 줄 다 아니까</p>
		<p>그 알량한 자존심 때문에</p>
		<p>너무 잘 사는 척</p>
		<p>후련한 척 살아가</p>
		<p>좋아 정말 좋으니</p>
		<p>딱 잊기 좋은 추억 정도니</p>
		<p>난 딱 알맞게 사랑하지 못한</p>
		<p>뒤끝 있는 너의 예전 남자친구일 뿐</p>
		<p>스쳤던 그저 그런 사랑</p>
		<p>뒤끝 있는 너의 예전 남자친구일 뿐</p>
		<p>스쳤던 그저 그런 사랑</p>
	</marquee>
</div>

</body>
</html>
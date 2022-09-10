<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04</title>
</head>
<body>

	<h1>redirect와 forward</h1>
	<hr>
	<ul>
		<li>
			<b>redirect : 서버가 클라이언트에게 새로운 주소를 알려주고, 클라이언트가 전달받은 주소로 새로운 요청을 시도</b>
			<ol>
				<li>서버 내 페이지는 물론, 서버 외부의 다른 주소도 요청 가능</li>
				<li>클라이언트가 새로운 요청을 시도하므로, 주소창이 변경됨</li>
			</ol>
		</li>
		<br>
		<li>
			forward : 서버가 가지고 있는 다른 문서로 응답을 바꿔치기함
			<ol>
				<li>요청을 분석하여 다른 응답이 필요한 경우, 서버가 가진 문서중 하나로 응답을 변경</li>
				<li>클라이언트가 A를 요청한 경우, 서버가 임의로 B를 응답으로 보내주기 때문에 주소창은 A가 떠있음</li>
				<li>페이지를 변경해도 request가 유지되므로, 파라미터를 다른페이지에서도 참조할 수 있다</li>
			</ol>
		</li>
	</ul>
	
	<fieldset>
		<legend><b>redirect	</b></legend>
		<form method="POST">
			<input name="redirectURL" placeholder="이동할 주소를 입력" size="50">
			<input type="submit">
		</form>
	</fieldset>
	
	<fieldset>
		<legend><b>forward</b></legend>
		<form method="POST">
			<input name="forwardURI" placeholder="이동할 주소를 입력" size="50">
			<input type="submit">
		</form>
	</fieldset>
	
	<%
		String redirectURL = request.getParameter("redirectURL");
		String forwardURI = request.getParameter("forwardURI");
		
		if(redirectURL != null) {
			response.sendRedirect(redirectURL);
		}
		if(forwardURI != null) {
			request.setCharacterEncoding("UTF-8");
			
			// 이동하고 싶은 주소를 전달하면서 요청을 지속적으로 따라갈 수 있는 객체를 받는다
			RequestDispatcher rd = request.getRequestDispatcher(forwardURI);
			
			// 여기서 요청받은 request를 이동한 페이지에서도 그대로 사용할 수 있도록 request를 같이 전달한다
			rd.forward(request, response);
		}
	%>

</body>
</html>
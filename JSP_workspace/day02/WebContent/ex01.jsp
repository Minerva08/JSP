<%@page import="day02.Ex01DTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Set"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01 - 다수의 파라미터 처리하기</title>
</head>
<body>

	<h1>다수의 파라미터 처리하기</h1>
	<hr>
	
	<form>
		<p><input type="text" name="name" placeholder="이름"></p>
		<p><input type="text" name="age" placeholder="나이"></p>
		<p><input type="text" name="address" placeholder="주소"></p>
		<p><input type="number" name="birth" placeholder="생년월일" min="10000" max="999999" ></p>
		<p>
			<select name="gender">
				<option value="">===성별===</option>
				<option value="남성">남성</option>
				<option value="여성">여성</option>
				<option value="none">선택안함</option>
			</select>
		</p>
		<input type="submit">
	</form>
	
	<fieldset>
		<legend>request.getParameterMap()</legend>
	<%
		// test.jsp?name=이지은&name=홍진호&name=나단비
		// String[] param = {"이지은", "홍진호", "나단비"};
	
		// 다수의 파라미터를 컬렉션 중 Map의 형태로 묶어서 가져올 수 있다 
		Map<String, String[]> map = request.getParameterMap();
		
		// map 에서 key만 묶어서 Set 형태로 가져온다
		Set<String> keySet = map.keySet();
		
		for(String key : keySet) {
			String value = map.get(key)[0];	// 자료형만 배열일 뿐, 값은 하나밖에 없어서 arr[0] 로 받으면 된다
			out.println(key + " : " + value + "<br>");
		}
	%>
	</fieldset>
	
	<fieldset>
		<legend>request.getParameterNames()</legend>
	<%
		Enumeration<String> enu = request.getParameterNames();
		
		while(enu.hasMoreElements()) {			// 아직 처리하지 않은 다음 요소가 존재한다면 (true/false)
			String name = enu.nextElement();	// 그 요소를 하나 가져와서 (파라미터 이름)
			String param = request.getParameter(name); 	// 파라미터 값을 불러오고
			out.println(name + " : " + param + "<br>");	// 이름과 값을 각각 출력
		}
	%>
	
	</fieldset>
	
	<fieldset>
		<legend>DTO클래스를 이용하여 직접 입력받기</legend>
	<%
		Ex01DTO dto = new Ex01DTO();
		dto.setAddress(request.getParameter("address"));
		dto.setAge(request.getParameter("age"));
		dto.setBirth(request.getParameter("birth"));
		dto.setGender(request.getParameter("gender"));
		dto.setName(request.getParameter("name"));
	%>
	name : <%=dto.getName() %><br>
	age : <%=dto.getAge() %><br>
	address : <%=dto.getAddress() %><br>
	birth : <%=dto.getBirth() %><br>
	gender : <%=dto.getGender() %><br>
	</fieldset>
	
	<fieldset>
		<legend>jsp:setProperty(액션태그)</legend>
		<%--객체 생성 (기본생성자) --%>
		<jsp:useBean id="dto2" class="day02.Ex01DTO" />
		
		<%--클래스가 가지는 setter와 input의 name이 일치한다면 파라미터를 받아서 객체에 대입 --%>			
		<jsp:setProperty property="*" name="dto2" />	
		
		name : <%=dto2.getName() %><br>
		age : <%=dto2.getAge() %><br>
		address : <%=dto2.getAddress() %><br>
		birth : <%=dto2.getBirth() %><br>
		gender : <jsp:getProperty name="dto2" property="gender" /><br>
		<%--문법이 있지만 출력시에는 getProperty를 잘 사용하지 않는다 --%>
	</fieldset>

</body>
</html>






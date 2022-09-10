<%@ page import="java.util.Random"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!	// declaration, 선언부, JSP가 클래스로 변환될때 멤버 필드와 멤버 메서드를 선언 및 정의하는 부분

	private String[] arr = {"김주현", "신은욱", "김재령", "홍서현"};
	private ArrayList<String> al = new ArrayList<String>(Arrays.asList(arr));	//Arrays.asList() - 배열을 리스트로 변환
	
	// 멤버필드이므로, 접근 제한자 적용 가능
	
	public String getRandomName() {
		Random ran = new Random();
		int index = ran.nextInt(al.size());//list의 길이는  .size()
		return al.get(index);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02 - jsp 기본문법 활용</title>
</head>
<body>

<h1>JSP 기본 문법 활용</h1>
<hr>
<%
	// scriptlet, 메인함수에 코드를 작성한다는 느낌으로 사용
	String name = getRandomName();
	
	System.out.println("문서에 반영할 이름 : " + name);	// 콘솔창에 출력
	out.println(name + "님 당첨 !!");
%>
<h2>당첨자 : <%=name %></h2>

</body>
</html>
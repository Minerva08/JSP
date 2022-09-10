<%@page import="day03_naver.NaverMemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	// 중복여부를 판단하여 boolean 으로 반환하는 함수
	public boolean isDuplicate(NaverMemberDTO join, ArrayList<NaverMemberDTO> list) {
		String userid = join.getUserid();
		for(int i = 0; list != null && i < list.size(); i++) {
			if(list.get(i).getUserid().equals(userid)) {
				return true;
			}
		}
		return false;
	}
%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="join" class="day03_naver.NaverMemberDTO" />
<jsp:setProperty property="*" name="join" />
<%
	ArrayList<NaverMemberDTO> list = (ArrayList<NaverMemberDTO>)application.getAttribute("list");
	// 리스트가 없으면 list 변수의 값은 null이다
	System.out.println(list);
	
	if(list == null) {
		list = new ArrayList<NaverMemberDTO>();
		System.out.println(list);
	}

	String redirectURI = "login.jsp";
	if(isDuplicate(join, list) == false) {	// 중복이 아니면
		list.add(join);						// 리스트에 추가
	}
	else {	// 중복이면
			// 회원 가입 페이지로 이동
		redirectURI = "join.jsp";
	}
	
	application.setAttribute("list", list);
	System.out.println(list);	// list는 컬렉션이므로 toString이 오버라이딩 되어 있다
								// 내부에 들어가는 NaverMemberDTO만 toString을 오버라이딩하면 편하게 출력 가능
								
	response.sendRedirect(redirectURI);
%>
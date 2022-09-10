<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
<ul>
	<li>Member 테이블을 활용하여, 회원가입, 로그인, 회원탈퇴, (회원상세정보) 구현하세요</li>
	<li>로그인 폼에는 두개의 체크박스가 있고, 각각 ID저장, 자동 로그인 기능입니다</li>
	<li>ID저장은 쿠키로 구현하고, 자동 로그인은 세션쿠키로 구현합니다</li>
	<li>회원 가입 및 회원 탈퇴를 구현, 탈퇴는 로그인 이후에만 접근이 가능합니다</li>
	<li>DAO에 공통으로 호출하는 close(), selectMapping() 등의 함수를 자유롭게 정의할 수 있습니다</li>
	<li>EL, JSTL을 적극적으로 활용합니다</li>
	<li>스크립틀릿은 쿠키 생성에 대해서 허용합니다. 다만, view 페이지와 처리 페이지를 분리하여 작성해주세요</li>
	<li>로그인 된 이후는 로그인 유저의 정보를 확인할 수 있어야 합니다</li>
	<li>시맨틱 태그 (header, nav, main, aside, footer 등)을 최대한 활용하세요</li>
	<li>기본적인 배치 관련된 css를 사용하세요</li>
</ul>
</main>

</body>
</html>
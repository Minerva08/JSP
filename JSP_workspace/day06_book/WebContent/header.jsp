<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="day06_book.BookDTO, java.util.ArrayList, java.util.Arrays"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%!
	BookDTO[] arr = {	// 데이터를 배열로 준비하고
		new BookDTO("트렌드 코리아 2022", "김난도", "미래의창", "TIGER OR CAT...", "2021-10-06", 16200),
		new BookDTO("작은 별이지만 빛나고 있어", "소윤", "북로망스", "하늘 위 수억 개의 별들 중 너라는 별은...", "2021-03-24", 13500),
		new BookDTO("오케팅", "오두환", "대한출판사", "특별하지 않아도 누구나 부자가 될 수 있다", "2021-07-01", 11700),
		new BookDTO("단 1줄로 사로잡는 전달의 법칙", "모토하시 아도", "밀리언서재", "익숙하고 간단하지만 점점 빨려들어가는 전달력", "2021-10-15", 12600),
		new BookDTO("소크라테스 익스프레스", "에릭 와이너", "어크로스", "인생에서 길을 잃는 수많은 순간마다...", "2021-04-28", 16200),
	};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/css/style.css">
<link type="text/css" rel="stylesheet" href="<c:url value="/css/style.css" />">
<title>BOOK</title>
</head>
<body>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<c:if test="${empty applicationScope.list }">
	<c:set var="list" value="<%=new ArrayList<BookDTO>(Arrays.asList(arr)) %>" scope="application" />
</c:if>

<header>
	<div id="logo">
		<h1><a href="${cpath }">도서 베스트 셀러 - 교보문고</a></h1>
	</div>
	<nav>
		<ul>
			<li><a href="list.jsp">목록</a></li>
			<li><a href="regist.jsp">등록</a></li>
			<li><a href="search.jsp">검색</a></li>
			<li><a href="modify.jsp">수정</a></li>
			<li><a href="delete.jsp">삭제</a></li>
		</ul>
	</nav>
</header>
<hr>

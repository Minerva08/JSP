<%@page import="day04_book.BookDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--css파일은 tomcat 서버 입장에서 컴파일 대상이 아니므로, 내용이 바뀌어도 새로고침이 자동으로 수행되지 않는다 --%>
<style>
	a {
		text-decoration: none;
		color: inherit;
		display: block;
		width: 100%;
		text-align: center;
	}
	nav {
		width: 100%;
		display: flex;
		justify-content: center;
	}
	nav > ul {
		display: flex;
		padding: 0;
		list-style: none;
	}
	nav > ul > li {
		width: 100px;
		height: 30px;
		border: 1px solid black;
		box-sizing: border-box;
	}
	
	.bookList div {
		box-sizing: border-box;
		margin: 0;
	}
	
	.item,
	.columns {
		display: flex
	}
	.item > div,
	.columns > div {
		padding: 5px 10px;
	}
	.idx, .name, .author, .publishDate, .publisher, .price, .comment {
		box-sizing: border-box;
		border: 1px solid black;
	}
	.idx {
		width: 100px;
	}
	.name {
		width: 500px;
	}
	.author, .publishDate, .publisher, .price {
		width: 220px;
	}
	.comment {
		width: 100%;
	}
	table {
		border-collapse: collapse;	/* 칸과 칸 사이의 간격을 없앤다 */
		border: 2px solid black;
	}
	td, th {
		padding: 7px;
		border: 1px solid black;
	}
	textarea {
		resize: none;
	}
</style>
</head>
<body>

	<%
		ArrayList<BookDTO> list = (ArrayList<BookDTO>)application.getAttribute("list");
	
		if(list == null) {	// application에 list가 저장되어 있지 않다면
			BookDTO[] arr = {	// 데이터를 배열로 준비하고
				new BookDTO("트렌드 코리아 2022", "김난도", "미래의창", "TIGER OR CAT...", "2021-10-06", 16200),
				new BookDTO("작은 별이지만 빛나고 있어", "소윤", "북로망스", "하늘 위 수억 개의 별들 중 너라는 별은...", "2021-03-24", 13500),
				new BookDTO("오케팅", "오두환", "대한출판사", "특별하지 않아도 누구나 부자가 될 수 있다", "2021-07-01", 11700),
				new BookDTO("단 1줄로 사로잡는 전달의 법칙", "모토하시 아도", "밀리언서재", "익숙하고 간단하지만 점점 빨려들어가는 전달력", "2021-10-15", 12600),
				new BookDTO("소크라테스 익스프레스", "에릭 와이너", "어크로스", "인생에서 길을 잃는 수많은 순간마다...", "2021-04-28", 16200),
			};
			// 배열을 리스트로 변환하고
			list = new ArrayList<BookDTO>(Arrays.asList(arr));
			
			// 리스트를 application에 저장한다
			application.setAttribute("list", list);
		}
		
	%>

	<header>
		<div id="logo">
			<h1><a href="${pageContext.request.contextPath }">도서 베스트 셀러 - 교보문고</a></h1>
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
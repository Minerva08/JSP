<%@page import="java.util.Arrays"%>
<%@page import="day04_book.BookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
		if(list == null){
			BookDTO[] arr={
					new BookDTO("트렌드 코리아 2022", "김난도", "미래의창", "TIGER OR CAT...", "2021-10-06", 16200)
			};
			
			list = new ArrayList<BookDTO>(Arrays.asList(arr));
			
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

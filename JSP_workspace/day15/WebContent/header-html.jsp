<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비회원 게시판</title>
<style>
	body {
		width: 100%;
		overflow-x: hidden;
		margin: 0;
		padding: 0;
	}
	div {
		margin: 0;
		padding: 0;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	nav > ul {
		padding: 0;
		list-style: none;
		width: 100%;
		display: flex;
		justify-content: center;
	}
	nav > ul > li {
		width: 120px;
		height: 40px;
		line-height: 40px;
		margin: 10px;
		border: 1px solid black;
	}
	nav > ul > li > a {
		display: block;
		cursor: pointer;
		width: 100%;
		text-align: center;
	}
	nav > ul > li > a:hover,
	table > tbody a:hover {
		text-decoration: underline;
	}
	#info {
		display: flex;
		justify-content: flex-end;
		padding: 10px;
		box-sizing: border-box;
		height: 40px;
	}
	.flex {
		display: flex;
	}
	.jc {
		justify-content: center;
	}
	.ai {
		align-items: center;
	}
	.sb {
		justify-content: space-between;
	}
	.boardList {
		border-collapse: collapse;
		width: 800px;
		margin-top: 20px;
	}
	table.boardList > thead > tr {
		background-color: black;
		color: white;
	}
	table.boardList > tbody > tr {
		border-bottom: 1px solid black;
	}
	table.boardList > tbody > tr:hover {
		background-color: #ccc;
	}
	table.boardList > tbody > tr a {
		display: block;
		width: 100%;
	}
	table.boardList > tbody > tr > td:nth-child(2) {
		width: 400px;
		height: 30px;
	}
	header {
		border-bottom: 2px solid black;
		padding: 0;
		margin: 0;	
	}
	main {
		width: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-flow: column;
	}
	.info {
		display: flex;
		justify-content: flex-end;
		padding-right: 20px;
	}
	table.view tr:hover {
		background: initial !important;
	}
	table.view pre {
		box-sizing: border-box;
		width: 750px;
		min-height: 400px;	/* 최소 높이는 400px 이며, 내용의 크기가 크다면 더 늘어날 수 있다*/
		margin: auto;
		padding: 10px;
	}
	table.view > tr:nth-child(2) > td {
		height: 50px;
	}
	.w800 {
		width: 800px;
		margin-top: 20px;
	}
	table.view input,
	table.view textarea {
		padding: 10px;
		border: 0;
/* 		border-bottom: 2px solid black; */
		width: 800px;
		box-sizing: border-box;
		margin: 5px;
	}
	table.view textarea {
		resize: none;
		height: 400px;
	}
</style>
</head>
<body>
<c:set var="loginURL" value="${empty login ? 'login.jsp' : 'logout.jsp'}" />
<c:set var="loginTitle" value="${empty login ? '로그인' : '로그아웃'}" />
<header>
	<div id="logo">
		<h1><a href="${cpath }">게시판 - day15</a></h1>
	</div>
	<nav>
		<ul>
			<li><a href="${cpath }/member/${loginURL }"> ${loginTitle } </a></li>
			<li><a href="${cpath }/board/board.jsp"> 게시판 </a></li>
		</ul>
	</nav>
	<div id="info">
		<c:if test="${not empty login }">
			${login.userid } (${login.username })
		</c:if>
	</div>
</header>
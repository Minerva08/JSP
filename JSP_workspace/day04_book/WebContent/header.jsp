<%@page import="book.BookDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body{
            color:balck;
        }
        a{	
            color:inherit;
            text-decoration:none;
            font-size:16px;
            width:100%;
        }
        h1 > a{
            width: 100%;
            text-align: center;
        }
        h1{
            margin: 0 
            
        }
        nav > ul{
            display:flex;
            list-style:none;
            width:500px;
            padding:0;
            margin:10px auto;
            
        }
    
        nav>ul>li{
            width:100%;
            border:1px solid black;
            height : 40px;
            text-align:center;
            padding:0;
            box-sizing:border-box;
            
        }
        nav>ul >li >a{
            display: block;
            height: inherit;
            padding-top: 7%;
        }
    </style>
</head>
<body>
	<%
		ArrayList<BookDTO> list = (ArrayList<BookDTO>)application.getAttribute("list");
	
		if(list == null){
			BookDTO[] arr = {
				new BookDTO("걸 인 더 다크","애나 린지","홍익출판미디어그룹","21.07.12","“누가 내 얼굴에 용접기를 대고 있는 느낌이에요.”",15000)
			};
			
			list = new ArrayList<BookDTO>(Arrays.asList(arr));
			
			application.setAttribute("list", list);
		}
		
		
	%>
	<header>
		<h1><a href="https://book.naver.com/">NAVER</a></h1>
	
		<nav>
			<ul>
				<li><a href="insert.jsp">등록</a></li>
				<li><a href="list.jsp">목록</a></li>
				<li><a href="search.jsp">검색</a></li>
				<li><a href="modify.jsp">수정</a></li>
				<li><a href="delete.jsp">삭제</a></li>
			</ul>
		</nav>
	</header>

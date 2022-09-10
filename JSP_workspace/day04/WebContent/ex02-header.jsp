<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow-x: hidden;
            width: 100%;
        }
        a {
            color: inherit;
            text-decoration: none;
            display: block;
            /* 링크가 박스 전체에 걸리도록 */
        }
        nav {
            width: 100%;
            display: flex;
            justify-content: center;
        }
        nav > ul {
            list-style: none;
            padding: 0;
            display: flex;
            align-items: flex-end;
            width: 970px;
            height: 40px;
            background-color: #00b2cf;
        }
        nav > ul > li {
            border: 1px solid black;
            width: 110px;
            box-sizing: border-box;
            text-align: center;
            height: 37px;
            line-height: 37px;
            background-color: #061c25;
        }
        nav > ul > li:hover {
            border-bottom: 3px solid #00b2cf;
        }
        nav > ul > li:hover > a {
            color: #00b2cf;
        }
        nav > ul > li > a {
            color: white;
            font-size: 12px;
            font-weight: bold;
        }

        /* 여기서부터 서브메뉴에 대한 style */

        ul.submenu {
            border: 1px solid #2b9cb9;
            background-color: #123643;
            list-style: none;
            padding: 10px 5px;
            padding-top: 0;
            margin: 0;

            position: absolute;
            /* 주변요소에 상관없이 독자적인 위치를 가지게 한다 */
            /* 상위 요소가 너비의 제한을 가져도 독자적인 크기를 가지게 된다 */

            display: none;                  /* 자리 차지가 없음 */
            /* visibility: hidden; */       /* 보이지만 않을뿐 자리차지가 있다 */
            /* 서브메뉴는 요소는 만들어져 있으나 평소에 나타나지 않고, 자리차지도 없다 */
        }
        nav > ul > li:hover > .submenu {
            display: block;
            /* visibility: visible; */
            /* 평소에는 숨어있던 서브메뉴가, 상위 li 요소에 마우스를 올리면 나타난다 */
        }
        .submenu > li {
            height: 26px;
            padding: 0 5px;
            text-align: left;
        }
        .submenu a {
            height: inherit;
            color: white;
            text-decoration: none;
            font-size: 12px;
        }
        .submenu a:hover {
            text-decoration: underline;
        }
        .component {
        	width: 970px;
        	margin: 0 auto;
        }
    </style>
</head>
<body>
    
    <nav>
        <ul>
            <li><a href="ex01-home.jsp">홈</a></li>
            <li>
                <a href="ex01-record.jsp">기록실</a>
                <ul class="submenu">
                    <li><a href="">LoL 기록실 - 경기기록</a></li>
                    <li><a href="">LoL 기록실 - 선수기록</a></li>
                    <li><a href="">LoL 기록실 - 팀 통산</a></li>
                    <li><a href="">LoL 기록실 - 선수 통산</a></li>
                    <li><a href="">LoL 기록실 - 챔피언 픽/밴</a></li>
                    <li><a href="">LoL 기록실 - 래더 랭킹</a></li>
                    <li><a href="">LoL 프로팀 정보</a></li>
                </ul>
            </li>
            <li><a href="ex01-lckinven.jsp">LCK 인벤</a></li>
            <li>
                <a href="">챔피언</a>
                <ul class="submenu">
                    <li><a href="">LoL 챔피언 정보</a></li>
                    <li><a href="">챔피언 능력치 랭킹</a></li>
                    <li><a href="">실시간 챔피언 평가</a></li>
                </ul>
            </li>
            <li><a href="">카운터픽</a></li>
            <li><a href="">공략</a></li>
            <li><a href="">스킨갤러리</a></li>
            <li><a href="">방송/영상</a></li>
            <li><a href="">LoL DB</a></li>
        </ul>
    </nav>
<%
	String name = "이지은";
%>

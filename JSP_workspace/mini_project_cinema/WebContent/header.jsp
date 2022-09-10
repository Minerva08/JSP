<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cinemaMember.*, ticketing.*"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.comm.CodeAPIServiceImplService"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.comm.CodeResultVO"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.boxoffice.BoxOfficeAPIServiceImplService"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.boxoffice.DailyBoxOfficeResult"%>
<%@page import="java.util.List"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="Tdao" value="<%=TicketingDAO.getInstance() %>"></c:set>
<c:set var="Mdao" value="<%=CinemaMemberDAO.getInstance() %>"></c:set>
<% request.setCharacterEncoding("UTF-8"); %>
<!--
------------------------------------------------------------
* @설명 : 일별 박스오피스 SOAP 방식 예제
------------------------------------------------------------
-->
    <%
    Calendar cal = Calendar.getInstance();
    String format = "yyyyMMdd";
    SimpleDateFormat sdf = new SimpleDateFormat(format);
    cal.add(cal.DATE, -1); //날짜를 하루 뺀다.
    String date = sdf.format(cal.getTime());
    
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
    String today = sdf2.format(new Date());
 
   String targetDt = request.getParameter("targetDt")==null? date:request.getParameter("targetDt");         //조회일자
   String itemPerPage = request.getParameter("itemPerPage")==null?"50":request.getParameter("itemPerPage");      //결과row수
   String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");      //“Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
   String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");         //“K: : 한국영화 “F” : 외국영화 (default : 전체)
   String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");            //“0105000000” 로서 조회된 지역코드

   // 발급키
   String key = "8e795ce69dbf7417bdac4b5d5a88298a";
   // KOBIS 오픈 API SOAP Client를 통해 호출
   DailyBoxOfficeResult dailyBoxOfficeResult = new BoxOfficeAPIServiceImplService().getBoxOfficeAPIServiceImplPort().searchDailyBoxOfficeList(key,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd);
   
   request.setAttribute("dailyResult",dailyBoxOfficeResult);

   // KOBIS 오픈 API SOAP Client를 통해 코드 서비스 호출
   List<CodeResultVO>  codeList = new CodeAPIServiceImplService().getCodeAPIServiceImplPort().searchCodeList(key,"0105000000");
   request.setAttribute("codeList",codeList);
    %>

<html>
<head>
<link href="css/header.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>예매 - 롯데시네마</title>
<style>
	
</style>
</head>
<body>
	
	<header>
		<div class="top_banner">
			<img src="https://caching2.lottecinema.co.kr/lotte_image/2021/Shop/1112/Shop_98080.jpg">
		</div>
		<div class="header_section">
			<div class="header_component">
				<div class="sns">
					<ul>
						<li>
							<img src="./image/facebook.png"> <a href="">페이스북</a>
						</li>
						<li>
							<img src="./image/youtube.png"> <a href="">유튜브</a>
						</li>
						<li>
							<img src="./image/instagram.png"> <a href="">인스타그램</a>
						</li>
						<li>
							<img src="./image/twiter.png"> <a href="">트위터</a></li>
					</ul>
				</div>
				<div class="logo">
					<h2>
						<a href=""><img src="./image/logo.png"></a>
					</h2>
				</div>
				<div class="member">
					<ul>
						<li><a href="">멤버쉽</a></li>
						<li><a href="">고객센터</a></li>
						<li><a href="">로그인</a></li>
					</ul>
				</div>
			</div>
			<nav>
				<div class="main_nav">
					<ul class="main_nav_list">
						<li><a href="">예매</a>
							<div class="drop">
								<ul>
									<li><a href="">예매하기</a></li>
									<li><a href="">상영시간표</a></li>
									<li><a href="">할인안내</a></li>
								</ul>
							</div>
						</li>
						<li><a href="">영화</a>
							<div class="drop">
								<ul>
									<li><a href="">홈</a></li>
									<li><a href="">현재상영작</a></li>
									<li><a href="">상영예정작</a></li>
									<li><a href="">아르떼</a></li>
									<li><a href="">국립극장</a></li>
								</ul>
							</div>
						</li>
						<li><a href="">영화관</a>
							<div class="drop">
								<ul>
									<li><a href="">스페셜관</a></li>
									<li><a href="">서울</a></li>
									<li><a href="">경기/인천</a></li>
									<li><a href="">충청/대전</a></li>
									<li><a href="">전라/광주</a></li>
									<li><a href="">경북/대구</a></li>
									<li><a href="">경남/부산/울산</a></li>
									<li><a href="">강원</a></li>
									<li><a href="">제주</a></li>
								</ul>
							</div>
						</li>
						<li><a href="">이벤트</a>
							<div class="drop">
								<ul>
									<li><a href="">베스트</a></li>
									<li><a href="">관람권</a></li>
									<li><a href="">스낵음료</a></li>
									<li><a href="">포토카드</a></li>
								</ul>
							</div>
						</li>
						<li><a href="">스토어</a>
							<div class="drop">
								<ul>
									<li><a href="">예매하기</a></li>
									<li><a href="">상영시간표</a></li>
									<li><a href="">할인안내</a></li>
								</ul>
							</div>
						
						
						</li>
					</ul>
				</div>
				<div class="join_nav">
					<ul>
						<li><img src="./image/join.png"> <a href="">회원가입</a></li>
						<li><img src="./image/direct.png"> <a href="">바로 예매</a></li>
						<li><a href="">≡</a></li>
					</ul>
				</div>
			</nav>
		</div>
		<div class="main_section"></div>
	</header>


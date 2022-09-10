<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:set var="receipt_list" value="${Tdao.get_ticket(login.user_id)}"/>
<c:forEach var="receipt" items="${receipt_list }">
	<br>
	<div class="checkTicket_component">
		<div>${receipt.movie_name}</div>
		<div>${receipt.run_date}</div>
		<div>${receipt.start_time}</div>
		<div>${receipt.run_house}관</div>
			
		<div>${receipt.seat1} 
		${receipt.seat2 ne 'undefined' ? receipt.seat2 : ''} 
		${receipt.seat3 ne 'undefined' ? receipt.seat3 : ''} 
		${receipt.seat4 ne 'undefined' ? receipt.seat4 : ''}</div>
		<div>(총${receipt.person_count}명)</div> 
	</div>
	
</c:forEach>


<%@ include file="footer.jsp" %>
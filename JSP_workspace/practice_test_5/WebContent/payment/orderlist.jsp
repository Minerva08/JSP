<%@page import="kiosk.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="productDAO" value="<%=ProductDAO.getInstance() %>" />
<c:set var="list" value="${productDAO.getorderlist()}"/>

<footer>
	<div class="orderList">
		<p>주문내역</p>
			<table border="1" cellpadding="7" cellspacing="0">
			<tr>
				<td>번호</td>
				<td>제품명</td>
				<td>수량</td>
				<td>총액</td>
			</tr>
			<c:forEach var="order" items="${list }"> 
				<tr>
					<td>
						${order.idx }
					</td>
					<td>
						${order.name }
					</td>
					<td>
						${order.amount }
					</td>
					
					<td>
						${order.total_price }
					</td>
					
				</tr>
			</c:forEach>
		
		</table>
		
	</div>
</footer>

</body>
</html>
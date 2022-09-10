<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="list" value="${productDAO.getProducts() }"/>

<main >
	<table border="1" cellpadding="7" cellspacing="0">
		<c:forEach var="dto" items="${list }">
			<tr >
				<td id="menu" data-idx="${dto.idx }">
					<div>${dto.idx }</div>
					<div>${dto.name }</div>
					<div><img src="${cpath }/image/${dto.uploadFileName}" width="150px"></div>
					<div>${dto.price }</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</main>
<script>
	const itemList = document.querySelectorAll('#menu')
	itemList.forEach(th => th.style.cursor = 'pointer')
	itemList.forEach(btn => {
		btn.onclick = function(){
			const idx = btn.dataset.idx
			location.href='${cpath}/order/order-detail.jsp?idx='+idx
		}
	})
</script>
<%@ include file="payment/orderlist.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set  var="menuone" value="${productDAO.selectmenu(param.idx)}"/>

<h4>주문 상세 페이지</h4>
<form method="POST">
	<table border="1" cellpadding="7" cellspacing="0">
		
		
		<tr>
			
			<td>제품명</td>
			<td>${menuone.name }</td>
		</tr>
		
		<tr>
			<td>가격</td>
			<td>${menuone.price }</td>
		</tr>
		
		<tr>
			<td>수량</td>
			<td>
				<select name="amount">
				    <option value="">--수량 선택--</option>
				    <c:forEach var="i" begin="1" end="100">
				    	<option ${param.amount eq i ? 'selected' : '' } value="${i}">${i}</option>
				    </c:forEach>
				</select>
			</td>
		</tr>
		
		
		<tr>
			<td colspan="2">
				<input type="hidden" name="idx" value="${menuone.idx }">
				<input type="hidden" name="name" value="${menuone.name }">
				<input type="hidden" name="price" value="${menuone.price }">
				<input type="submit" value="주문하기">
			</td>
		</tr>
	</table>
</form>


<jsp:useBean id="menudto" class="kiosk.OrderDTO" />
<jsp:setProperty property="*" name="menudto"/>
<jsp:setProperty property="product_idx" name="menudto" value="${menuone.idx }"/>
<c:set var="price" value="${menudto.price }"/>
<c:set var="amount" value="${menudto.amount }"/>
<jsp:setProperty property="total_price" name="menudto" value="${productDAO.calcEach(price,amount)}"/>




<c:if test="${pageContext.request.method == 'POST' }">
	
	<script>
		const row = '${productDAO.ordermenu(menudto)}'
		if(row == 1) {
			alert('주문 성공')
			location.href = '${cpath}'
		}
		
	</script>
</c:if>

</body>
</html>
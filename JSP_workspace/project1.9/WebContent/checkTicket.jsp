<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<c:set var="receipt_list" value="${Tdao.get_ticket(login.user_id)}" />

<div class="checkTicket_section"></div>

<div class="checkTicket_main">
	<div class="left_box">
		<div class="benefits">
			<c:if test="${empty login }">
				<div>비회원</div>
			</c:if>
			<c:if test="${not empty login }">
				<div>회원</div>
			</c:if>
			<div>
				<span>${login.name }님 </span> 반가워요 !
			</div>
			<div>지금 회원 가입 하시고 롯데시네마의 다양한 혜택을 만나 보세요.</div>
			<div>
				<a>
					<c:if test="${empty login }">
						<button>회원가입</button>
					</c:if>
					<c:if test="${not empty login }">
					</c:if>
				</a>
			</div>
		</div>
	</div>
	<div class="right_box">
		<div class="right_component">
			<div class="right_title">
				<span>MY 영화관</span>
			</div>
			<div class="right_boxList">
				<div>
					<span>+</span> <span>1st</span>
				</div>
				<div>
					<span>+</span> <span>2st</span>
				</div>
				<div>
					<span>+</span> <span>2st</span>
				</div>
			</div>
			<div class="right_bottom">
				<c:if test="${empty login }">
					<span>
						회원가입후 이용가능한 서비스입니다
					</span>
				</c:if>
				<c:if test="${not empty login }">
				</c:if>
				
			</div>
		</div>
	</div>
</div>
<div class="checkTicket_title">
	<button>예매내역</button>
</div>

<div class="checkTicket_bottom">
	<div class="current_receipt_title">
		<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>예매 날짜</th>
				<th>상영 시간</th>
				<th>관 번호</th>
				<th>좌석</th>
				<th>인원</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="receipt" items="${receipt_list }">
				<tr>
					<td>${receipt.movie_name}</td>
					<td>${receipt.run_date}</td>
					<td>${receipt.start_time}</td>
					<td>${receipt.run_house}관</td>
					<td>
						${receipt.seat1}
						${receipt.seat2 ne 'undefined' ? receipt.seat2 : ''}
						${receipt.seat3 ne 'undefined' ? receipt.seat3 : ''}
						${receipt.seat4 ne 'undefined' ? receipt.seat4 : ''}
					</td>
					<td>(총${receipt.person_count}명)</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
</div>

<div class=""></div>





















<%@ include file="footer.jsp"%>
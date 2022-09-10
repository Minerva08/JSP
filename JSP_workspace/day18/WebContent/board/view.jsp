<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="dto" value="${boardDAO.selectBoard(param.idx) }" />
<main>
	<table class="boardList view">
		<tr>
			<td>${dto.idx }</td>
			<td>${dto.title }</td>
			<td>${dto.writer }</td>
			<td>${dto.writeDate }</td>
			<td>${dto.ipAddress }</td>
		</tr>
		<tr>
			<td colspan="5">
				<pre>${dto.content }</pre>
			</td>
		</tr>
	</table>
	<div class="flex sb w800">
		<div>
			<a href="${cpath }/board/board.jsp?page=${param.page}"><button>목록</button></a>
		</div>
		<div>
			<a href="${cpath }/board/modify.jsp?idx=${dto.idx }&page=${param.page}"><button>수정</button></a>
			<button id="deleteBtn">삭제</button>
		</div>
	</div>
	
	<div id="replyList" class="replyList w800">
	<form>
		<div>
			<input type="text" name="writer" value="${login.userid }" readonly>
			<input type="submit" value="댓글 작성">
		</div>
		<div>
			<textarea name="content" placeholder="${empty login ? '댓글을 작성하려면 먼저 로그인하세요' : '바르고 고운말을 사용합시다' }"></textarea>
		</div>
	</form>
	<c:forEach var="dto" items="${boardDAO.selectReplyList(param.idx) }">
		<div class="replyItem flex sb">
			<div>
				<div class="flex sb">
					<div class="bold">${dto.writer }</div>
					<div>
						${dto.writeDate }
						<button>수정</button>
						<button class="deleteReplyBtn" data-idx="${dto.idx }" data-writer="${dto.writer }">삭제</button>
					</div>
				</div>
				<div>${dto.content }</div>
			</div>
		</div>
	</c:forEach>
	</div>
	
</main>



<script>
	const deleteBtn = document.getElementById('deleteBtn')
	deleteBtn.onclick = function() {
		const writer = '${dto.writer}'
		const userid = '${login.userid}'
		const idx = '${dto.idx}'
		const url = '${pageContext.request.requestURL}'
		
		if(userid == '') {	// 로그인이 되어 있지 않으면
			location.href = '${cpath}/member/login.jsp?url=' + url + '&idx=' + idx
		}
		else if (userid != writer) {
			alert('본인의 글만 삭제할 수 있습니다 !!')
		}
		else if(confirm(idx + '번 글을 정말 삭제하시겠습니까?')) {
			location.href = '${cpath}/board/delete.jsp?idx=' + idx + '&writer=${dto.writer}'
		}
	}
	
	// 비 로그인 상태에서 댓글 작성란을 클릭하여 포커스를 이동시키면
	const textarea = document.querySelector('.replyList form textarea')
	const writer = document.querySelector('.replyList form input')
	const login = '${login.userid}'
	
	textarea.onfocus = function() {	// 사용자의 입력 초점이 대상 요소에 맞춰지면
		if(login == '') {
			writer.focus()
			if(confirm('댓글을 작성하려면 먼저 로그인 해야합니다\n로그인 페이지로 이동하시겠습니까?')) {
				location.href = '${cpath}/member/login.jsp?url=${pageContext.request.requestURL}&idx=${param.idx}' 
			}
		}
	}
</script>

<script>
	// 댓글을 삭제하는 기능
	const deleteReplyBtnList = document.querySelectorAll('.deleteReplyBtn')
	
	deleteReplyBtnList.forEach(btn => {		// 리스트 내부의 각각의 버튼을 btn이라고 할때
		btn.onclick = function() {			// 각 btn을 클릭하면 실행되는 함수
			
			// 로그인 되어있고 본인인가? 확인 하는 코드가 추가로 필요하다
			const writer = btn.dataset.writer
			if(writer != login) {
				alert('본인의 댓글만 삭제할 수 있습니다')
				return
			}					
					
			const idx = btn.dataset.idx		// 클릭된 버튼의 idx를 불러와서
			//alert('삭제 : ' + idx)			// 팝업창으로 출력한다
			if(confirm('선택한 댓글을 삭제하시겠습니까?')) {
				// 삭제할 댓글의 idx와, 삭제 이후 돌아올 view.jsp 에 전달할 게시글 번호 idx를 전달해야 한다
				location.href = '${cpath}/board/deleteReply.jsp?idx=' + idx
			}
		}
	})
</script>

<jsp:include page="list.jsp" />

<%@ include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<form>
	<select name="type">
		<option ${param.type == 'idx' ? 'selected' : '' }>idx</option>
		<option ${param.type == 'name' ? 'selected' : '' }>name</option>
		<option ${param.type == 'pnum' ? 'selected' : '' }>pnum</option>
	</select>
	<input type="text" name="search" value="${param.search }">
	<input type="submit">
</form>

<%
	String type = request.getParameter("type");
	String search = request.getParameter("search");
	
	PhoneBookDTO dto = null;
	if(type != null) {
		switch(type) {
		case "idx":
			dto = list.get(Integer.parseInt(search));
			break;
		case "name":
			for(PhoneBookDTO pb : list) {
				if(pb.getName().contains(search)) {
					dto = pb;
					break;
				}
			}
			break;
		case "pnum":
			for(PhoneBookDTO pb : list) {
				if(pb.getPnum().contains(search)) {
					dto = pb;
					break;
				}
			}
			break;
		}
	}
	pageContext.setAttribute("dto", dto);
%>
${dto.name } : ${dto.pnum }


</body>
</html>
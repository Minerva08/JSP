<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp - 파일 업로드(2)</title>
</head>
<body>

<h1>현재 프로젝트의 특정 경로에 파일을 업로드 하기</h1>
<hr>

<form method="POST" enctype="multipart/form-data">
	<p><input type="text" name="comment"></p>
	<p><input type="file" name="uploadFile" accept="image/*" multiple></p>
	<p><input type="submit"></p>
</form>
<%
	if(request.getMethod().equals("POST")) {
		String uploadPath = application.getRealPath("./image");	// 현재 서버가 기본위치로 잡고 있는 곳은
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdirs();	// mkdir은 하나만 생성하고, mkdirs는 중간에 경로가 없으면 중간 경로도 만들어준다
		}
		MultipartRequest mpRequest = new MultipartRequest(request, uploadPath, 10485760, "UTF-8");
		
		File f = mpRequest.getFile("uploadFile");
		System.out.println("업로드한 파일 이름 : " + f.getName());		
		System.out.println("업로드할때 작성한 텍스트 : " + mpRequest.getParameter("comment"));		// 값이 뜬다
		System.out.println("request.getParameter : " + request.getParameter("comment"));	// null
		
		// 업로드 이미지를 출력하기 위한 준비
		String cpath = request.getContextPath();
		String fileName = f.getName();
%>
		<h3>업로드 경로 : <%=uploadPath %></h3>
		<img src="<%=cpath + "/" + fileName %>" width="500px">
<%
	}
%>

</body>
</html>







<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp - 파일 업로드</title>
</head>
<body>
<%--
		1) 파일 업로드를 하기위해서는 form 태그를 이용한다
		2) <input type="file"> 이 있다
		3) 파일은 악성코드 첨부를 방지하기 위한 보안 목적상, value를 지정할 수 없도록 되어 있다
		4) 파일은 주소창을 통해서 문자열 형태로 전달할 수 없으므로, POST를 사용해야 한다 (text가 아니고 binary)
		5) 파일은 form-data 방식이 아닌 다른 방식으로 전달해야 한다
		6) jsp 에서 제공하는 기본 request 로는 파일을 처리하기 곤란하다 (HttpServletRequest) -> (MultipartRequest)
		7) 사용자가 전달한 파일은 분명 request에 담겨있긴 하지만, 별도의 클래스를 가져와서 형변환 후에 파일을 골라낼 수 있다
 --%>
 <h1>파일 업로드 (1)</h1>
 <hr>
 
 <form method="POST" enctype="multipart/form-data">
 	<p><input type="file" name="uploadFile"></p>
 	<p><input type="submit" value="제출"></p>
 </form>
 
 <%
 	if(request.getMethod().equals("POST")) {
//  		File f = request.getFile("uploadFile");	// 내장 객체 request 에는 파일 추출 메서드가 없음
		String uploadFile = request.getParameter("uploadFile");
		System.out.println("uploadFile : " + uploadFile + "\n");
		
		// MultipartRequest는 파일을 처리할 수 있는 형태의 request이며 생성자 매개변수에 값을 전달해야 한다
		
		String saveDirectory = "D:\\uploadFolder";
// 		String saveDirectory = "/Users/myname/uploadFolder";	// linux 혹은 macOS 계열
		
		File dir = new File(saveDirectory);	// 문자열을 기반으로 파일(디렉토리) 객체를 생성하고
		if(dir.exists() == false) {			// 실제로 존재하는 요소인가 확인해서 없으면
			dir.mkdirs();					// 디렉토리를 만들어라
		}
		
		int postSize = 10485760;	// 10MB, 1024 * 1024 * 10
		
		MultipartRequest mpRequest = new MultipartRequest(
					request,		// 현재 전달받은 요청 객체	
					saveDirectory,	// 만약 파일이 있다면 어디에 저장할 것인가
					postSize,		// 어느정도 크기의 파일을 허용할 것인가
					"UTF-8"			// 파일 이름이나 내부 텍스트 등은 어떻게 인코딩 처리할 것인가
				);
 	}
 %>
 

</body>
</html>
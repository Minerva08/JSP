<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.oreilly.servlet.MultipartRequest, java.io.File, java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp - 다중 파일 업로드</title>
</head>
<body>

<h1>다중 파일 업로드</h1>
<hr>
<form method="POST" enctype="multipart/form-data">
	<fieldset>
		<p><input type="file" name="uploadFile1" accept="image/*"></p>
	</fieldset>
	<div>
		<p>
			<input type="submit">
			<input id="addInputFileBtn" type="button" value="파일 추가">
		</p>
	</div>
</form>

<script>
	const btn = document.getElementById('addInputFileBtn')
	const fieldset = document.querySelector('form > fieldset')
	let num = 2
	
	btn.onclick = function(event) {
		const p = document.createElement('p')			// document.createElement(tagName)
		const input = document.createElement('input')
		input.type = 'file'								// element.attribute = value
		input.name = 'uploadFile' + num
		input.accept = 'image/*'
		p.appendChild(input)							// A.appendChild(B) : B를 A태그의 자식 요소로 추가한다
		fieldset.appendChild(p)
		num++
	}
</script>

<%
	if(request.getMethod().equals("POST")) {
		String saveDirectory = application.getRealPath("./image");
		File dir = new File(saveDirectory);	// 실제 파일이나 폴더가 만들어지는것은 아니다
		if(dir.exists() == false) {
			dir.mkdirs();
		}
		int postSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		MultipartRequest mpRequest = new MultipartRequest(
					request, saveDirectory, postSize, encoding,
					new DefaultFileRenamePolicy());//파일이름 중복 방지
		// 이 시점에서 파일은 모두 지정한 경로에 업로드가 되어 있다
		
		// 여기서부터 다중 파일을 처리하는 내용
		Enumeration enu = mpRequest.getFileNames();		// Collection 파트의 순환자 및 열거자
		ArrayList<File> list = new ArrayList<File>();	
		
		// Enumeration 내부에는 여러 객체가 순번 없이 존재하고 있는데
		// 확인하지 않은 다음 객체가 있다면 : enu.hasMoreElements()
		// 확인하지 않은 객체 하나를 가져온다 : enu.nextElement() -> 이 객체는 이후 확인처리된걸로 변경됨
		
		while(enu.hasMoreElements()) {
			String name = enu.nextElement().toString();
			System.out.println("name : " + name);
			File f = mpRequest.getFile(name);
			list.add(f);
		}
		out.print("<div style=\"display: flex; flex-flow: wrap; width: 800px;\">");
		for(File f : list) {
			String tag = "<img src=\"%s\" width=\"180px\">";
			tag = String.format(tag, request.getContextPath() + "/image/" + f.getName());
			out.print(tag);
		}
		out.print("</div>");
	}
%>

</body>
</html>
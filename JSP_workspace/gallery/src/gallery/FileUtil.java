package gallery;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	// jsp 내장 객체 request를 전달받으면 내부에서 MultipartRequest로 생성하고
	// 생성된 파일을 DTO에 담아서 반환하는 클래스
	
	private static String encoding = "UTF-8";
	private static int postSize = 1024 * 1024 * 10;
	private static String saveDirectory;
	private static FileRenamePolicy policy = new DefaultFileRenamePolicy();
	private static MultipartRequest mpRequest;
	
	public static GalleryDTO getDTO(HttpServletRequest request) throws IOException {
		GalleryDTO dto = new GalleryDTO();
		System.out.println("getServletContext() : "+request.getServletContext());
		saveDirectory = request.getServletContext().getRealPath("./image");
		System.out.println(saveDirectory);
		
		File dir = new File(saveDirectory);
		if(dir.exists() == false) 	dir.mkdirs();
		
		mpRequest = new MultipartRequest(request, saveDirectory, postSize, encoding, policy);
		// 파일은 이미 업로드 되었다
		
		dto.setMemo(mpRequest.getParameter("memo"));						// 문자열 파라미터와
		dto.setUploadFileName(mpRequest.getFile("uploadFileName").getName());	// 파일이름이 저장된 
		dto.setWriter(mpRequest.getParameter("writer"));
		dto.setUserpw(mpRequest.getParameter("userpw"));
		
		return dto;	// dto를 반환한다
	}
}

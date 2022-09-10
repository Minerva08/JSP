package kiosk;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;


public class FileUtil {
	private static String encoding = "UTF-8";
	private static int postSize = 1024 * 1024 * 10;
	private static String saveDirectory;
	private static FileRenamePolicy policy = new DefaultFileRenamePolicy();
	private static MultipartRequest mpRequest;
	
	public static ProductDTO getDTO(HttpServletRequest request) throws IOException {
		ProductDTO dto = new ProductDTO();
		System.out.println("getServletContext() : "+request.getServletContext());
		saveDirectory = request.getServletContext().getRealPath("./image");
		System.out.println(saveDirectory);
		
		File dir = new File(saveDirectory);
		if(dir.exists() == false) 	dir.mkdirs();
		
		mpRequest = new MultipartRequest(request, saveDirectory, postSize, encoding, policy);
		// 파일은 이미 업로드 되었다
		
		
		dto.setUploadFileName(mpRequest.getFile("uploadFileName").getName());
		dto.setName(mpRequest.getParameter("name"));
		dto.setDescription(mpRequest.getParameter("description"));
		dto.setPrice(mpRequest.getParameter("price"));
		System.out.println(dto);
		return dto;
		
	}
	
}

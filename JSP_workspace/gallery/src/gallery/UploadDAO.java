package gallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import gallery.GalleryDTO;

public class UploadDAO {
	
	private Context init;
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static UploadDAO instance = new UploadDAO();
	
	private UploadDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			System.err.println(getClass().getSimpleName() + " 생성자 예외 발생 : " + e);
		}
	}

	public static UploadDAO getInstance() {
		return instance;
	}

	public int insert(GalleryDTO dto) {
		int row = 0;
		String sql = "insert into gallery1 (memo, uploadFileName, writer,userpw) values (?, ?, ?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemo());
			pstmt.setString(2, dto.getUploadFileName());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getUserpw());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("insert 예외 발생 : " + e);
		} finally {
			try {
				if( pstmt != null ) pstmt.close();
				if( conn != null ) 	conn.close();
			} catch(Exception e) {}
		}
		return row;
	
	}


}

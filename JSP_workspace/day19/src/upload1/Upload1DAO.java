package upload1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Upload1DAO {
	
	private Context init;
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static Upload1DAO instance = new Upload1DAO();
	
	private Upload1DAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			System.err.println(getClass().getSimpleName() + " 생성자 예외 발생 : " + e);
		}
	}

	public static Upload1DAO getInstance() {
		return instance;
	}

	public int insert(Upload1DTO dto) {
		int row = 0;
		String sql = "insert into upload1 (memo, uploadFileName) values (?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMemo());
			pstmt.setString(2, dto.getUploadFileName());
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

	public ArrayList<Upload1DTO> selectList() {
		ArrayList<Upload1DTO> list = new ArrayList<Upload1DTO>();
		String sql = "select * from upload1 order by idx";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Upload1DTO dto = new Upload1DTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setMemo(rs.getString("memo"));
				dto.setUploadFileName(rs.getString("uploadFileName"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null)		rs.close();
				if( pstmt != null ) pstmt.close();
				if( conn != null ) 	conn.close();
			} catch(Exception e) {}
		}
		return list;
	}


}

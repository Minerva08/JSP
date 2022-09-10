package gallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class GalleryDAO {
	private Context init;
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static GalleryDAO instance = new GalleryDAO();
	
	private GalleryDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			System.err.println(getClass().getSimpleName() + " 생성자 예외 발생 : " + e);
		}
	}

	public static GalleryDAO getInstance() {
		return instance;
	}
	
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null) 	conn.close();
		} catch(SQLException e) {}
	}
	
	private GalleryDTO mapping(ResultSet rs) throws SQLException {
		GalleryDTO dto = new GalleryDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setMemo(rs.getString("memo"));
		dto.setWriter(rs.getString("writer"));
		dto.setUploadFileName(rs.getString("uploadFileName"));
		dto.setUploadDate(rs.getDate("uploadDate"));
		dto.setUserpw(rs.getString("userpw"));
		
		return dto;
	}
	
	
	public ArrayList<GalleryDTO> getList(int page){
		ArrayList<GalleryDTO> list = new ArrayList<GalleryDTO>();
		System.out.println(page);
		if(page == 0) page=1;
		String sql = "select * from gallery1 order by idx desc "
				+ "offset ? rows fetch first ? rows only";
		final int perPage = 5;
		int offset = (page - 1) * perPage;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, offset);
			pstmt.setInt(2, perPage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {list.add(mapping(rs));}
			
		} catch (Exception e) {
			System.err.println("목록 가져오기 오류 :"+e);
		}finally {close();}
		
		return list;
		
	}
	
	public GalleryDTO selectcontent(int idx) {
		GalleryDTO dto=new GalleryDTO();
		String sql = "select * from gallery1 where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			System.err.println("컨텐츠 찾기 오류 :"+e);
		}finally {close();}
				
		return dto;
	}
	
	public int deletecontent(int idx) {
		int row=0;
		String sql="delete from gallery1 where idx=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.err.println("content삭제 오류 :"+e);
		}finally {close();}

		return row;
	}
	
	
	public int pageCount() {
		int totalPage = 0;
		int count = 0;
		String sql = "select count(*) as Count from gallery1";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt("Count");
				totalPage = count / 5;
				totalPage += count % 5 == 0 ? 0 : 1;
			}
			
		}catch (Exception e) {
			System.err.println("데이터 개수 Count 오류 :"+e);
		}finally {
			close();
		}
		return totalPage;
	}
	
	
	
}

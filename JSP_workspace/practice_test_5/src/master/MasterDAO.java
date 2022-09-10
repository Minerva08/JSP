package master;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MasterDAO {
	private Context init;
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static MasterDAO instance = new MasterDAO();
	
	private MasterDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			System.err.println(getClass().getSimpleName() + " 생성자 예외 발생 : " + e);
		}
	}
	
	public static MasterDAO getInstance() {
		return instance;
	}
	
	private void close() {
		try {
			if(rs !=null) rs.close();
			if(pstmt !=null) pstmt.close();
			if(conn !=null) conn.close();
		} catch (Exception e) {}
	}
	
	private MasterDTO mapping(ResultSet rs) throws SQLException{
		MasterDTO dto = new MasterDTO();
		
		dto.setUserid(rs.getString("userid"));
		dto.setUserid(rs.getString("userpw"));
		
		return dto;
	}
	
	public MasterDTO login(MasterDTO user) {
		MasterDTO dto = new MasterDTO();
		
		String sql = "select * from member2 where userid=?,userpw=?";
		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getUserpw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			System.err.println("로그인 오류");
		}finally {
			close();
		}
		return dto;
	}
	
	
}

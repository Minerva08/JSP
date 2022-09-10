package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private Context init;
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			System.err.println(getClass().getSimpleName() + " 생성자 예외 발생 : " + e);
		}
	}
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null) 	conn.close();
		} catch(SQLException e) {}
	}
	
	private MemberDTO mapping(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setUserid(rs.getString("userid"));
		dto.setUserpw(rs.getString("userpw"));
		dto.setUsername(rs.getString("username"));
		dto.setEmail(rs.getString("email"));
		dto.setGender(rs.getString("gender"));
		return dto;
	}
	
	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = null;
		String sql = "select * from member2 where userid=? and userpw=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			rs = pstmt.executeQuery();	// PreparedStatement는 Statement의 서브 클래스(상속)
			
			while(rs.next()) {
				login = mapping(rs);
			}
			
		} catch (SQLException e) {
			System.err.println("login 예외 발생 : " + e);
		} finally { close(); }
		
		return login;
	}
	
}

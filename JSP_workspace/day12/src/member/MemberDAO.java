package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	
	// 1) 커넥션 풀, web.xml, Context.xml 에서 자원을 정의하고 이름으로 불러올 수 있도록 준비
	// DataSource를 불러와야 Connection을 가져올 수 있고, DataSource를 위해서 Context init 를 불러와야 한다
	
	private Context init;
	private DataSource ds;
	private Connection conn;
	
	private MemberDAO() {	// 싱글톤 구성을 위한 접근제한 private 생성자
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		} finally {
//			if(conn != null) try { conn.close(); } catch(Exception e) {}
		}
	}
	
	// 2) 싱글톤, MemberDAO의 객체는 오직 하나만 만들어질 수 있도록 처리
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	// 3) DAO 접속 여부 테스트 함수
	public String getTest() {
		String data = null;
		String sql = "select sysdate from dual"; // DB서버 기준 현재 시간, dual 가상 테이블
		Statement stmt = null;	// 멤버 필드로 선언할 때와 달리, 지역변수는 초기값을 반드시 지정해야 한다
		ResultSet rs = null;
		try {
			conn = ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				data = rs.getString(1);
			}
			
		} catch (SQLException e) {
			System.err.println("test 예외 발생 : " + e);
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(stmt != null) 	stmt.close();
				if(conn != null) 	conn.close();
			} catch(Exception e) {}
		}
		return data;
	}
	
	// 4) 사용자가 전달한 계정 정보를 바탕으로 DB에서 일치하는 계정을 찾아서 반환하는 함수
	public MemberDTO login(MemberDTO user) {
		MemberDTO dto = null;	// 미리 객체를 만들어두고 반환하면, 로그인 실패이더라도 객체가 있으니 판별이 까다롭다
		String sql = "select * from member where userid=? and userpw=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);	// PreparedStatement는 미리 SQL문을 넣어둔다
			pstmt.setString(1, user.getUserid());
			pstmt.setString(2, user.getUserpw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {	// while이지만 if와 마찬가지로 조건을 만족하면 내부 코드가 실행된다 !!
				dto = new MemberDTO();
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
				dto.setUserid(rs.getString("userid"));
				dto.setUsername(rs.getString("username"));
				dto.setUserpw(rs.getString("userpw"));
				return dto;	// 여기서 return 해서 함수를 종료시켜도, 아래 finally 는 반드시 수행된다
			}
			
		} catch (SQLException e) {
			System.err.println("login 예외 발생 : " + e);
		} finally {
//			System.out.println("Finally !!");
			try {
				if(rs != null) 		rs.close();
				if(pstmt != null) 	pstmt.close();
				if(conn != null) 	conn.close();
			} catch(Exception e) {}
		}
		return dto;
	}

}

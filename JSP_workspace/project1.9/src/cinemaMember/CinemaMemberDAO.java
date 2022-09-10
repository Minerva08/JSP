package cinemaMember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CinemaMemberDAO {
	private Context init;
	private DataSource ds;
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static CinemaMemberDAO instance = new CinemaMemberDAO();
	
	public CinemaMemberDAO() {
		try {
			init =(Context)new InitialContext();
			ds=(DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.err.println("Naming 예외 : " + e.getMessage());
		}
	}
	
	
	public static CinemaMemberDAO getInstance() {
		return instance;
	}


	public void close() {
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(stmt !=null) stmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {}
	}
	
	public CinemaMemberDTO mapping(ResultSet rs){
		CinemaMemberDTO dto = new CinemaMemberDTO();
		try {
			dto.setIdx(rs.getInt("idx"));
			dto.setName(rs.getString("name"));
			dto.setUser_id(rs.getString("user_id"));
			dto.setUser_pw(rs.getString("user_pw"));
			dto.setYear_u(rs.getString("year_u"));
			dto.setMonth_u(rs.getString("Month_u"));
			dto.setDay_u(rs.getString("Day_u"));
			dto.setEmail(rs.getString("email"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public CinemaMemberDTO login(CinemaMemberDTO user) {
		CinemaMemberDTO login = null;
		String sql ="select * from cinemamember where user_id = ? and user_pw = ?";
	
	try {
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUser_id());
		pstmt.setString(2, user.getUser_pw());
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			login = mapping(rs);
		}
		
	} catch(SQLException e) {
		System.err.println("login 예외 발생 : " + e);
	} finally { close(); }
	
	return login;
				
	}
	
	public NoMemberDTO nologin(NoMemberDTO user) {
		NoMemberDTO dto = new NoMemberDTO();
		String br = user.getBr1() + "년" +  user.getBr2() + "월" +user.getBr3() + "일";
		dto.setName(user.getName());
		dto.setPh(user.getPh());
		dto.setPw1(user.getPw1());
		dto.setPw2(user.getPw2());
		dto.setBirth(br);
		return dto;
	
	}
	
	public int insertAccount(CinemaMemberDTO user) {
		String sql="insert into cinemaMember(user_id,user_pw,name,year_u,month_u,day_u,email) values(?,?,?,?,?,?,?)";
		int row = 0;
		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, user.getUser_id());
			pstmt.setString(2, user.getUser_pw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getYear_u());
			pstmt.setString(5, user.getMonth_u());
			pstmt.setString(6, user.getDay_u());
			pstmt.setString(7, user.getEmail());
			
			row = pstmt.executeUpdate();
			
			return row;
		} catch (SQLException e) {
			System.err.println("SQL 구문 예외 : " + e.getMessage());
		}finally {close();}
		return 0;
	}
	
	public 

	
	
}

package day07;

import java.sql.*;

public class Ex01DAO {

	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
//	private final String url = "jdbc:oracle:thin:@221.164.9.200:1522:xe";
	private final String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	public Ex01DAO() {
		try {
			System.out.println("DAO 생성자 호출 !!");
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException | SQLException e) {
			System.err.println("DAO 생성자 예외 발생 : " + e);
		}
	}
	
	public String getTest() {
		String result = null;
		String sql = "select banner from v$version";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				result = rs.getString("banner");
			}
			
		} catch (SQLException e) {
			System.err.println("getTest 예외 발생 : " + e);
//			e.printStackTrace();
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(stmt != null) 	stmt.close();
				if(conn != null) 	conn.close();
			} catch(SQLException e) {}
		}
		return result;
	}
}

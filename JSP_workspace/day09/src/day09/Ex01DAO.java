package day09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Ex01DAO {
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	

	private final String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	public Ex01DAO(){
		try {
			System.out.println("DAO 생성자 호출 !!");
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException | SQLException e) {
			System.err.println("DAO 생성자 예외 발생 : " + e);
		}
	}
	
	public String getTest() {
		String sql="select banner from v$version";
		String data=null;
		stmt=null;
		rs = null;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				data=rs.getString(1);
			}
		} catch (Exception e) {
			System.err.println("getTest예외발생 : "+e);
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn !=null) conn.close();
			}catch (Exception e) {}
		}
		return data;
	}

}

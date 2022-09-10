package day09;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Ex02DAO {
	private Connection conn;
	private Context init;
	private DataSource ds;
	
	public Ex02DAO() {
		try {
			init=(Context)new InitialContext();
			ds=(DataSource)init.lookup("java:comp/env/jdbc/oracle");
		}catch(Exception e) {
			System.err.println("Ex02DAO 생성자 예외 :"+e);
		}finally {
			if(conn!=null) try {
				conn.close();
			}catch(Exception e) {}
		}
	}
	
	public String getTest() {
		String sql="select banner from v$version";
		String data=null;
		Statement stmt=null;
		ResultSet rs = null;
		
		try {
			conn=ds.getConnection();//ds가 여러개의 커넥션 객체를 가지고 있고, 그 중 하나를 요청하여 받는다
			System.out.println(conn.hashCode());
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				data=rs.getString(1);
			}
		} catch (Exception e) {
			System.err.println("getTest예외발생 : "+e);
		}finally {
			try {
				if(rs!=null)	 rs.close();
				if(stmt!=null) 	stmt.close();
				if(conn !=null) conn.close();	
			}catch (Exception e) {}
		}
		return data;
	}

	
}	

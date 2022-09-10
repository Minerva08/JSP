package day09_book;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookDAO {
	
	private Connection conn;
	private Context init;
	private DataSource ds;
	private Statement stmt=null;
	private ResultSet rs = null;
	
	
	public BookDAO() {
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
	
	public ArrayList<BookDTO> getList(){
		
		ArrayList<BookDTO> list=  new ArrayList<BookDTO>();
		String sql="select * from book order by idx";
		
		
		try {
			conn=ds.getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setAuthor(rs.getString("author"));
				dto.setPublisher(rs.getString("publisher"));
				dto.setPublishDate(rs.getDate("publishDate"));
				dto.setPrice(rs.getInt("price"));
				dto.setDescription(rs.getString("description"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.err.println("목록 출력 예외 발생 :"+e);
			
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(stmt != null) 	stmt.close();
				if(conn != null) 	conn.close();
				
			} catch(Exception e) {}
		}
		
		return list;
	}
	
	public int delete(int idx) {
		int row=0;
		String sql="delete from book where idx="+idx;
		
		try {
			conn=ds.getConnection();
			stmt=conn.createStatement();
			row = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			System.err.println("삭제 예외발생 : "+e);
		}finally {
			try {
				if(rs !=null) rs.close();
				if(stmt !=null) stmt.close();
				if(conn != null) conn.close();
			}catch (Exception e) {}
		}
		return row;
	}

}

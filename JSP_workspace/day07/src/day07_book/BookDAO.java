package day07_book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BookDAO {	// Book 객체 들을 관리하는 목적에서 여러 기능을 정의해 둔 클래스 (함수 중심의 객체)
						// 추가, 목록(번호, 이름, 날짜 순으로 정렬), 검색(이름으로 검색, 관리번호로 검색), 수정, 삭제
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
//	private final String url = "jdbc:oracle:thin:@221.164.9.200:1522:xe";
	private final String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	public BookDAO() {
		try {
			System.out.println("DAO 생성자 호출 !!");
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException | SQLException e) {
			System.err.println("DAO 생성자 예외 발생 : " + e);
		}
	}
	
	public ArrayList<BookDTO> getList() {	// ${ dao.list }
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		// 내용 작성
		String sql = "select * from book order by idx";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setAuthor(rs.getString("author"));
				dto.setDescription(rs.getString("description"));
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setPublishDate(rs.getDate("publishDate"));
				dto.setPublisher(rs.getString("publisher"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(stmt != null) 	stmt.close();
				if(conn != null) 	conn.close();
				
			} catch(Exception e) {}
		}
		
		return list;
	}
	
	public int insert(BookDTO dto) {
		int row = 0;
		String sql = "insert into book values (book_seq.nextval, ?, ?, ?, ?, ?, ?)";
		
//		String.format("insert into book values (book_seq.nextval, %s, %s, %s, %s, %s, %s)", 
//				dto.getName(), dto.getAuthor(), dto.getPublisher(), 
//				dto.getPublishDate(), dto.getPrice(), dto.getDescription());
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAuthor());
			pstmt.setString(3, dto.getPublisher());
			pstmt.setDate(4, new java.sql.Date(dto.getPublishDate().getTime()));
			pstmt.setInt(5, dto.getPrice());
			pstmt.setString(6, dto.getDescription());
			
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("insert 예외 발생 : " + e);
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(stmt != null) 	stmt.close();
				if(conn != null) 	conn.close();
				
			} catch(Exception e) {}
		}
		return row;
	}
	// 함수에서 다른 함수를 호출할 수 있다
	public ArrayList<BookDTO> search(String column, String word) {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		
		try {
			// 1) column의 값에 따라서 selectListByName() 혹은 selectOneByIdx()를 호출한다
			if(column.equals("idx")) {
			
				// 2) 만약 반환형이 일치하지 않으면 맞춰준다
				int idx = Integer.parseInt(word);
				BookDTO dto = selectOneByIdx(idx);
				list.add(dto);
			}
			else {	// if(column.equals("name"))
				list = selectListByName(word);		// 리스트 바꿔치기
			}
		} catch(NumberFormatException e) {
			System.err.println("search (NumberFormatException): " + e);
		}
		
		// 3) 각 결과를 jsp에 반환하고 기존과 같이 반복문으로 출력하도록 한다
		// !!) jsp에서는 각각의 함수를 직접 호출하지 않고, search()를 호출하도록 변경한다
		return list;
	}
	
	public ArrayList<BookDTO> selectListByName(String name) {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		String sql = "select * from book where name like '%%" + name + "%%' order by idx";
		
		try {
			stmt = conn.createStatement();  
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				BookDTO dto = new BookDTO();	// 여러 객체를 반환하는 경우에는, 반복문 내에서 변수를 선언
				dto.setAuthor(rs.getString("author"));
				dto.setDescription(rs.getString("description"));
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setPublishDate(rs.getDate("publishDate"));
				dto.setPublisher(rs.getString("publisher"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.err.println("selectListByName 예외 발생 : " + e);
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(stmt != null) 	stmt.close();
				if(conn != null) 	conn.close();
			} catch(Exception e) {}
		}
		
		return list;
	}
	
	public BookDTO selectOneByIdx(int idx) {
		BookDTO dto = null;
		String sql = "select * from book where idx=" + idx;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				dto = new BookDTO();
				dto.setAuthor(rs.getString("author"));
				dto.setDescription(rs.getString("description"));
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setPublishDate(rs.getDate("publishDate"));
				dto.setPublisher(rs.getString("publisher"));
			}
		} catch (SQLException e) {
			System.err.println("selectOne 예외 발생 : " +e);
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(stmt != null) 	stmt.close();
				if(conn != null) 	conn.close();
			} catch(Exception e) {}
		}
		return dto;
	}
	
	public int delete(int idx) {
		int row = 0;
		String sql = "delete board where idx=" + idx;
		
		try {
			stmt = conn.createStatement();
			row = stmt.executeUpdate(sql);
			
		} catch (SQLException e) {
			System.err.println("delete 예외 발생 : " + e);
		} finally {
			try {
				if(rs != null) 		rs.close();
				if(stmt != null) 	stmt.close();
				if(conn != null) 	conn.close();
			} catch(Exception e) {}
		}
		return row;
	}
	
	
	
	
	
	
	
	
	
	
	
}

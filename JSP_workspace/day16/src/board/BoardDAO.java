package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {

	private Context init;
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static BoardDAO instance = new BoardDAO();
	
	private BoardDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			System.err.println(getClass().getSimpleName() + " 생성자 예외 발생 : " + e);
		}
	}

	public static BoardDAO getInstance() {
		return instance;
	}
	
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null) 	conn.close();
		} catch(SQLException e) {}
	}
	
	private BoardDTO mapping(ResultSet rs) throws SQLException {
		BoardDTO dto = new BoardDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setWriter(rs.getString("writer"));
		dto.setTitle(rs.getString("title"));
		dto.setContent(rs.getString("content"));
		dto.setWriteDate(rs.getDate("writeDate"));
		dto.setIpAddress(ipMarking(rs.getString("ipAddress")));
		return dto;
	}
	
	private String ipMarking(String ipAddress) {
//		System.out.println(ipAddress);
		String data = "";
		int cnt = 0;
		for(int i = 0; i < ipAddress.length(); i++) {
			char ch = ipAddress.charAt(i);
			if(ch == '.') {
				cnt++;
			}
			data += ch;
			if(cnt >= 2) {
				data += "***.***";
				return data;
			}
		}
		return data;
	}
	//검색조건+페이징
	
	public ArrayList<BoardDTO> selectBoardList(int page, String column, String search){
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		String condition = "where ";
		switch(column) {
		case "writer":
			condition +="writer like '%"+search+"%' ";
			break;
		case "title":
			condition +="title like '%"+search+"%' ";
			break;
		case "content":
			condition +="content like '%"+search+"%' ";
			break;
		default:
			condition="";
		}
		
		String sql = "select * from board2 "
				+ condition
				+"order by idx desc "
				+"offset ? rows "
				+"fetch first 10 rows only";
		
		if(page==0) page=1;
		int perpage=10;
		page =(page-1)*perpage;
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, page);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			System.err.println("selectBoardList 예외 발생:"+e);
		}finally { close(); }
		
		return list;
	}
	
	public int PageCount(String column,String search) {
		int pageCount=0;
		String condition="where ";
		switch(column) {
		case "writer":
			condition +="writer like '%"+search+"%'";
			break;
		case "title":
			condition +="title like '%"+search+"%'";
			break;
		case "content":
			condition +="content like '%"+search+"%'";
			break;
		default:
			condition="";
		}
		String sql = "select count(*) as boardCount from board2 "+condition;
		int boardCount=0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boardCount = rs.getInt("boardCount");
				pageCount = boardCount/10;
				pageCount+=boardCount%10 ==0 ? 0:1;
			}
		} catch (Exception e) {
			System.err.println("pageCount 에외 : "+e);
		}finally { close(); }
		
		return pageCount;
	}
	
	
	
// <단순 페이징>
	  
	  public ArrayList<BoardDTO> selectBoardList(int page) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = "select * from board2 "
				+ "where 1=1 "
				+"order by idx desc "
				+"offset ? rows "
				+"fetch first 10 rows only";
		if(page==0) page=1;
		int perpage=10;
		if(page>=2) {
			page=(page-1)*perpage;
		}
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, page);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(mapping(rs)); // ResultSet의 내용 한줄을 DTO에 맵핑하여 리스트에 추가
			}
			
		} catch (SQLException e) {
			System.err.println("selectBoardList 예외 발생 : " + e);
		} finally { close(); }
		
		return list;
	}
	
	public int PageCount() {
		int pageCount=0;
		String sql = "select count(*) as boardCount from board2";
		
		int boardCount=0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boardCount = rs.getInt("boardCount");
				pageCount = boardCount/10;
				pageCount+=boardCount%10 ==0 ? 0:1;
			}
		} catch (Exception e) {
			System.err.println("PageCount 예외발생 : "+e);
		} finally { close(); }
		
		return pageCount;
	}
	
	
	
	public ArrayList<BoardDTO> selectBoardList(String column, String search) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		// 1) column이 idx 이거나, 혹은 writer, content, title 이거나
		// 2) idx를 제외한 나머지는 where column like %search%
		// 3) idx는 where idx = search
		// 4) 파라미터에 따라서 sql문이 달라지지만, 리스트를 받아서 저장하고 반환하는 형태는 동일하다
		String condition = "where ";
		
		switch(column) {
		case "idx":
			condition += "idx = " + search;
			break;
		case "title":
		case "writer":
		case "content":
			condition += column + " like '%" + search + "%'";
			break;
		}
		String sql = "select * from board2 " + condition + " order by idx desc";
//		System.out.println(sql);
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(mapping(rs)); // ResultSet의 내용 한줄을 DTO에 맵핑하여 리스트에 추가
			}
			
		} catch (SQLException e) {
			System.err.println("selectBoardList 예외 발생 : " + e);
		} finally { close(); }
		return list;
	}
	
	public BoardDTO selectBoard(int idx) {
		BoardDTO dto = null;
		String sql = "select * from board2 where idx = " + idx;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (SQLException e) {
			System.err.println("selectBoard 예외 발생 : " + e);
		} finally { close(); }
		
		return dto;
	}
	
	public int insert(BoardDTO dto) {
		int row = 0;
		String sql = "insert into board2 (writer, title, content, ipAddress) values (?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getIpAddress());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("insert 예외 발생 : " + e);
		} finally { close(); }
		return row;
	}
	
	public int delete(int idx) {
		int row = 0;
		String sql = "delete board2 where idx = " + idx;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("delete 예외 발생 : " + e);
		} finally { close(); }
		return row;
	}
	
	public int modify(BoardDTO dto) {
		int row = 0;
		String sql = "update board2 set title=?, writer=?, content=?, writeDate=?, ipAddress=? where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setDate(4, new Date(new java.util.Date().getTime()));
			pstmt.setString(5, dto.getIpAddress());
			pstmt.setInt(6, dto.getIdx());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("modify 예외 발생 : " + e);
		} finally { close(); }
		return row;
	}
	
}

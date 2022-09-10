package naver;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sun.font.CreatedFontTracker;

public class MemberDAO {
	private Context init=null;
	private DataSource ds=null;
	
	private Connection conn =null;
	private Statement stmt=null;
	private ResultSet rs=null;
	private PreparedStatement pstmt=null;
	
	
	public MemberDAO() {
		try {
			init=(Context)new InitialContext();
			ds=(DataSource)init.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
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
	
	
	public int login(String id, String pw) {
		int result=0;
		String password=null;
		
		String sql="select pw from naver where id='"+id+"'";

		try {
			conn=ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				password=rs.getString(1);
				if(pw.equals(password)) {
					result=1;
				}
			}
	
		} catch (SQLException e) {
			System.err.println("로그인 오류 : "+e);
			e.printStackTrace();
		}finally {
			try {
				if(stmt !=null) rs.close();
				if(rs !=null) rs.close();
				if(conn !=null) conn.close();
			} catch (Exception e) {}
		}

		return result;
	}
	
	public ArrayList<MemberDTO> getList(){
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql="select * from naver order by idx";
		
		try {
			conn=ds.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				
				dto.setIdx(rs.getInt(1));
				dto.setName(rs.getString(2));
				dto.setId(rs.getString(3));
				dto.setPw(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setBrith(rs.getDate(6));
				dto.setGender(rs.getString(7));
				list.add(dto);
			}
			  
		} catch (SQLException e) {
			System.err.println("목록가져오기 오류 : "+e);
		}finally {
			try {
				if(conn !=null)		conn.close();
				if(rs != null)		rs.close();
				if(stmt !=null)		stmt.close();
			}catch(Exception e) {}
		}
		return list;
	}
	
	public int insert(MemberDTO dto) {
		int row=0;
		String sql = "insert into naver values (naver_seq.nextval, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPw());
			pstmt.setString(4, dto.getEmail());
			pstmt.setDate(5, new java.sql.Date(dto.getBrith().getTime()));			
			pstmt.setString(6, dto.getGender());
			
			row=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("추가 예외 발생 :"+e);
		}finally {
			try {
				if(conn != null)	conn.close();
				if(pstmt != null)	pstmt.close();
				
			}catch (Exception e) {}
		}
		System.out.println(row);
		return row;
	}
	
	public boolean durationId(String id) {
		boolean result=false;
		ArrayList<MemberDTO> list = getList();
		for(int i=0; i<list.size();i++) {
			result=list.get(i).getId().equals(id);
			if(result == true)	return result;
		}
		return result;
	}
	
	
	public MemberDTO searchMember(MemberDTO member) {

		MemberDTO dto=new MemberDTO();
		String sql = null;
	
		try {

			if(member.getEmail() != null && member.getName() != null) {
				sql = "select * from naver where name='"+member.getName()+"' and email='"+member.getEmail()+"'";
				conn=ds.getConnection();
				stmt = conn.createStatement();
				rs=stmt.executeQuery(sql);
				
				while(rs.next()) {
					dto.setIdx(rs.getInt(1));
					dto.setName(rs.getString(2));
					dto.setId(rs.getString(3));
					dto.setPw(rs.getString(4));
					dto.setEmail(rs.getString(5));
					dto.setBrith(rs.getDate(6));
					dto.setGender(rs.getString(7));	
					
				}
				return dto;

			}
			if(member.getId() != null && member.getName() != null) {
				sql = "select * from naver where name='"+member.getName()+"' and id='"+member.getId()+"'";;
				conn=ds.getConnection();
				stmt = conn.createStatement();
				rs=stmt.executeQuery(sql);
				
				while(rs.next()) {
					dto.setIdx(rs.getInt(1));
					dto.setName(rs.getString(2));
					dto.setId(rs.getString(3));
					dto.setPw(rs.getString(4));
					dto.setEmail(rs.getString(5));
					dto.setBrith(rs.getDate(6));
					dto.setGender(rs.getString(7));	
					
				}
			}
			if(member.getId() != null && member.getPw() != null) {
				sql = "select * from naver where id='"+member.getId()+"' and pw='"+member.getPw()+"'";
				conn=ds.getConnection();
				stmt = conn.createStatement();
				rs=stmt.executeQuery(sql);
				
				while(rs.next()) {
					dto.setIdx(rs.getInt(1));
					dto.setName(rs.getString(2));
					dto.setId(rs.getString(3));
					dto.setPw(rs.getString(4));
					dto.setEmail(rs.getString(5));
					dto.setBrith(rs.getDate(6));
					dto.setGender(rs.getString(7));	
					
				}
			}

				
			} catch (SQLException e) {
				System.err.println("검색 예외 발생 :"+e);
			}finally {
				try {
					if(conn != null)	conn.close();
					if(pstmt != null)	pstmt.close();
					if(rs != null) 		rs.close();
				}catch (Exception e) {}
			}
		return dto;
	}
	
	
	public int modify(MemberDTO dto) {
		System.out.println(dto);
		int row=0;
		String sql = "update naver set pw=? where id=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2,dto.getId());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("modify 예외 발생 : " + e);
		} finally {  
			try {
				if(conn != null)	conn.close();
				if(pstmt != null)	pstmt.close();
				if(rs != null) 		rs.close();
			}catch (Exception e) {}
		}
		return row;
	}
	
	

	
	
}

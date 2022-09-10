package kiosk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO {
	private Context init;
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static ProductDAO instance = new ProductDAO();
	
	private ProductDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
			
		} catch (NamingException e) {
			System.err.println(getClass().getSimpleName() + " 생성자 예외 발생 : " + e);
		}
	}

	public static ProductDAO getInstance() {
		return instance;
	}
	
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null) 	conn.close();
		} catch(SQLException e) {}
	}
	
	private ProductDTO mapping(ResultSet rs) throws SQLException {
		ProductDTO dto = new ProductDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setName(rs.getString("name"));
		dto.setDescription(rs.getString("description"));
		dto.setUploadFileName(rs.getString("uploadFileName"));
		dto.setPrice(rs.getString("price"));
		dto.setUploadDate(rs.getDate("uploadDate"));
		
		return dto;
	}
	
	public ArrayList<ProductDTO> getProducts(){
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from product";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(mapping(rs)); // ResultSet의 내용 한줄을 DTO에 맵핑하여 리스트에 추가
			}
			
		} catch (SQLException e) {
			System.err.println("getitem 예외 발생 : " + e);
		} finally { close(); }
		return list;
	}

	
	public ProductDTO selectmenu(int idx) {
		ProductDTO dto = null;
		String sql = "select * from product where idx=? ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (SQLException e) {
			System.err.println("selectmenu 예외 발생 : " + e);
		} finally { close(); }
		
		return dto;
	}
	
	public int ordermenu(OrderDTO dto) {
		int row=0;
		String sql = "insert into orders (product_idx,name,price,amount,total_price) values (?, ?, ?, ?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,dto.getProduct_idx());
			pstmt.setString(2,dto.getName());
			pstmt.setInt(3,dto.getPrice());
			pstmt.setInt(4,dto.getAmount());
			pstmt.setInt(5,dto.getTotal_price());
			
			
			row = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			System.err.println("ordermenu 예외 발생 : " + e);
		} finally { close(); }
		return row;
		
	}
	
	
	public ArrayList<OrderDTO> getorderlist(){
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		String sql = "select * from orders order by idx asc";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setAmount(rs.getInt("amount"));
				dto.setProduct_idx(rs.getInt("product_idx"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.err.println("getorderList 예외 발생 : " + e);
		} finally { close(); }
		return list;
	}
	
	public int calcEach(int price,int amount) {
		int result=0;
		result = price*amount;
		return result;
		
	}
	
	public int insert(ProductDTO dto) {
		int row=0;
		String sql = "insert into product (name,description,price,uploadFileName) values (?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getDescription());
			pstmt.setString(3, dto.getPrice());
			pstmt.setString(4, dto.getUploadFileName());
			
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			System.err.println("insert예외 발생 :" +e);
		}finally {
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			}catch (Exception e) {}
		}
		return row;
	}

	
}

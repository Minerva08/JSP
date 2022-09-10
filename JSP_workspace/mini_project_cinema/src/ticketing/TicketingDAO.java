package ticketing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TicketingDAO {
   
   private Context init;
   private DataSource ds;
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   private static TicketingDAO instance = new TicketingDAO();
   
   private TicketingDAO() {
      try {
         init = new InitialContext();
         ds = (DataSource)init.lookup("java:comp/env/jdbc/oracle");
         
      } catch (NamingException e) {
         System.err.println(getClass().getSimpleName() + " 생성자 예외 발생 : " + e);
      }
   }

   public static TicketingDAO getInstance() {
      return instance;
   }
   
   private void close() {
      try {
         if(rs != null)      rs.close();
         if(pstmt != null)   pstmt.close();
         if(conn != null)    conn.close();
      } catch(SQLException e) {}
   }
   
   private TicketingDTO mapping(ResultSet rs) throws SQLException {
      TicketingDTO dto = new TicketingDTO();
      dto.setIdx(rs.getInt("idx"));
      dto.setCity(rs.getString("city"));
      dto.setBranch(rs.getString("branch"));
      dto.setMovie_name(rs.getString("movie_name"));
      dto.setRun_house(rs.getString("run_house"));
      dto.setStart_time(rs.getString("start_time"));
      dto.setRun_date(rs.getString("run_date"));
      
      return dto;
   }
   
   public int insert_ticket(TicketingDTO data) {
	   System.out.println(data);
      int row=0;
      String sql = "insert into ticketing(city,branch,movie_name) values(?,?,?)";
      
      try {
         conn = ds.getConnection();
         pstmt = conn.prepareStatement(sql);
         //pstmt.setString(1, user_id);
         pstmt.setString(1, data.getCity());
         pstmt.setString(2, data.getBranch());
         pstmt.setString(3, data.getMovie_name());
         //pstmt.setString(5, data.getRun_house());
         //pstmt.setString(6, data.getStart_time());
         //pstmt.setString(7, data.getRun_date());
         //pstmt.setString(8, data.getSeat());
         row = pstmt.executeUpdate();
      } catch (SQLException e) {
         System.err.println("insert_ticket 예외 발생 : " + e);
      } finally { close(); }
      return row;
   }
         
   
}
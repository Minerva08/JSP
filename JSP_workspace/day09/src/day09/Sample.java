package day09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class Sample {

	ArrayList<Connection> list1 = new ArrayList<Connection>();	// 연결 대기중인 리스트
	ArrayList<Connection> list2 = new ArrayList<Connection>();	// 연결 종료된 리스트
	
	private final String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	public Sample() {	// 자바에서 가장 시간이 걸리는 작업 중 하나인 객체 생성을 미리 다 해두고, 요청이 들어오면 대기중인 커넥션 하나를 내어주는 방식
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			for(int i = 0; i < 10; i++) {
				Connection conn = DriverManager.getConnection(url, user, password);
				if(i % 2 == 0) 	list1.add(conn);
				else 			list2.add(conn);
			}
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println("생성자 예외 : " + e);
		}
	}
	
	private Connection getConnection() throws SQLException {
		for(Connection conn : list1) {
			if(conn.isClosed() == false) {
				return conn;
			}
		}
		return null;
	}
	
	
}

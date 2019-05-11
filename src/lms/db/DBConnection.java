package lms.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	public Connection conn;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String id = "adams";
	String pw = "adams1234";
	String driver = "oracle.jdbc.driver.OracleDriver";
	public Connection getConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public void disconnect(Connection con) {
	      if(con != null) {
	         try {
	            con.close();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	      }
	   }

}

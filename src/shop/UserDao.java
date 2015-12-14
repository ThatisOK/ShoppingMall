package shop;

import java.sql.*;

public class UserDao {
	
	public Connection getConn() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");  
		String url = "jdbc:mysql://127.0.0.1:3306/test";
		Connection conn = DriverManager.getConnection(url, "root", "root");
		return conn;
	}
	
	public String userLogin(String username){
		Connection conn = null;
		String result = "";
		try {
			conn = this.getConn();
			Statement stmt = conn.createStatement();
			String sql = "select * from user where username='"+username+"'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next())
				result = rs.getString("password");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

}

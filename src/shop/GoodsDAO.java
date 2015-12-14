package shop;
import java.sql.*;
import java.util.*;


public class GoodsDAO {
	

	public Connection getConn() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");  
		String url = "jdbc:mysql://127.0.0.1:3306/test";
		Connection conn = DriverManager.getConnection(url, "root", "root");
		return conn;
	}
	
	public ArrayList<Good> getGoods(){
		ArrayList<Good> list = new ArrayList<Good>();
		Connection conn = null;
		try {
			conn = this.getConn();
			Statement stmt = conn.createStatement();
			String sql = "select * from goods";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Good good = new Good();
				good.setId(rs.getInt("id"));
				good.setName(rs.getString("name"));
				good.setPrice(rs.getDouble("price"));
				good.setNumber(rs.getInt("number"));
				good.setImg(rs.getString("img"));
				list.add(good);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return list;
		
	}
	
	public Good getGood(int id){
		Connection conn = null;
		Good good = null;
		try {
			conn = this.getConn();
			Statement stmt = conn.createStatement();
			String sql = "select * from goods where id = "+id;
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				good = new Good();
				good.setId(rs.getInt("id"));
				good.setName(rs.getString("name"));
				good.setNumber(rs.getInt("number"));
				good.setPrice(rs.getDouble("price"));
				good.setImg(rs.getString("img"));
			}
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
		return good;
		
	}

}

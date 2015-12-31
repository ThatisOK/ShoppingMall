package order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import user.UserDao;

public class OrderDao {
	
	/**
	 * 连接数据库并获得Connection
	 * @return conn
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Connection getConn() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");  
		String url = "jdbc:mysql://127.0.0.1:3306/test";
		Connection conn = DriverManager.getConnection(url, "root", "root");
		return conn;
	}
	
	/**
	 * 添加订单
	 * @param order
	 * @param goodToNum
	 * @param username
	 * @return  错误代码 
	 */
	public int addOrder(Order order, String[] goodToNum, String username){
		Connection conn = null;
		UserDao user = new UserDao();
		String userId = user.getIdByUsername(username);
		int length = goodToNum.length;
		String[] queries = new String[length];
		for(int i=0; i<length; i++){
			String goodId = goodToNum[i].split("\\+")[0];
			String goodAmount = goodToNum[i].split("\\+")[1];
			queries[i] = "insert into order_good values('"+order.getId()+"',"+goodId+","+goodAmount+")";
		}
		try {
			conn = this.getConn();
			Statement stmt =conn.createStatement();
			String sql = "insert into orderInfo values('"+order.getId()+"','"+order.getReciver()+"','"+order.getPhone()+"','"+order.getAddress()+"','"+order.getMessage()+"','"+userId+"')";
			stmt.execute(sql);
			for(String query : queries){
				stmt.addBatch(query);
			}
			stmt.executeBatch();
			conn.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}

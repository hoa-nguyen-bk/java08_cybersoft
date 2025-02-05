package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlConfig {
	public static Connection getConnection() {
		String url = "jdbc:mysql://localhost:3307/crm_app"; // + database mình sử dụng
		String user = "root"; // mình tách biến ra để dễ quản lý
		String password = "admin123";
		Connection connection = null;
		// Cố gắng kết nối
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("Kết nối cơ sở dữ liệu thành công!");
		} catch (SQLException e) {
			System.out.println("Kết nối thất bại!");
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException" + e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return connection;
	}
}

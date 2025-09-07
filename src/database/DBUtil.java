package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	public static Connection getConnection() {
		Connection connection = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2. Get the connection object
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pcscloudlabs?allowPublicKeyRetrieval=true&useSSL=false", "root", "root");

		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();

		} catch (SQLException se) {
			se.printStackTrace();

		}

		return connection;
	}

	public static void closeConnection(Connection connection) {

		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

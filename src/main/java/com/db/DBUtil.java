package com.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException
	{
		String url = "jdbc:mysql://localhost:3306/hospital_system";
		String user = "root";
		String password = "Root@123";
		Connection connection = DriverManager.getConnection(url,user,password);
		return connection;
	}
	public static void closeResources(Connection connection, Statement statement)throws SQLException
	{
		connection.close();
		statement.close();
	}
}

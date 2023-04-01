package com.register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	private static Connection connection = null;
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/coursework";
		String user = "root";
		String pass = "";
		connection = DriverManager.getConnection(url, user, pass);
		return connection;
	}
	
}

package com.csm;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class DBManager {
	public Connection getConnection() throws 
	 ClassNotFoundException, SQLException{
		
		Connection connection = null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String dbUrl = "jdbc:mysql://localhost:3306/gwwp";
		
		String dbUser = "root";
		
		String dbPassword = "93mysqlmain";
		
		connection = DriverManager.getConnection(dbUrl,dbUser,dbPassword);
		
		return connection;
	}

}
package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static final String URL = "jdbc:mysql://localhost:3306/cravings_app";
	public static final String USERNAME = "root";
	private static final String PASSWORD = "root";
	
	public static Connection getConnetion()  {
		Connection con = null;
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		    System.out.println("Con estd");
		}
		catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return con;
		
	}
}

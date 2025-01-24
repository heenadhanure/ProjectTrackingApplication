package com.nit.utils; // Change the package name according to your project structure

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
//	private static Connection con = null;
	public static final String
	dbUrl = "jdbc:oracle:thin:@localhost:1522:xe";
	public static final String uName = "system";
	public static final String pWord = "Anhee";
	private DBConnection() {}
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getCon() throws SQLException  {
		return DriverManager.getConnection(dbUrl,uName,pWord);
	}
}
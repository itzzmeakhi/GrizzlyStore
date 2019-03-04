package com.cognizant.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDao {
	
	public static Connection Connect() throws ClassNotFoundException, SQLException {
		Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/grizzlystore", "root", "");
		return con;
	}
	
	
	public boolean checkUserName(String userName) throws ClassNotFoundException, SQLException {
		Connection con = Connect();
		
		
		String checkUserNameQuery = "SELECT * FROM users WHERE username='"+userName+"'";
		
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(checkUserNameQuery);
		
		boolean userNamePresent;
		
		if(rs.next()) {
			userNamePresent = true;
		} else {
			userNamePresent = false;
		}
		
		return userNamePresent;
				
	}
	
	public boolean userLogin(String userName, String password) throws ClassNotFoundException, SQLException {
		Connection con = Connect();
		
		String checkLoginQuery = "SELECT * FROM users WHERE username ='"+userName+"' AND password ='"+password+"' AND is_blocked = 'NO'";
		
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(checkLoginQuery);
		
		boolean userNamePresent;
		
		if(rs.next()) {
			userNamePresent = true;
		} else {
			userNamePresent = false;
		}
		
        //int count = 0;
		
		//if(!rs.next()) {
		//	count = 0;
		//} else {
		//	count = 1;
		//}
		
		return userNamePresent;

	}

}
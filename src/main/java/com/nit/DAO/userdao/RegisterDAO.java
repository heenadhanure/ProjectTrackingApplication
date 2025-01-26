package com.nit.DAO.userdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.nit.beans.UserBean;
import com.nit.utils.DBConnection;

public class RegisterDAO {
	static int k = 0;
	static String result = null;
	public static String register(UserBean ub) {

		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, ub.getUserName());
			ps.setString(2, ub.getFirstName());
			ps.setString(3, ub.getLastName());
			ps.setString(4, ub.getEmail());
			ps.setString(5, ub.getRole());
			ps.setString(6, ub.getPassword());
			ps.setString(7, ub.getConfirmPassword());
			ps.setLong(8, ub.getPhone());
			ps.setBlob(9, ub.getProfileImage());
			
			k = ps.executeUpdate();
			System.out.println(k);
			if(k<=0)
				result = "ERROR";
			else
				result = "SUCCESS";

		} catch (SQLException e) {
			System.out.println("user table not inserted pls check register method");
			e.printStackTrace();
		}		
	
		
		return result;
	}
}
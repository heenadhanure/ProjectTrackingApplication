package com.nit.DAO.userdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.nit.beans.UserBean;
import com.nit.utils.DBConnection;

public class LoginDAO {
	public static UserBean ub = null;
	public static UserBean login(String uN, String pW) {
		try {
			Connection con = DBConnection.getCon();	// Accessing the connection
			PreparedStatement ps = con.prepareStatement("select * from users where username = ? and password = ?");
			
			ps.setString(1, uN);
			ps.setString(2, pW);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				ub = new UserBean();
				ub.setUserName(rs.getString(1));
				ub.setFirstName(rs.getString(2));
				ub.setLastName(rs.getString(3));
				ub.setEmail(rs.getString(4));
				ub.setRole(rs.getString(5));
				ub.setPassword(rs.getString(6));
				ub.setConfirmPassword(rs.getString(7));
				ub.setPhone(rs.getLong(8));
				ub.setProfileImage(rs.getAsciiStream(9));
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return ub;
	}

}

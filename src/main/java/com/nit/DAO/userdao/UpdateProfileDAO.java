package com.nit.DAO.userdao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.nit.beans.UserBean;
import com.nit.utils.DBConnection;

public class UpdateProfileDAO {
	public int k = 0;
	public int update(UserBean ub) {
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("update users set username=?, email=?, role=?  where username=?");
			ps.setString(1, ub.getPassword());
			ps.setString(2, ub.getEmail());
			ps.setString(3, ub.getRole());
			ps.setString(4, ub.getUserName());
			
			k = ps.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}
		
		return k;
	}

}

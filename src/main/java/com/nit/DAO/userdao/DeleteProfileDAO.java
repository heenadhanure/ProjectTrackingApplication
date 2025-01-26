package com.nit.DAO.userdao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.nit.utils.DBConnection;

public class DeleteProfileDAO {
	public static int k = 0;
	public static int delete(String uname) {
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("delete from users where username = ?");
			ps.setString(1, uname);
			
			k = ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return k;
	}

}

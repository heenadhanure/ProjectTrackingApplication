package com.nit.DAO.projectdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nit.beans.TeamMembersBean;
import com.nit.utils.DBConnection;

public class TeamMemberDAO {

	public static List<TeamMembersBean> getTeamMembers(int teamId) {
		List<TeamMembersBean> teamMembers = new ArrayList<>();
		String query = "select * from team_members where team_id = ?";
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, teamId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				TeamMembersBean member = new TeamMembersBean();
				member.setTeamId(rs.getInt("team_id"));
				member.setUsername(rs.getString("username"));
				member.setRole(rs.getString("role"));
				member.setFirstName(rs.getString("first_name"));
				member.setLastName(rs.getString("last_name"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getLong("phone"));
				member.setMember_id(rs.getInt("member_id"));
				
				teamMembers.add(member);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return teamMembers;
	}

}

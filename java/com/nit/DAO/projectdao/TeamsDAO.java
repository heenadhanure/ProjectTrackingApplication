package com.nit.DAO.projectdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nit.beans.ProjectsBean;
import com.nit.beans.TeamsBean;
import com.nit.beans.UserBean;
import com.nit.utils.DBConnection;

public class TeamsDAO {

	public static List<ProjectsBean> fetchProjects() {
		List<ProjectsBean> projectList = new ArrayList<>();
		ProjectsBean pb = null;
		String query = "select project_id,project_name,description,status,start_date,end_date,username,progress from projects";
				
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				pb = new ProjectsBean();
				pb.setProjectId(rs.getInt("project_id"));
				pb.setProjectName(rs.getString("project_name"));
				pb.setDescription(rs.getString("description"));
				pb.setStatus(rs.getString("status"));
				pb.setStartDate(rs.getDate("start_date"));
				pb.setEndDate(rs.getDate("end_date"));
				pb.setUsername(rs.getString("username"));
				pb.setProgress(rs.getInt("progress"));
				
				projectList.add(pb);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
//		System.out.println("projects: "+projectList);
		return projectList;
	}

	public static List<TeamsBean> fetchTeams(String projectName) {
		List<TeamsBean> teams = new ArrayList<>();
		TeamsBean tb = null;
		String query = "SELECT t.team_id, t.team_name, t.team_lead, t.created_date,t.members,t.description FROM teams t JOIN projects p ON t.project_id = p.project_id WHERE p.project_name = ?";
		
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, projectName);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				tb = new TeamsBean();
				tb.setTeamId(rs.getInt("team_id"));
				tb.setTeamName(rs.getString("team_name"));
				tb.setTeamLead(rs.getString("team_lead"));
				tb.setCreatedDate(rs.getDate("created_date"));
				tb.setMembers(rs.getInt("members"));
				tb.setDescription(rs.getString("description"));
				
				teams.add(tb);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
//		System.out.println("Teams : "+teams);
		return teams;
	}

	public static TeamsBean getTeamDetails(int teamId) {
		TeamsBean tb = null;
		String query = "select * from teams where team_id = ?";
		
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,teamId);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				tb = new TeamsBean();
				tb.setTeamId(rs.getInt("team_id"));
				tb.setTeamName(rs.getString("team_name"));
				tb.setTeamLead(rs.getString("team_lead"));
				tb.setCreatedDate(rs.getDate("created_date"));
				tb.setProjectId(rs.getInt("project_id"));
				tb.setMembers(rs.getInt("members"));
				tb.setDescription(rs.getString("description"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return tb;
	}

	public static int createTeam(String teamName, String teamLead, String projectId, int members, String description) {
		int result = 0;
		try {
          // Get database connection
          Connection con = DBConnection.getCon();
          String query = "INSERT INTO teams (team_name, team_lead, project_id, members, description) VALUES (?, ?, ?, ?, ?)";
          PreparedStatement ps = con.prepareStatement(query);

          ps.setString(1, teamName);
          ps.setString(2, teamLead);
          ps.setString(3, projectId);
          ps.setInt(4, members);
          ps.setString(5, description);

          result = ps.executeUpdate();
          
	}catch(Exception e) {
		e.printStackTrace();
	}
		return result;
	}

	public static List<UserBean> getAllUsers() {
		List<UserBean> usersList = new ArrayList();
		UserBean ub = null;
		
		try {
			Connection con = DBConnection.getCon();
			String query = "select * from users";
			
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
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
				
				usersList.add(ub);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return usersList;
	}

	public static int fetchTeamId() {
		int teamId = 0;
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select max(team_id) from teams");
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				teamId = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return teamId;
	}
	
	
}

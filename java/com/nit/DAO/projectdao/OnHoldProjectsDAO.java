package com.nit.DAO.projectdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nit.beans.ProjectsBean;
import com.nit.utils.DBConnection;

public class OnHoldProjectsDAO {

	public static List<ProjectsBean> fetchProjects(String uname) {
		 List<ProjectsBean> projects = new ArrayList<>();
		 Connection con = null;
		 ProjectsBean pb = null;
		 try {
			 // Accessing DB connection
			 con = DBConnection.getCon();
			 
			 // Fetch user's assigned projects
			 String projectQuery = "SELECT p.project_id, p.project_name, p.description,p.status, p.start_date, p.end_date, p.username, p.progress " +
					 "FROM projects p INNER JOIN users_projects up ON p.project_id = up.project_id " +
					 "WHERE p.status = 'On-hold' and up.user_id = ?";
			 PreparedStatement ps = con.prepareStatement(projectQuery);
			 ps.setString(1, uname);
			 ResultSet rs = ps.executeQuery();
			 
			 while (rs.next()) {
				 pb = new ProjectsBean();
				 pb.setProjectId(rs.getInt("project_id"));
				 pb.setProjectName(rs.getString("project_name"));
				 pb.setDescription(rs.getString("description"));
				 pb.setStatus(rs.getString("status"));
				 pb.setStartDate(rs.getDate("start_date"));
				 pb.setEndDate(rs.getDate("end_date"));
				 pb.setUsername(rs.getString("username"));
				 pb.setProgress(rs.getInt("progress"));
				 		
				 projects.add(pb);	
			 }
		 }catch (SQLException e) {
			 e.printStackTrace();
			 //   response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch project data.");
		 }
		 System.out.println("Projects List : " + projects);

		 return projects;
	}

}

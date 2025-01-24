package com.nit.DAO.projectdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nit.beans.ProjectsBean;
import com.nit.utils.DBConnection;

public class ProjectDetailsDAO {

	public static List<ProjectsBean> fetchProjects() {
		List<ProjectsBean> projects = new ArrayList<>();
		 ProjectsBean pb = null;
		 try {
			 // Accessing DB connection
			 Connection con = DBConnection.getCon();
			 
			 // Fetch user's assigned projects
			 String projectQuery = "Select * from projects order by progress";
			 PreparedStatement ps = con.prepareStatement(projectQuery);
			 
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
//		 System.out.println("Projects List : " + projects);

		 return projects;
	}

	public static List<ProjectsBean> fetchActiveProjects() {
		List<ProjectsBean> projects = new ArrayList<>();
		 ProjectsBean pb = null;
		 try {
			 // Accessing DB connection
			 Connection con = DBConnection.getCon();
			 
			 // Fetch user's assigned projects
			 String projectQuery = "Select * from projects where status = 'Active' order by progress ";
			 PreparedStatement ps = con.prepareStatement(projectQuery);
			 
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
//		 System.out.println("Projects List : " + projects);

		 return projects;
	}

	public static List<ProjectsBean> fetchInProgressProjects() {
		List<ProjectsBean> projects = new ArrayList<>();
		 ProjectsBean pb = null;
		 try {
			 // Accessing DB connection
			 Connection con = DBConnection.getCon();
			 
			 // Fetch user's assigned projects
			 String projectQuery = "Select * from projects where status = 'In-progress' order by progress ";
			 PreparedStatement ps = con.prepareStatement(projectQuery);
			 
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
//		 System.out.println("Projects List : " + projects);

		 return projects;
	}

	public static List<ProjectsBean> fetchCompletedProjects() {
		List<ProjectsBean> projects = new ArrayList<>();
		 ProjectsBean pb = null;
		 try {
			 // Accessing DB connection
			 Connection con = DBConnection.getCon();
			 
			 // Fetch user's assigned projects
			 String projectQuery = "Select * from projects where status = 'Completed' order by progress ";
			 PreparedStatement ps = con.prepareStatement(projectQuery);
			 
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
//		 System.out.println("Projects List : " + projects);

		 return projects;
	}

	public static List<ProjectsBean> fetchProjectById(String projectId) {
		List<ProjectsBean> projects = new ArrayList<>();
		 ProjectsBean pb = null;
		 try {
			 // Accessing DB connection
			 Connection con = DBConnection.getCon();
			 
			 // Fetch user's assigned projects
			 String projectQuery = "Select * from projects where project_id = ?";
			 PreparedStatement ps = con.prepareStatement(projectQuery);
			 ps.setString(1, projectId);
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
//		 System.out.println("Projects List : " + projects);

		 return projects;
	}

}

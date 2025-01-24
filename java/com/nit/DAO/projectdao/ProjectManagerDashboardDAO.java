package com.nit.DAO.projectdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nit.beans.ProjectsBean;
import com.nit.beans.TasksBean;
import com.nit.beans.TeamsBean;
import com.nit.utils.DBConnection;

public class ProjectManagerDashboardDAO {

	public static List<ProjectsBean> projectProgress() {
		List<ProjectsBean> projectProgressList = new ArrayList<>();
        String query = "SELECT p.PROJECT_ID, p.PROJECT_NAME, p.STATUS, " +
                       "NVL(AVG(t.PROGRESS), 0) AS PROGRESS " +
                       "FROM projects p " +
                       "LEFT JOIN tasks t ON p.PROJECT_ID = t.PROJECT_ID " +
                       "GROUP BY p.PROJECT_ID, p.PROJECT_NAME, p.STATUS";
        try{
        	Connection con = DBConnection.getCon();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
             
            while (rs.next()) {
                ProjectsBean project = new ProjectsBean();
                project.setProjectId(rs.getInt("PROJECT_ID"));
                project.setProjectName(rs.getString("PROJECT_NAME"));
                project.setStatus(rs.getString("STATUS"));
                project.setProgress(rs.getInt("PROGRESS"));
                projectProgressList.add(project);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
//        System.out.println("Project Progress : " +projectProgressList);
        return projectProgressList;
	}

	public static Map<String, Integer> getTeamPerformance(String uname) {
		Map<String, Integer> teamPerformance = new HashMap<>();
        String query ="SELECT t.ASSIGNED_USER, SUM(t.PROGRESS) AS TOTAL_PROGRESS  FROM tasks t  JOIN projects p ON t.PROJECT_ID = p.PROJECT_ID WHERE p.username = ?  GROUP BY t.ASSIGNED_USER";

        try{ 
        	Connection con = DBConnection.getCon();
            PreparedStatement ps = con.prepareStatement(query);             
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                String user = rs.getString("ASSIGNED_USER");
                int progress = rs.getInt("TOTAL_PROGRESS");
                teamPerformance.put(user, progress);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return teamPerformance;
	}

	public static List<TasksBean> getUpcomingDeadlines(String uname) {
		List<TasksBean> deadlines = new ArrayList<>();
	    String query = "SELECT t.TASK_NAME, t.DUE_DATE " +
	                   "FROM tasks t " +
	                   "JOIN projects p ON t.PROJECT_ID = p.PROJECT_ID " +
	                   "WHERE p.username = ? AND t.DUE_DATE > SYSDATE " +
	                   "ORDER BY t.DUE_DATE";

	    try{
	    	Connection con = DBConnection.getCon();
	        PreparedStatement ps = con.prepareStatement(query);	         
	        ps.setString(1, uname);
	        ResultSet rs = ps.executeQuery();
	        
	        while (rs.next()) {
	            TasksBean task = new TasksBean();
	            task.setTaskName(rs.getString("TASK_NAME"));
	            task.setDueDate(rs.getDate("DUE_DATE"));
	            deadlines.add(task);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
//	    System.out.println("Deadlines : "+deadlines);
	    return deadlines;
	}

	public static List<ProjectsBean> fetchProjects() {
		List<ProjectsBean> projectList = new ArrayList<>();
		ProjectsBean pb = null;
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select * from projects");
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
		return projectList;
	}

	public static List<TeamsBean> fetchTeams() {
		List<TeamsBean> teamLeaders = new ArrayList<>();
		TeamsBean tb = null;
		try {
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("select team_lead from teams");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				tb = new TeamsBean();
				tb.setTeamLead(rs.getString("team_lead"));
				
				teamLeaders.add(tb);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return teamLeaders;
	}

	public static List<TasksBean> projectAssignDetails(String assigned_by) {
		List<TasksBean> userList = new ArrayList<>();

        try 
        { Connection con = DBConnection.getCon();
             PreparedStatement ps = con.prepareStatement("SELECT ASSIGNED_USER FROM TASKS WHERE ASSIGNED_BY = ?");

            ps.setString(1, assigned_by);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TasksBean task = new TasksBean();
                    task.setAssignedUser(rs.getString("ASSIGNED_USER"));
                    userList.add(task);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
	}
	
	
}

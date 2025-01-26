package com.nit.DAO.projectdao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nit.beans.ManagerTasksBean;
import com.nit.beans.TeamLeadTasksBean;
import com.nit.utils.DBConnection;

public class ManagerTasksDAO {


	public static List<TeamLeadTasksBean> fetchTasks() {
		List<TeamLeadTasksBean> tasksList = new ArrayList<>();
		TeamLeadTasksBean tb = null;
		try {
			Connection con = DBConnection.getCon();
			String query = "select * from team_lead_tasks";
			
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				tb = new TeamLeadTasksBean();
				tb.setTaskId(rs.getInt("task_id"));
				tb.setProjectName(rs.getString("project_name"));
				tb.setTaskTitle(rs.getString("task_title"));
				tb.setTaskDescription(rs.getString("task_description"));
				tb.setDueDate(rs.getDate("due_date"));
				tb.setAssignedTo(rs.getString("assigned_to"));
				
				tasksList.add(tb);
			}
	        
		}catch(Exception e) {
			e.printStackTrace();
		}
		return tasksList;
	}

	public static int addTask(String clientName, String projectName, String taskTitle, String taskDescription,
			String priority, String dueDate) {
		int result = 0;
		try {
			Connection con = DBConnection.getCon();
			String query = "insert into manager_tasks (assigned_by_client,project_name,task_name,task_description,priority,due_date,) values(?,?,?,?,?, TO_DATE(?, 'YYYY-MM-DD'))";
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, clientName);
			ps.setString(2, projectName);
	        ps.setString(3, taskTitle);
	        ps.setString(4, taskDescription);
	        ps.setString(5, priority);
	        ps.setString(6, dueDate);
	        System.out.print("task Priority :"+priority);
	        result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static List<ManagerTasksBean> fetchManagerTasks() {
		List<ManagerTasksBean> tasksList = new ArrayList<>();
		ManagerTasksBean tb = null;
		try {
			Connection con = DBConnection.getCon();
			String query = "select * from manager_tasks";
			
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				tb = new ManagerTasksBean();
				tb.setTaskId(rs.getInt("task_id"));
				tb.setTaskName(rs.getString("task_name"));
				tb.setTaskDescription(rs.getString("task_description"));
				tb.setAssignedByClient(rs.getString("assigned_by_client"));
				tb.setPriority(rs.getString("priority"));
				tb.setAssignedDate(rs.getDate("assigned_date"));
				tb.setProjectName(rs.getString("project_name"));
				tb.setTaskName(rs.getString("task_name"));
				tb.setDueDate(rs.getDate("due_date"));
				tb.setCompletionDate(rs.getDate("completion_date"));
				
				tasksList.add(tb);
			}
	        
		}catch(Exception e) {
			e.printStackTrace();
		}
		return tasksList;
	}

	public static int insertTask(String projectName, String taskTitle, String taskDescription, Date dueDate,
			String assignedTo, String companyName, String priority) {
		int result = 0;
		try {
			Connection con = DBConnection.getCon();
			String query = "insert into team_lead_tasks (project_name,task_title,task_description,due_date,ASSIGNED_TO,task_created_on,company_name,priority) values(?,?,?, TO_DATE(?, 'YYYY-MM-DD'),?,sysdate,?,?)";	
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, projectName);
			ps.setString(2, taskTitle);
			ps.setString(3, taskDescription);
			ps.setDate(4, dueDate);
			ps.setString(5, assignedTo);
			ps.setString(6, companyName);
			ps.setString(7, priority);
			
			result = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}

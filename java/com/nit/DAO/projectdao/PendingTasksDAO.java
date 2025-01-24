package com.nit.DAO.projectdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nit.beans.TasksBean;
import com.nit.utils.DBConnection;

public class PendingTasksDAO {

	public static List<TasksBean> fetchPendingTasks(String uname) {
		List<TasksBean> pendingTasksList = new ArrayList<>();
		TasksBean tb1 = null;
		Connection con = null;
		try {
			con = DBConnection.getCon();
			String query = "select * from tasks where status = 'pending' and assigned_user = ? order by priority desc, due_date asc";
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				tb1 = new TasksBean();
				tb1.setTaskId(rs.getInt("task_id"));
				tb1.setTaskName(rs.getString("task_name"));
				tb1.setDescription(rs.getString("description"));
				tb1.setStatus(rs.getString("status"));
				tb1.setDueDate(rs.getDate("due_date"));
				tb1.setProjectId(rs.getInt("project_id"));
				tb1.setAssignedUser(rs.getString("assigned_user"));
				tb1.setCreatedOn(rs.getDate("task_created_on"));
				tb1.setAssignedBy(rs.getString("assigned_by"));
				tb1.setPriority(rs.getNString("priority"));
				tb1.setProgress(rs.getInt("progress"));
				tb1.setCompletionDate(rs.getDate("completion_date"));
				
				pendingTasksList.add(tb1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("Pending Tasks List "+pendingTasksList);
		return pendingTasksList;
	}

}

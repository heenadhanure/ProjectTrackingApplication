package com.nit.DAO.projectdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.nit.beans.TasksBean;
import com.nit.utils.DBConnection;

public class InProgressTasksDAO {

	public static List<TasksBean> fetchInprogressTasks(String uname) {
		List<TasksBean> inProgressTasks = new ArrayList<>();
		TasksBean tb = null;
		Connection con = null;
		
		try {
			con = DBConnection.getCon();
			String query = "select * from tasks where status = 'in-progress' and assigned_user = ? order by priority desc, due_date asc";
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, uname);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				tb = new TasksBean();
				tb.setTaskId(rs.getInt("task_id"));
				tb.setTaskName(rs.getString("task_name"));
				tb.setDescription(rs.getString("description"));
				tb.setStatus(rs.getString("status"));
				tb.setDueDate(rs.getDate("due_date"));
				tb.setProjectId(rs.getInt("project_id"));
				tb.setAssignedUser(rs.getString("assigned_user"));
				tb.setCreatedOn(rs.getDate("task_created_on"));
				tb.setAssignedBy(rs.getString("assigned_by"));
				tb.setPriority(rs.getNString("priority"));
				tb.setProgress(rs.getInt("progress"));
				tb.setCompletionDate(rs.getDate("completion_date"));
				
				inProgressTasks.add(tb);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("In-progress Tasks : "+inProgressTasks);
		return inProgressTasks;
	}

}

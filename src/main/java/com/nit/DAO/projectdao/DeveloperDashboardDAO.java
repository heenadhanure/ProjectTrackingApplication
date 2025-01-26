package com.nit.DAO.projectdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nit.beans.BugBean;
import com.nit.beans.DocumentationBean;
import com.nit.beans.NotificationBean;
import com.nit.beans.ProjectsBean;
import com.nit.beans.TasksBean;
import com.nit.utils.DBConnection;

public class DeveloperDashboardDAO {
	 private static Connection con = null;
	 
	 public static List<ProjectsBean> fetchProjects(String uname) {
		 List<ProjectsBean> projects = new ArrayList<>();
		 ProjectsBean pb = null;
		 try {
			 // Accessing DB connection
			 con = DBConnection.getCon();
			 
			 // Fetch user's assigned projects
			 String projectQuery = "SELECT p.project_id, p.project_name, p.description,p.status, p.start_date, p.end_date, p.username, p.progress " +
					 "FROM projects p INNER JOIN users_projects up ON p.project_id = up.project_id " +
					 "WHERE up.user_id = ?";
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
	 
	 public static List<TasksBean> fetchTasks(String uname) {
		    System.out.println("TaskDAO.fetch() " + uname);
		    List<TasksBean> tasklist = new ArrayList<>();
		    TasksBean tb = null;
		    try {
		    	// Accessing DB connection
		        con = DBConnection.getCon();
		        String query = "SELECT task_id, task_name, description, status, due_date, project_id, assigned_user, task_created_on, assigned_by, priority, progress,completion_date " +
		                       "FROM tasks WHERE assigned_user = ?";
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setString(1, uname);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
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
		            tb.setPriority(rs.getString("priority"));
		            tb.setProgress(rs.getInt("progress"));
		            tb.setCompletionDate(rs.getDate("completion_date"));
		            tasklist.add(tb);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    System.out.println(tasklist);
		    return tasklist;
		}

		public static List<NotificationBean> fetchNotifications(String uname) {
			List<NotificationBean> notificationList = new ArrayList<>();
	        NotificationBean notification = null;
	        
	        try {
	            // Accessing DB connection
	            con = DBConnection.getCon();
	            String query = "SELECT notification_id, message, created_at FROM notifications WHERE developer_id = ? ORDER BY created_at DESC";
	            PreparedStatement ps = con.prepareStatement(query);
	            ps.setString(1, uname);  // Setting the user_id dynamically

	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {
	                notification = new NotificationBean();
	                notification.setNotificationId(rs.getInt("notification_id"));
	                notification.setNotificationMessage(rs.getString("message"));
	                notification.setCreatedAt(rs.getDate("created_at"));
	                notificationList.add(notification);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
			return notificationList;
		}

		public static List<BugBean> fetchBugs(String uname) {
		     List<BugBean> bugs = new ArrayList<>();
		        try  {
		        	// Accessing DB connection
		        	con = DBConnection.getCon();
		            String query = "SELECT bug_id, title, severity, developer_id, status, created_at, updated_at, description " +
		                           "FROM bugs WHERE developer_id = ?";
		            PreparedStatement ps = con.prepareStatement(query);
		            ps.setString(1, uname);

		            ResultSet rs = ps.executeQuery();
		            while (rs.next()) {
		                BugBean bug = new BugBean();
		                bug.setBugId(rs.getInt("bug_id"));
		                bug.setTitle(rs.getString("title"));
		                bug.setDeveloper_id(rs.getString("developer_id"));
		                bug.setStatus(rs.getString("status"));
		                bug.setCreatedAt(rs.getTimestamp("created_at"));
		                bug.setUpdatedAt(rs.getTimestamp("updated_at"));
		                bug.setDescription(rs.getString("description"));
		                bugs.add(bug);
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		       }
			return bugs;
		}

		public static List<DocumentationBean> fetchDocuments(String uname) {
			List<DocumentationBean> documents = new ArrayList<>();
			DocumentationBean db = null;
			try {
				con = DBConnection.getCon();
				String query = "SELECT * FROM documentation";
			    PreparedStatement stmt = con.prepareStatement(query);
			    ResultSet rs = stmt.executeQuery();
			    
			    while(rs.next()) {
			    	db = new DocumentationBean();
			    	db.setId(rs.getInt("id"));
			    	db.setDoc_title(rs.getString("doc_title"));
			    	db.setDoc_url(rs.getString("doc_url"));
			    	db.setDescription(rs.getString("description"));
			    	
			    	documents.add(db);
			   }
			    
			}catch(Exception e) {
				e.printStackTrace();
			}
			return documents;
		}

		public static int fetchPendingTasksCount(String uname) {
			int pendingTasksCount = 0;
			if (uname != null) { // Ensure user is logged in
		        try {
		        	Connection connection = DBConnection.getCon();
		            String query = "SELECT COUNT(*) FROM tasks WHERE status = 'pending' AND assigned_user = ?";
		            PreparedStatement statement = connection.prepareStatement(query);
		            statement.setString(1, uname); // Set the username in the query

		            ResultSet resultSet = statement.executeQuery();
		            if (resultSet.next()) {
		                  pendingTasksCount = resultSet.getInt(1); // Get the count
		            }
		    }
		     catch (Exception e) {
			        e.printStackTrace();
			    }
			}
			System.out.println("Pending Tasks Count : "+ pendingTasksCount);
			return pendingTasksCount;
		}

		public static int fetchInProgressTasksCount(String uname) {
			int inProgressTasksCount = 0;
			if (uname != null) { // Ensure user is logged in
		        try {
		        	Connection connection = DBConnection.getCon();		        
		            String query = "SELECT COUNT(*) FROM tasks WHERE status = 'in-progress' AND assigned_user = ?";
		            PreparedStatement statement = connection.prepareStatement(query);
		            statement.setString(1, uname); // Set the username in the query
		            ResultSet resultSet = statement.executeQuery();
		              if (resultSet.next()) {
		                	inProgressTasksCount = resultSet.getInt(1); // Get the count
		               }
		         } catch (Exception e) {
			        e.printStackTrace();
			    }
			}
			System.out.println("In-progress Tasks Count : "+ inProgressTasksCount);
			return inProgressTasksCount;
		}

		public static int fetchCompletedTasksCount(String uname) {
			int completedTasksCount = 0;
			if (uname != null) { // Ensure user is logged in
				try {
			        Connection connection = DBConnection.getCon();
			        String query = "SELECT COUNT(*) FROM tasks WHERE status = 'completed' AND assigned_user = ?";
			        PreparedStatement statement = connection.prepareStatement(query);
			        statement.setString(1, uname); // Set the username in the query
	                ResultSet resultSet = statement.executeQuery();
			        if (resultSet.next()) {
			           	completedTasksCount = resultSet.getInt(1); // Get the count
			         }
		        } catch (Exception e) {
			        e.printStackTrace();
			    }
			}
			System.out.println("Completed Tasks Count : "+completedTasksCount);
			return completedTasksCount;
		}
}
	 
	 












//	public static List<TasksBean> fetch(String uname) {
//		
//		System.out.println("TaskDAO.fetch()"+uname);
//		int count =0;
//		 List<TasksBean> tasklist = new ArrayList<>();
//		 TasksBean tb=null;
//		 try {
//			 con = DBConnection.getCon();
//			 PreparedStatement ps = con.prepareStatement("SELECT task_id, task_name, description, status, due_date, project_id, assigned_user FROM tasks WHERE assigned_user = 'heena_dhanure'");
//			 
//			//ps.setString(1, uname);
//			ResultSet rs = ps.executeQuery();
//			
//			
//			if(rs.next()){
//				
//				tb.setTaskId(rs.getInt(1));
//				tb.setTaskName(rs.getString(2));
//				tb.setDescription(rs.getString(3));
//				tb.setStatus(rs.getString(4));
//				tb.setDueDate(rs.getDate(5));
//				tb.setProjectId(rs.getInt(6));
//				tb.setAssignedUser(rs.getString(7));
//			
//			
//				tasklist.add(tb);
//				tasklist.forEach(System.out::print);
//				
//			}
//			
//			
//			
//			
//			
//			
//			
//			
//			
//			
////			while(rs.next()) {
////				System.out.println("**************************************************");
////				tb= new TasksBean();
////				tb.setTaskId(rs.getInt("TASK_ID"));
////				tb.setTaskName(rs.getString("task_name"));
////				tb.setDescription(rs.getString("DESCRIPTION"));
////				tb.setStatus(rs.getString("status"));
////				tb.setDueDate(rs.getDate("dueDate"));
////			 tb.setProjectId(rs.getInt("PROJECT_ID"));
////			 tb.setAssignedUser(rs.getString("ASSIGNED_USER"));
////			 
////			 
////			 tasklist.add(tb);
////			 System.out.println(count);
////			}
//				 
//	     }catch(Exception e) {
//			 e.printStackTrace();
//		 }
//		 System.out.println(Arrays.asList(tasklist));
//		 
//		return tasklist;
//	}

		

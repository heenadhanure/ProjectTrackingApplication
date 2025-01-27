<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.UserBean,com.nit.beans.TasksBean" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="ISO-8859-1">
	 <title>My Tasks</title>
	 <link rel="stylesheet" href="CSS/tasks.css" />
</head>
<body>
	<%
		UserBean ub = (UserBean) session.getAttribute("ubean");
		Integer pendingTasksCount = (Integer) session.getAttribute("pendingCount");
		Integer inProgressTasksCount = (Integer) session.getAttribute("inProgressCount");
		Integer completedTasksCount = (Integer) session.getAttribute("completedCount");
	    
		if (pendingTasksCount == null) {
	        pendingTasksCount = 0; // Default value if not set
	    }
	    
		if(inProgressTasksCount == null){
			inProgressTasksCount = 0;
		}
		
		if(completedTasksCount == null){
			completedTasksCount = 0;
		}
	%>
	<div class="header-bar">
        <h3>Welcome <%= ub.getFirstName() %>&nbsp;!</h3>
    </div>

    <div class="main-layout">
        <div class="sidebar">
            <h3>Task Management</h3>
            <ul>
            	<li><a href="DeveloperDashboard">Dashboard</a>
                <li><a href="DeveloperTasks">All Tasks</a></li>
                <li><a href="PendingTasks">Pending Tasks</a></li>
                <li><a href="InprogressTasks">In progress Tasks</a></li>
                <li><a href="CompletedTasks">Completed</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>

        <div class="content">
          
            <!-- Three containers for task statuses -->
            <div class="container pending">
                <h3>Pending</h3>
                <p id="pendingCount"><%= pendingTasksCount %></p>
            </div>
            <div class="container in-progress">
                <h3>In Progress</h3>
                <p id="inProgressCount"><%= inProgressTasksCount %></p>
            </div>
            <div class="container completed">
                <h3>Completed</h3>
                <p id="completedCount"><%= completedTasksCount %></p>
            </div>

            <!-- Table structure -->
            <table>
                <thead>
                    <tr>
                        <th>Task ID</th>
                        <th>Assigned by</th>
                        <th>Task Name</th>
                        <th>Task Created on</th>
                        <th>Deadline</th>
                        <th>Description</th>
                        <th>Status</th>
                   </tr>
                </thead>
                <tbody>
                    <% 
						List<TasksBean> tasks = (List<TasksBean>) request.getAttribute("srList");
						if (tasks != null && !tasks.isEmpty()) {
						for (TasksBean task : tasks) {
							System.out.println("Tasks Retrieved");
					%>
					<tr>
						<td><%= task.getTaskId() %></td>
						<td><%= task.getAssignedBy() %></td>
					    <td><%= task.getTaskName() %></td>
						<td><%= task.getCreatedOn() %></td>
					    <td><%= task.getDueDate() %></td>
						<td><%= task.getDescription() %></td>
						<td><%= task.getStatus() %></td>		
					</tr>
					<% 
					    }
					  } else {
					%>
					<tr>
					   <td colspan="7" class="text-center">No tasks available.</td>
					   </tr>
					<% } %>
                </tbody>
            </table>
        </div>
    </div>

 <!--    <script>
        function getQueryParameter(name) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name);
        }

        const username = getQueryParameter('username');
        if (username) {
            document.getElementById("userTag").innerText = username;
        }
    </script> -->
</body>
</html>
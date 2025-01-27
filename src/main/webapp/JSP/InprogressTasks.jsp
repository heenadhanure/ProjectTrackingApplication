<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.UserBean,com.nit.beans.TasksBean" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>In-Progress Tasks</title>
	 <link rel="stylesheet" href="CSS/tasks.css">
</head>
<body>
	<%
		UserBean ub = (UserBean) session.getAttribute("ubean"); 
        List<TasksBean> tasks = (List<TasksBean>) request.getAttribute("InProgressTasks");
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
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Task ID</th>
			            <th>Task Name</th>
			            <th>Description</th>
			            <th>Status</th>
			            <th>Due Date</th>
			            <th>Created On</th>
			            <th>Assigned By</th>
			            <th>Priority</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (tasks != null && !tasks.isEmpty()) {
                            for (TasksBean task : tasks) {
                    %>
                    <tr>
                        <td><%= task.getTaskId() %></td>
			            <td><%= task.getTaskName() %></td>
			            <td><%= task.getDescription() %></td>
			            <td><%= task.getStatus() %></td>
			            <td><%= task.getDueDate() %></td>
			            <td><%= task.getCreatedOn() %></td>
			            <td><%= task.getAssignedBy() %></td>
			            <td><%= task.getPriority() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="8">No in-progress tasks available</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
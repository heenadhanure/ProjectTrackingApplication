<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.nit.beans.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tasks</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .header-bar {
            background-color: #333;
            color: white;
            padding: 30px 20px;
            width: 100%;
           	height: 80px;
            display: flex;
            justify-content: flex-start;
            box-sizing: border-box;
        }

        .main-layout {
            display: flex;
            flex-grow: 1;
            padding: 20px;
        }

        .sidebar {
            width: 200px;
            background-color: #f0f0f0;
            padding: 15px;
            height: 100%;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar li {
            margin-bottom: 10px;
        }

        .sidebar a {
            text-decoration: none;
            color: black;
            transition: all 0.3s;
            display: inline-block;
            padding: 10px;
            border-radius: 5px;
        }

        .sidebar a:hover {
            color: #ff9800;
            transform: scale(1.1);
        }

        .content {
            flex-grow: 1;
            padding: 20px;
        }

        .container {
            display: inline-block;
            width: 30%;
            height: 100px;
            margin: 10px;
            text-align: center;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            color: white;
        }

        #userTag {
            margin: 0;
            font-size: 18px;
        }

        .pending {
            background-color: #ff9800;
            
        }

        .in-progress {
            background-color: #2196f3;
        }

        .completed {
            background-color: #4caf50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: 10px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #333;
            color: white;
        }
    </style>
</head>

<body>
	<%
	
	    String msg = (String) request.getAttribute("msg");
	   	if(msg!=null){
	%>
	<script>
		alert("<%= msg %>");     
	</script>
	<%
	   }

		UserBean ub = (UserBean) session.getAttribute("ubean");

	%>
	
   <div class="header-bar">
        <h2 id="userTag"><%= ub.getFirstName() %>&nbsp;<%= ub.getLastName() %></h2>
    </div>

    <div class="main-layout">
        <div class="sidebar">
            <h3>Task Management</h3>
            <ul>
            	<li><a href="ProjectManagerDashboard">Dashboard</a>
                <li><a href="ManagerAddTask">Add task</a></li>
                <li><a href="ManagerAssignTask">Assign Task</a></li>
                <li><a href="viewTasks">View Task</a></li>
                <li><a href="pending">Pending Task</a></li>
                <li><a href="inprogress">In progress Task</a></li>
                <li><a href="#">Completed</a></li>
                <li><a href="logout">LogOut</a></li>
            </ul>
        </div>

        
            <section class="task-table">
                <table>
                    <thead>
                        <tr>
								 <th>Project Name</th>
								 <th>Task Title</th>
								 <th>Task Description</th>
								 <th>Created On</th>
								 <th>Deadline</th>
								 <th>Assigned To</th>								 
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<TeamLeadTasksBean> tasks = (List<TeamLeadTasksBean>) request.getAttribute("tasksList");
                            if (tasks != null) {
                                int count = 1;
                                for (TeamLeadTasksBean task : tasks) {
                        %>
	                            <tr> 									 
									 <td><%= task.getProjectName() %></td>
									 <td><%= task.getTaskTitle() %></td>
									 <td><%= task.getTaskDescription() %></td>
									 <td><%= task.getTaskCreatedOn() %></td>
									 <td><%= task.getDueDate() %>
									 <td><%= task.getAssignedTo() %></td>
                         		 </tr>								
                        <% 
                                }
                            }else{
                         %>
                         		<tr>
								   <td colspan="6" class="text-center">No tasks available.</td>
								</tr>
                         <%       	
                            }
                        %>
                    
                    </tbody>
                </table>
            </section>
       
    </div>
</body>
</html>

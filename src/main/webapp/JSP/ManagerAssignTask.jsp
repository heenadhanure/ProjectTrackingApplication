<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Task</title>
<link rel="stylesheet" href="CSS/tasks.css" />


<style>
    .header-bar {
        height: 80px;
        padding: 30px 20px;
    }
    
    .task-table{
    	margin-left: 20px;
    }
    
    .task-table button{
    	background: #33ade8;
    	color: white;
    	padding: 10px 15px;
    	border-radius: 5px;
    	border: none;
    }
    .task-table a{
    	color:white;
    	text-decoration:none;
    }

/*     .content-area { */
/*         flex: 1; */
/*         padding: 20px; */
/*         background-color: white; */
/*     } */

/*     .form-container { */
/*         background-color: #fff; */
/*         padding: 20px; */
/*         border-radius: 8px; */
/*         box-shadow: 0 2px 4px rgba(0, 0, 0, 0.7); */
/*         max-width: 450px;  */
/*         margin: -10px auto; */
/*     } */

/*     .form-container h2 { */
/*         margin-bottom: 15px; */
/*         text-align: center; */
/*     } */

/*     .form-group { */
/*         margin-bottom: 15px; */
/*     } */

/*     .form-group label { */
/*         display: block; */
/*         margin-bottom: 5px; */
/*         font-weight: bold; */
/*     } */

/*     .form-group input, */
/*     .form-group textarea, */
/*     .form-group select { */
/*         width: 95%; */
/*         padding: 8px; */
/*         font-size: 1rem; */
/*         border: 1px solid #ccc; */
/*         border-radius: 4px; */
/*     } */

/*     .btn-submit { */
/*         display: block; */
/*         width: 100%; */
/*         padding: 10px; */
/*         background-color: #007bff; */
/*         color: #fff; */
/*         border: none; */
/*         border-radius: 4px; */
/*         font-size: 1rem; */
/*         cursor: pointer; */
/*         text-align: center; */
/*     } */

/*     .btn-submit:hover { */
/*         background-color: #0056b3; */
/*     } */
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
        List<ProjectsBean> projects = (List<ProjectsBean>) session.getAttribute("projects");
        List<TeamsBean> teamLeaders = (List<TeamsBean>) session.getAttribute("teamLeaders");
        
    %>

    <!-- Header -->
    <div class="header-bar">
        <h2 id="userTag"><%= ub.getFirstName() %>&nbsp;<%= ub.getLastName() %></h2>
    </div>

    <div class="main-layout">
        <!-- Sidebar Navigation -->
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
							<th>Sr.No.</th>
							<th>Client</th>
						    <th>Project Name</th>
							<th>Task Title</th>
							<th>Task Description</th>
							<th>Created On</th>
							<th>Deadline</th>
						    <th>Priority</th>	
							<th>Action</th>							 
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<ManagerTasksBean> tasks = (List<ManagerTasksBean>) session.getAttribute("managerTasks");
                            if (tasks != null) {
                                int count = 1;
                                for (ManagerTasksBean task : tasks) {
                                	System.out.println("assigned date :"+task.getAssignedDate());
                        %>
	                            <tr> 
	                                <td><%= task.getTaskId() %></td>
	                                <td><%= task.getAssignedByClient() %></td>
	                                <td><%= task.getProjectName() %></td>
	                                <td><%= task.getTaskName() %></td>
	                                <td><%= task.getTaskDescription() %></td>
	                                <td><%= task.getAssignedDate() %></td>
	                                <td><%= task.getDueDate() %></td>
	                                <td><%= task.getPriority() %></td>
	                                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#assignModal" 
									            onclick="setTaskId(<%= task.getTaskId() %>)">Assign</button>
									 </td>
									 
                         		 </tr>								
                        <% 
                                }
                            }else{
                         %>
                         		<tr>
								   <td colspan="8" class="text-center">No tasks available.</td>
								</tr>
                         <%       	
                            }
                        %>
                    
                    </tbody>
                </table>
                <!-- Assign Modal -->
				<div class="modal fade" id="assignModal" tabindex="-1" role="dialog" aria-labelledby="assignModalLabel" aria-hidden="true">
				    <div class="modal-dialog" role="document">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="assignModalLabel">Assign Task to Team Leader</h5>
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
				            </div>
				            <div class="modal-body">
				                <!-- Dropdown to Display Team Leaders -->
				                <form action="AssignManagerTask" method="post">
				                    <!-- Hidden Task ID -->
				                    <input type="hidden" id="taskId" name="taskId">
				                    
				                    <div class="form-group">
				                        <label for="teamLeader">Select Team Leader:</label>
				                        <select class="form-control" id="teamLeader" name="teamLeader" required>
				                            <option value="" disabled selected>-- Select Team Leader --</option>
				                            <% 
				                                if (teamLeaders != null) {
				                                    for (TeamsBean leader : teamLeaders) {
				                            %>
				                                <option value="<%= leader.getTeamLead() %>"><%= leader.getTeamLead() %> <%= leader.getTeamLead() %></option>
				                            <% 
				                                    }
				                                }
				                            %>
				                        </select>
				                    </div>
				                    <button type="submit" class="btn btn-success">Assign</button>
				                </form>
				            </div>
				        </div>
				    </div>
				</div>
                
            </section>
        
    </div>
    
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        $('#assignModal').on('show.bs.modal', function () {
            $.ajax({
                url: "GetTeamLeadersServlet", // Servlet to fetch team leaders
                method: "GET",
                success: function (data) {
                    let dropdown = document.getElementById("teamLeader");
                    dropdown.innerHTML = "<option value='' disabled selected>-- Select Team Leader --</option>";
                    data.forEach(leader => {
                        dropdown.innerHTML += `<option value="${leader.id}">${leader.name}</option>`;
                    });
                },
                error: function () {
                    alert("Failed to load team leaders. Try again.");
                }
            });
        });
    });

    </script>
</body>
</html>

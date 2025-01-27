<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.*" import="java.util.*"%>
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
    .content-area {
        flex: 1;
        padding: 20px;
        background-color: white;
    }

    .form-container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.7);
        max-width: 450px; 
        margin: -10px auto;
    }

    .form-container h2 {
        margin-bottom: 15px;
        text-align: center;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .form-group input,
    .form-group textarea{
        width: 95%;
        padding: 8px;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .form-group select {
    	width:100%;
    	padding: 8px;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 4px;
	}
    .btn-submit {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 1rem;
        cursor: pointer;
        text-align: center;
    }

    .btn-submit:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <%
        UserBean ub = (UserBean) session.getAttribute("ubean");
    	List<ProjectsBean> projects = (List<ProjectsBean>) session.getAttribute("projects");
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
                <li><a href="../ProjectManagerDashboard">Dashboard</a>
                <li><a href="../ManagerAddTask">Add task</a></li>
                <li><a href="../ManagerAssignTask">Assign Task</a></li>
                <li><a href="../viewTasks">View Task</a></li>
                <li><a href="../pending">Pending Task</a></li>
                <li><a href="../inprogress">In progress Task</a></li>
                <li><a href="#">Completed</a></li>
                <li><a href="../logout">LogOut</a></li>
            </ul>
        </div>

		<!-- Content Area -->
        <div class="content-area">
            <div class="form-container">
                <h2>Add New Task</h2>
                <form action="AddManagerTask" method="POST">
					<!-- Client Name -->
                    <div class="form-group">
                        <label for="clientName">Client Name</label>
                        <input type="text" id="clientName" name="clientName" placeholder="Enter Client Name" required>
                    </div>
                    
                    <!-- Select Project Dropdown -->
                    <div class="form-group">
                        <label for="projectName">Select Project</label>
                        <select id="projectName" name="projectName" required>
                            <option value="">-- Select Project --</option>
                            <% if(projects != null){
                            	for(ProjectsBean project : projects) { 
                            		System.out.println("Projects : "+projects);
                            %>
                                <option value="<%= project.getProjectName() %>"><%= project.getProjectName() %></option>
                            <% }
                            }
                              %>
                        </select>
                    </div>

                    <!-- Task Title -->
                    <div class="form-group">
                        <label for="taskTitle">Task Title</label>
                        <input type="text" id="taskTitle" name="taskTitle" placeholder="Enter task title" required>
                    </div>

                    <!-- Task Description -->
                    <div class="form-group">
                        <label for="taskDescription">Task Description</label>
                        <textarea id="taskDescription" name="taskDescription" rows="4" placeholder="Enter task description" required></textarea>
                    </div>
                    
                    <!-- Priority Dropdown -->
                    <div class="form-group">
				        <label for="priority">Priority</label>
	                    <select id="priority" name="priority" required>
	                        <option value="High">High</option>
	                        <option value="Medium" selected>Medium</option>
	                        <option value="Low">Low</option>
	                    </select>
                    </div>

                    <!-- Due Date -->
                    <div class="form-group">
                        <label for="taskDueDate">Due Date</label>
                        <input type="date" id="taskDueDate" name="taskDueDate" required>
                    </div>

<!--                     Assign To Dropdown -->
<!--                     <div class="form-group"> -->
<!--                         <label for="taskAssignee">Assign To</label> -->
<!--                         <select id="taskAssignee" name="taskAssignee" required> -->
<!--                             <option value="">-- Select Team Lead --</option> -->
<%--                             <% for(TeamsBean teamLeader : teamLeaderList) { %> --%>
<%--                                 <option value="<%= teamLeader.getTeamLead() %>"><%= teamLeader.getTeamLead() %></option> --%>
<%--                             <% } %> --%>
<!--                         </select> -->
<!--                     </div> -->

                    <!-- Submit Button -->
                    <button type="submit" class="btn-submit">Add Task</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

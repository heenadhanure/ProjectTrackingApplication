<%@page import="com.nit.beans.TasksBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.UserBean,com.nit.beans.ProjectsBean,com.nit.beans.TasksBean,com.nit.beans.NotificationBean,com.nit.beans.BugBean,com.nit.utils.DBConnection" import="java.sql.*,java.util.*" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
 <link rel="stylesheet" href="CSS/welcome.css">
 
   <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Font Awesome for toggle icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    
  <!-- Chart.js Library -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
<style>
	 body { background-color: #f8f9fa; }
        .dashboard-header { background-color: #007bff; color: white; padding: 20px; text-align: center; }
        .card { margin: 15px; }
    /* Basic styling for the navigation bar */
    nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #333;
        padding: 10px;
    }
    nav ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
    }
    nav ul li {
        margin-right: 20px;
    }
    nav ul li a {
        color: white;
        text-decoration: none;
    }
     .profile-menu {
        position: relative;
        display: inline-block;
        color: white;
    }
    .profile-icon{
    	position: relative;
        display: inline-block;
        color: white;
    }
    /* Profile Dropdown Styling */
        .profile-dropdown {
            border: 2px solid black;
            border-radius: 10px;
            padding: 10px;
            position: absolute;
            top: 30px;
            right: -5px;
            color: white;
            display: none; /* Initially hidden */
            z-index: 1000;
            height: 580px;
            width: 400px;
            margin-left: 1200px;
            background-color: rgb(33, 29, 29);
        }
		.profile-icon1 {
			margin-top: 8px;
			text-align: center;
		}
       .profile-dropdown h5 {
            text-align: center;
            color: white;
            margin-top: 10px;
        }
        
        .profile-dropdown p {
            color: white;
         }

        .action-buttons {
            align-items: center;
            display: flex;
            gap: 10px; /* Space between buttons */
            margin-left: 38%;
            margin-top: -15px;
            margin-bottom: 10px;
        }

        .icon-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 35px;
            height: 35px;
            margin-top: 20px;
            border-radius: 50%;
            background-color: #f0f0f0;
            border: none;
            cursor: pointer;
            font-size: 18px;
            color: #333;
            transition: background-color 0.3s, color 0.3s;
        }

        .icon-btn i {
            font-size: 12px;
        }
        

        /* Different colors for each action */
		.edit-btn { background-color: #e0f7fa; }
		.delete-btn { background-color: #ffebee; }
		
		/* Hover effects */
		.edit-btn:hover { background-color: #b2ebf2; color: #007bff; }   /* Blue for Edit */
		.update-btn:hover { background-color: #c8e6c9; color: #28a745; } /* Green for Update */
		.delete-btn:hover { background-color: #ffcdd2; color: #dc3545; } /* Red for Delete */
		      
     .profile {
        display: grid;
        grid-template-rows: auto 1fr;
        gap: 15px;
        padding: 10px;
        margin-top: -10px;
    }

    /* Grid layout for profile information */
    .profile-info {
        display: grid;
        grid-template-columns: 1fr 2fr;
        gap: 25px 20px;
        color: white;
        margin-left: 10%;
    }

    .profile-info span {
        display: block;
    }

    /* Button styling */
    .cp {
        background-color: #79be89;
        width: 150px;
        margin-top: 6px;
        margin-left: 9%;
        border-radius: 5px;
        padding: 7px;
        cursor: pointer;
        text-align: center;
    }

    .cp:hover {
        background-color: white;
    }

    .logout-link{
        margin-left: 13%;
        margin-bottom:10px;
        color: white;
    }
        /* Logout link hover effect */
        .logout-link:hover {
            color: #d32f2f;
        }
   
 /*   .dropdown {
        display: none;
        position: absolute;
        background-color: white;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }
    .dropdown p, .dropdown a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .dropdown a:hover {
        background-color: #f1f1f1;
    }
    .profile-menu:hover .dropdown {
        display: block;
    }
    */
    
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}


body {
    font-family: Arial, sans-serif;
    background-color: #f4f7fa;
    color: #333;
}



.dashboard {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    padding: 20px;
}

.summary {
    grid-column: span 3;
    display: flex;
    justify-content: space-between;
}

.metric {
    background-color: white;
    padding: 15px;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    width: 20%;
}

.progress-bar {
    background-color: #e0e0e0;
    border-radius: 5px;
    overflow: hidden;
    height: 10px;
    margin-top: 10px;
}

.progress {
    background-color: #1e88e5;
    height: 100%;
}

.calendar, .tasks, .team-hours, .projects, .activity-chart {
    background-color: white;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.projects table {
    width: 100%;
    border-collapse: collapse;
}

.projects th, .projects td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.documentation-section {
    padding: 20px;
    background-color: #f8f9fa;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.documentation-section h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #343a40;
}

.documentation-section h3 {
    margin-bottom: 10px;
    color: #495057;
}

.documentation-section ul {
    list-style: none;
    padding: 0;
}

.documentation-section ul li {
    margin-bottom: 10px;
}

.documentation-section ul li a {
    color: #007bff;
    text-decoration: none;
}

.documentation-section ul li a:hover {
    text-decoration: underline;
}

.progress {
        border-radius: 10px;
        background-color: #f4f4f4;
    }
    .progress-bar {
        border-radius: 10px;
        font-weight: bold;
    }
    .progress-text {
        color: white;
        font-size: 16px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

 <!-- Custom Styles for Dark Theme -->
    <style>
        body.dark-theme {
            background-color: #121212;
            color: #ffffff;
        }
        .dark-theme .card {
            background-color: #1f1f1f;
            color: #ffffff;
        }
        .dark-theme .btn-primary {
            background-color: #007bff;
        }
        .dark-theme .btn-outline-secondary {
            border-color: #ffffff;
        }
        .dark-theme .table-bordered {
        	border-color: 1px solid white;
        }
        .dark-theme tr td{
        	color:white;
        }
        .dark-theme tr td:hover{
        	color:black;
        }
        
 /* Custom styling for the toggle button */
        .toggle-btn {
            width: 40px;
            height: 25px;
            border-radius: 30px;
            display: flex;
            padding: 5px;
            cursor: pointer;
            margin-right: -440px;
            margin-top:-10px;
        }

        .toggle-btn i {
            font-size: 30px;
            color: #FFCC00;       
                 
        }

        .dark-theme {
            background-color: black;
            color: white;
        }
</style>
<script>
 /*   function toggleDropdown() {
        document.getElementById("profileDropdown").classList.toggle("show");
    }

    window.onclick = function(event) {
        if (!event.target.matches('#profile-icon')) {
            var dropdowns = document.getElementsByClassName("dropdown");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }	*/
    
    function showProfile() {
        const dropdown = document.getElementById('profileDropdown');
        dropdown.style.display = dropdown.style.display === 'none' ? 'block' : 'none';
    }
    document.addEventListener('click', function(event) {
        const dropdown = document.getElementById('profileDropdown');
        if (!event.target.closest('.profile-icon') && dropdown) {
            dropdown.style.display = 'none';
        }
    });

    function logoutFunction() {
        if (confirm("Are you sure you want to log out?")) {
            window.location.href = "logout"; // Replace with your actual logout URL
        }
    }
 // Show icon if image fails to load
    function handleImageError(imgElement, iconId) {
        imgElement.style.display = 'none'; // Hide the broken image
        document.getElementById(iconId).style.display = 'block'; // Show default icon
    }

    // Load images with error handling
    document.getElementById("mainProfileImage").onerror = function() {
        handleImageError(this, 'defaultProfileIcon');
    };
    document.getElementById("dropdownProfileImage").onerror = function() {
        handleImageError(this, 'defaultDropdownIcon');
    };
    
    
</script>
<title>Dashboard</title>
    
</head>
<body>
	<%
	// Retrieve the UserBean from session scope
			 UserBean ub = (UserBean) session.getAttribute("ubean");
			String role = ub.getRole();
			if (ub != null) {
		        role = ub.getRole();
		    }
			if (ub == null || role == null) {
				response.sendRedirect("login.html");
				return;
			}
	%>
	
	<!--  Navigation Bar -->
	<nav>
		<ul>
		    <% if ("project manager".equals(role)) { %>
                <li><a href="#">Dashboard</a></li>
                <li><a href="projectsDetails">Projects</a></li>
                <li><a href="viewTasks">Tasks</a></li>
                <li><a href="fetchProjects">Teams</a></li>
                
            <% } else if ("Team Lead".equals(role)) { %>
                <li><a href="JSP/Login.jsp">Dashboard</a></li>
                <li><a href="teamTasks.jsp">Team Tasks</a></li>
                <li><a href="calendar.jsp">Calendar</a></li>
                
            <% } else if ("Developer".equals(role)) { %>
                <li><a href="#">Dashboard</a></li>
                <li><a href="DeveloperTasks">My Tasks</a></li>
                <li><a href="DeveloperProjects">My Projects</a></li>
                <li><a href="NotificationServlet">Notifications</a></li>
            <% } %>           
        </ul>
    
		    <div class="d-flex justify-content-end">
		        <!-- On/Off toggle switch button -->
		        <div class="toggle-btn" id="themeToggleBtn" onclick="toggleTheme()">
		            <i class="fas fa-toggle-off 4x" id="themeIcon"></i> <!-- Off icon (default state) -->
		        </div>
		    </div>
		
	<!-- <ul>
	        <li><a href="#">Dashboard</a></li>
            <li><a href="projects.jsp">My Projects</a></li>
            <li><a href="JSP/Tasks.jsp">Tasks</a></li>
            <li><a href="reports.html">Reports</a></li>

	</ul> -->
		
		 <!-- Profile Icon with Dropdown -->
	    <div class="profile-menu">
	        <span><%= ub.getFirstName() %></span>
	        <div class="profile-icon" onclick="showProfile()">
	        <img id="mainProfileImage" src="" alt="">
	        <i class="fas fa-user-circle" id="defaultProfileIcon" onclick="toggleDropdown()"></i>
	    </div>

    <div class="profile-dropdown" id="profileDropdown" style="display: none;">
        <div class="profile-icon1">
            <img id="dropdownProfileImage" src=<%= ub.getProfileImage() %> alt="">
            <i class="fas fa-user-circle fa-4x" id="defaultDropdownIcon"></i>
        </div>

        <h5><%= ub.getFirstName() %>&nbsp;<%= ub.getLastName() %></h5>
         <!-- Icons with labels -->
         <div class="action-buttons">
           <a href="editProfile"> <button class="icon-btn edit-btn" title="Edit Profile">
               <i class="fas fa-edit"></i>
            </button></a>
           
            <a href="../deleteProfile"><button class="icon-btn delete-btn" title="Delete Profile">
               <i class="fas fa-trash-alt"></i>
            </button></a>
         </div>
			<hr>
        <div class="profile">
            <div class="profile-info">
                 <span>Username&nbsp;:</span> <span><%= ub.getUserName() %></span>
                <span>First Name&nbsp;:</span> <span><%= ub.getFirstName() %></span>
                <span>Last Name&nbsp;:</span> <span><%= ub.getLastName() %></span>
                <span>Email&nbsp;:</span> <span><%= ub.getEmail() %></span>
                <span>Role&nbsp;:</span> <span><%= ub.getRole() %></span>
                <span>Phone&nbsp;:</span> <span>+91&nbsp;<%= ub.getPhone() %></span>
            </div>
            <button class="cp">Change Password</button>
        </div>

        <a href="javascript:void(0);" onclick="logoutFunction()" class="logout-link">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>
    </div> 
	</nav>
	 <% if ("project manager".equals(role)) { %>
	  <div class="container my-4">
	  <div>
                <a href="JSP/NewProject.jsp" class="btn btn-success">
                    + New Project
                </a>
            </div>
    <div class="row">
        <!-- Dashboard Section -->
        <div class="col-12">
            <!--  <h3 class="text-center mb-4">Project Manager Dashboard</h3>-->
        </div>

        <div class="row mb-4">
	    <!-- Project Progress Section -->
	    <div class="col-md-6">
	        <div class="card">
	            <div class="card-header bg-primary text-white">Project Progress</div>
	            <div class="card-body">
	                <ul class="list-group">
	                    <% 
	                        List<ProjectsBean> projectProgressList = 
	                            (List<ProjectsBean>) request.getAttribute("projectProgressList");
	                        if (projectProgressList != null && !projectProgressList.isEmpty()) {
	                            for (ProjectsBean project : projectProgressList) {
	                    %>
	                    <li class="list-group-item">
	                        <strong>Project Name:</strong> <%= project.getProjectName() %> <br>
	                        <strong>Project ID:</strong> <%= project.getProjectId() %> <br>
	                        <strong>Status:</strong> <%= project.getStatus() %> <br>
	                        <div class="progress mt-2">
	                            <div class="progress-bar" role="progressbar"
	                                style="width: <%= project.getProgress() %>%;" 
	                                aria-valuenow="<%= project.getProgress() %>" 
	                                aria-valuemin="0" aria-valuemax="100">
	                                <%= project.getProgress() %>%
	                            </div>
	                        </div>
	                    </li>
	                    <% 
	                            }
	                        } else { 
	                    %>
	                    <li class="list-group-item">No project progress available.</li>
	                    <% } %>
	                </ul>
	            </div>
	        </div>
	    </div>
	     <!-- Team Performance Section -->
		<div class="col-md-6">
		    <div class="card">
		        <div class="card-header bg-primary text-white">Team Performance</div>
		        <div class="card-body">
		            <canvas id="teamPerformanceChart" style="max-width: 100%; height: 250px;"></canvas>
		        </div>
		    </div>
		</div>
		
		<script>
		    <% 
		        Map<String, Integer> teamPerformance = 
		            (Map<String, Integer>) request.getAttribute("teamPerformance");
		        if (teamPerformance != null) { 
		    %>
		    const teamLabels = <%= teamPerformance.keySet().toString() %>;
		    const teamData = <%= teamPerformance.values().toString() %>;
		    <% } %>
		
		    const ctx = document.getElementById('teamPerformanceChart').getContext('2d');
		    new Chart(ctx, {
		        type: 'bar',
		        data: {
		            labels: teamLabels,
		            datasets: [{
		                label: 'Team Performance',
		                data: teamData,
		                backgroundColor: 'rgba(54, 162, 235, 0.5)',
		                borderColor: 'rgba(54, 162, 235, 1)',
		                borderWidth: 1
		            }]
		        }
		    });
		</script>
		    
		</div>  
	
	      <!-- Upcoming Deadlines Section -->
			<div class="col-md-6">
			    <div class="card">
			        <div class="card-header bg-primary text-white">Upcoming Deadlines</div>
			        <div class="card-body">
			            <ul class="list-group">
			                <% 
			                    List<TasksBean> deadlines = 
			                        (List<TasksBean>) request.getAttribute("deadlines");
			                    if (deadlines != null && !deadlines.isEmpty()) {
			                        for (TasksBean task : deadlines) {
			                %>
			                <li class="list-group-item">
			                    <strong>Task:</strong> <%= task.getTaskName() %><br>
			                    <strong>Due Date:</strong> <%= task.getDueDate() %>
			                </li>
			                <% 
			                        }
			                    } else { 
			                %>
			                <li class="list-group-item">No upcoming deadlines.</li>
			                <% } %>
			            </ul>
			        </div>
			    </div>
			</div>
	
	        <!-- Outstanding Invoices Section -->
	            <div class="col-md-6">
	                <div class="card">
	                    <div class="card-header bg-primary text-white">Outstanding Invoices</div>
	                    <div class="card-body">
	                        <ul class="list-group">
	                            <!-- Add outstanding invoices dynamically -->
	                            <li class="list-group-item">
	                                Invoice #12345: $500
	                            </li>
	                            <li class="list-group-item">No outstanding invoices.</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </div>
	
	        <!-- Row 3: Team Hours Logged and Milestones -->
	        <div class="row mb-4">
	            <!-- Team Hours Logged Section -->
	            <div class="col-md-6">
	                <div class="card">
	                    <div class="card-header bg-primary text-white">Team Hours Logged</div>
	                    <div class="card-body">
	                        <ul class="list-group">
	                            <!-- Add team hours dynamically -->
	                            <li class="list-group-item">
	                                Team Member: 10 hours
	                            </li>
	                            <li class="list-group-item">No hours logged this week.</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	
	            <!-- Milestones Section -->
	            <div class="col-md-6">
	                <div class="card">
	                    <div class="card-header bg-primary text-white">Milestones</div>
	                    <div class="card-body">
	                        <ul class="list-group">
	                            <!-- Add milestones dynamically -->
	                            <li class="list-group-item">
	                                <strong>Milestone Title:</strong> Due by 2024-12-15
	                            </li>
	                            <li class="list-group-item">No milestones available.</li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
		  
	 <% }
	 else if ("Team Lead".equals(role)) { %>
	 <h3>Team Lead Dashboard</h3>
	 
	 	 <ul>
            <li>Monitor Team Tasks</li>
            <li>Communicate with Project Manager</li>
            <li>Generate Task Reports</li>
         </ul>
   <% }
	 else if ("Team Lead".equals(role)) { %>
	 <h3>Team Lead Dashboard</h3>
	 
	 	 <ul>
            <li>Monitor Team Tasks</li>
            <li>Communicate with Project Manager</li>
            <li>Generate Task Reports</li>
         </ul>
	  <% } else if ("Developer".equals(role)) { %>
         <!-- <h3>Developer Dashboard</h3>
            <ul>
                <li>View Assigned Tasks</li>
                <li>Submit Work</li>
                <li>Check Deadlines</li>
            </ul>	-->
            
        <div class="container my-4">
         <div class="row">
         	<!-- Project Overview -->
         	<div class="col-md-12">
				    <div class="card">
				        <div class="card-header bg-primary text-white">Projects Overview</div>
				        <div class="card-body">
				           <div class="row">
			                <% 
			                	List<ProjectsBean> projects = (List<ProjectsBean>) request.getAttribute("projects");
			                    if (projects != null && !projects.isEmpty()) {
			                        for (ProjectsBean project : projects) {
			                %>
			                <div class="col-md-4 mb-3">
			                    <div class="card h-100">
			                        <div class="card-body">
			                            <h5 class="card-title"><%= project.getProjectName() %></h5>
			                            <p class="card-text"><%= project.getStatus() %></p>
			                            <p><strong>Start Date:</strong> <%= project.getStartDate() %></p>
			                            <p><strong>End Date:</strong> <%= project.getEndDate() %></p>
			                            <a href="DeveloperProjects" class="btn btn-primary">View Details</a>
			                        </div>
			                    </div>
			                </div>
			                <% 
			                     }
			                    } else {
			                %>
			                <div class="col-12 text-center">
			                    <p>No projects available.</p>
			                </div>
			                <% } %>
			            </div>
			        </div>
			    </div>
			</div>

            <!-- Task Overview -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">Task Overview</div>
                    <div class="card-body">
                        <table class="table table-bordered">
						    <thead class="table-dark">
						        <tr>
						            <th>Task Name</th>
						            <th>Due Date</th>
						            <th>Status</th>
						            <th>Details</th>
						        </tr>
						    </thead>
						    <tbody>
						        <% 
						            List<TasksBean> tasks = (List<TasksBean>) request.getAttribute("srList");
						            if (tasks != null && !tasks.isEmpty()) {
						                for (TasksBean task : tasks) {
						        %>
						        <tr>
						            <td><%= task.getTaskName() %></td>
						            <td><%= task.getDueDate() %></td>
						            <td><%= task.getStatus() %></td>
						            <td><a href="DeveloperTasks">View</a></td>
						        </tr>
						        <% 
						                }
						            } else {
						        %>
						        <tr>
						            <td colspan="3" class="text-center">No tasks available.</td>
						        </tr>
						        <% } %>
						    </tbody>
						</table>
                    </div>
                </div>
            </div>

            <!-- Notifications -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">Notifications</div>
                    <div class="card-body">
                        <ul class="list-group">
                            <% 
                                List<NotificationBean> notifications = (List<NotificationBean>)request.getAttribute("notifications");
                                if (notifications != null && !notifications.isEmpty()) {
                                    for (NotificationBean notification : notifications) {
                            %>
                               <li class="list-group-item">
                                	<strong>Message:</strong> <%= notification.getNotificationMessage() %><br>
			                   </li>
                            <% 
                                    }
                                } else {
                            %>
                                <li class="list-group-item">No notifications.</li>
                            <% } %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Row 1: Bug Tracker and Personal Performance Analytics -->
    <div class="row mb-4">
        <!-- Bug Tracker Section -->
        <div class="col-md-6">
            <div class="card h-100">
                <div class="card-header bg-primary text-white">Bug Tracker</div>
                <div class="card-body">
                    <ul class="list-group">
                        <% 
                            List<BugBean> bugs = (List<BugBean>)request.getAttribute("bugs");
                            if (bugs != null && !bugs.isEmpty()) {
                                for (BugBean bug : bugs) {
                        %>
                            <li class="list-group-item">
                                <strong>BUG ID <%= bug.getBugId() %>: </strong>
                                <%= bug.getTitle() %>
                            </li>
                        <% 
                                }
                            } else {
                        %>
                            <li class="list-group-item">No bugs assigned.</li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Personal Performance Analytics Section -->
        <div class="col-md-6">
  
            <div class="row">
                <!-- Completed Tasks Section -->
                <div class="col-12">
                    <div class="card mb-3">
                    	<div class="card-header bg-primary text-white">Personal Performance Analytics</div>
                        <div class="card-body">
                            <h5 class="card-title">Completed Tasks</h5>
                            <canvas id="taskChart" style="max-width: 250px; max-height: 250px; margin: 0 auto;"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Contribution Percentage Section -->
                <div class="col-md-12">
    				<div class="card">
        				<div class="card-body">
           					 <h5 class="card-title text-center">Your Contribution Percentage</h5>
            					<div class="progress" style="height: 30px; width=100%;">
	                				<div 
					                    class="progress-bar bg-success" 
					                    role="progressbar" 
					                    style="width: 75%;" 
					                    aria-valuenow="85" 
					                    aria-valuemin="0" 
					                    aria-valuemax="100">
					                    75%
				           		 	</div>
				            	</div>
				        </div>
				    </div>
				</div>
			</div>
        </div>
    </div>

    <!-- Row 2: Documentation Section -->
    <div class="row">
        <!-- Documentation Section -->
        <div class="col-12">
            <div class="card h-100">
                <div class="card-header bg-primary text-white">Documentation</div>
                <div class="card-body">
                    <!-- Quick Access Section -->
                    <div class="quick-access">
                        <h5>Quick Access</h5>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="Documents/CommonCriteriaDevelopersGuide.pdf" target="_blank">Developer Guidelines</a>
                            </li>
                            <li class="list-group-item">
                                <a href="Documents/ProjectDocumentTemplate.pdf" target="_blank">Project Documentation</a>
                            </li>
                        </ul>
                    </div>
                    <hr>
                    <!-- API References Section -->
                    <div class="api-references">
                        <h5>API References</h5>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="https://example.com/api-docs/authentication" target="_blank">Authentication API</a>
                            </li>
                            <li class="list-group-item">
                                <a href="#" target="_blank">Data Fetching API</a>
                            </li>
                        </ul>
                    </div>
                    <hr>
                    <!-- Code Snippets Section -->
                    <div class="code-snippets">
                        <h5>Code Snippets</h5>
                        <ul class="list-group">
                            <li class="list-group-item">
                                <a href="#" target="_blank">Java Example</a>
                            </li>
                            <li class="list-group-item">
                                <a href="#" target="_blank">CSS Example</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

        <% } else { %>
            <h3>Unknown Role</h3>
            <p>Please contact the administrator.</p>
        <% } %>
        
    
		<!-- JavaScript for Chart -->
		<script>
		    const ctx = document.getElementById('taskChart').getContext('2d');
		    new Chart(ctx, {
		        type: 'pie',
		        data: {
		            labels: ['Completed Tasks', 'Pending Tasks'],
		            datasets: [{
		                data: [70,30],
		                backgroundColor: ['#007bff', '#e83e8c'], // Custom background colors
		                borderColor: ['#ffffff', '#ffffff'], // Optional: border around segments
		                borderWidth: 2, // Border thickness
		            }]
		        },
		        options: {
		            responsive: true,
		            maintainAspectRatio: false, // Allows custom size
		            plugins: {
		                legend: {
		                    display: true,
		                    position: 'top', // Legend position (will align at the top)
		                    align: 'end', // Align legend to the top-right
		                    labels: {
		                        boxWidth: 15, // Size of color boxes
		                        padding: 10, // Padding between labels
		                        font: {
		                            size: 12 // Font size for labels
		                        }
		                    }
		                }
		            },
		        },
		    });
		    
		    function toggleTheme() {
		        var body = document.body;
		        var icon = document.getElementById("themeIcon");

		        // Toggle the theme between dark and light
		        body.classList.toggle("dark-theme");

		        // Change the icon to represent the theme
		        if (body.classList.contains("dark-theme")) {
		            icon.classList.remove("fa-toggle-off");
		            icon.classList.add("fa-toggle-on"); // On icon for dark mode
		        } else {
		            icon.classList.remove("fa-toggle-on");
		            icon.classList.add("fa-toggle-off"); // Off icon for light mode
		        }
		    }
		
		</script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Bootstrap JS -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
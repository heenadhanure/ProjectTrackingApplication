<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.UserBean,com.nit.beans.ProjectsBean,com.nit.beans.TeamsBean" import="java.util.*,java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teams</title>
 <link rel="stylesheet" href="CSS/teamOverview.css">
 <!-- Font Awesome for toggle icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  
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
</style>
<script>
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
	        window.location.href = "../logout"; // Replace with your actual logout URL
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
                <li><a href="ProjectManagerDashboard">Dashboard</a></li>
                <li><a href="projects.jsp">Projects</a></li>
                <li><a href="reports.html">Reports</a></li>
                <li><a href="JSP/Tasks.jsp">Tasks</a></li>
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
	

     <div class="teams-container">
        <!-- Header -->
        <header>
            <h1>Teams Management</h1>	
				<div class="project-selector">
				   <form action="fetchProjects" method="get">
			        <label for="projects">Select Project :</label>
			        <select name="project_name" id="projects" onchange="this.form.submit()">
			            <% 
			                // Fetch the project list from the session
			                List<ProjectsBean> projects = (List<ProjectsBean>) session.getAttribute("projects");
			                
			            	if (projects != null ) {
// 			                	System.out.print(projects);
			                    for (ProjectsBean project : projects) { 
			            %>
							<option value="<%= project.getProjectName() %>" data-project-id="<%= project.getProjectId() %>">
							                    <%= project.getProjectName() %>
							                </option>			            
					    <% 
			                    }
			                }
			            %>
			            
			        </select>
			      </form>
		       	</div>
	            <div class="search-bar">
	                <input type="text" placeholder="Search teams or members..." />
	                <button><i class="fas fa-search"></i></button>
	            </div>
        </header>

        <!-- Teams Overview -->
        <section class="team-overview">
            <h2>Teams for Project :<%= session.getAttribute("projectName") %></h2>
            <% 
            	List<TeamsBean> teams = (List<TeamsBean>)session.getAttribute("teams");
            	if(teams != null){
            		for(TeamsBean team : teams){            	
            %>
            <div class="team-card">
                <h3><%= team.getTeamName() %></h3>
                <p><strong>Team Lead:</strong> <%= team.getTeamLead() %></p>
                <p><strong>Members:</strong> <%= team.getMembers() %></p>
                <p><strong>Description:</strong> <%= team.getDescription() %></p>
                <form action="teamDetails" method="get">
                	<input type="hidden" name="team_id" value="<%= team.getTeamId() %>">
                	<button class="view-team-btn">View Details</button>           
                </form>
            </div>
            <% 
			     }
			    } else { 
			 %>
			    <h4>No Teams Assigned</h4>
			 <% } %>  

        <!-- Performance Overview -->
        <section class="performance-overview">
            <h2>Team Performance</h2>
            <div class="progress-container">
                <p>Development Team Progress</p>
                <progress value="65" max="100"></progress>
            </div>
            <div class="progress-container">
                <p>Design Team Progress</p>
                <progress value="75" max="100"></progress>
            </div>
            <div class="progress-container">
                <p>Testing Team Progress</p>
                <progress value="85" max="100"></progress>
            </div>
        </section>

        <!-- Team Actions -->
        <section class="team-actions">
            <h2>Manage Teams</h2>
            <a href="JSP/AddTeam.jsp"><button class="action-btn add-team"><i class="fas fa-plus"></i> Add Team</button></a>
            <a href="JSP/EditTeam"><button class="action-btn edit-team"><i class="fas fa-edit"></i> Edit Team</button></a>
            <a href="JSP/DeleteTeam"><button class="action-btn delete-team"><i class="fas fa-trash"></i> Delete Team</button></a>
        </section>
    </div>
    
    <script>
    
	    function replacePlaceholder(dropdown) {
	        // Get the placeholder option
	        var placeholderOption = document.getElementById("placeholderOption");
	
	        // Get the selected option
	        var selectedOption = dropdown.options[dropdown.selectedIndex];
	
	        // Replace the placeholder text with the selected project's name
	        placeholderOption.text = selectedOption.text;
	
	        // Remove the disabled attribute so it behaves like a normal option
	        placeholderOption.removeAttribute("disabled");
	
	        // Update the dropdown to show the placeholder option as the selected value
	        placeholderOption.selected = true;
	    }
	    
        function updateProjectId() {
            // Get the dropdown list
            var projectDropdown = document.getElementById("project_name");
            // Get the selected option
            var selectedOption = projectDropdown.options[projectDropdown.selectedIndex];
            // Get the project ID from the data attribute
            var projectId = selectedOption.getAttribute("data-project-id");
            // Set the value of the hidden input field
            document.getElementById("projectId").value = projectId;
            console.log(projectId);
        }

        // Set projectId initially on page load
       // window.onload = updateProjectId;
        
    </script>

</body>
</html>
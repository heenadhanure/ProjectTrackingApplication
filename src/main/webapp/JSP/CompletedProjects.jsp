<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.UserBean,com.nit.beans.ProjectsBean" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Completed Projects</title>
	<link rel="stylesheet" href="CSS/tasks.css" />
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<style>
	  .main-layout .sidebar{
	  	width : 250px;
	  }
	  .project-card {
            border: 1px solid grey;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s;
        }
        .project-card:hover {
            transform: translateY(-5px);
        }
        .progress-bar {
            background-color: #007bff;
        }
        .details-modal .modal-header {
            background-color: #007bff;
            color: #fff;
        }
	</style>
</head>
<body>
	<%
		UserBean ub = (UserBean) session.getAttribute("ubean");
	
	%>
	<div class="header-bar">
        <h3>Welcome <%= ub.getFirstName() %>&nbsp;!</h3>
    </div>

    <div class="main-layout">
        <div class="sidebar">
            <h4>Task Management</h4>
            <ul>
            	<li><a href="DeveloperDashboard">Dashboard</a>
                <li><a href="DeveloperProjects">All Projects</a></li>
                <li><a href="ActiveProjects">Active Projects</a></li>
                <li><a href="OnHoldProjects">On-Hold Projects</a></li>
                <li><a href="CompletedProjects">Completed</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>
        
        <!-- Main Content -->
    <div class="container my-5 text-dark">
        <h2 class="text-center mb-4">Completed Projects</h2>   
        
        <div id="projects-list" class="row">
        	<% 
			   List<ProjectsBean> projects = (List<ProjectsBean>) request.getAttribute("projects");
			   if (projects != null && !projects.isEmpty()) {
			       for (ProjectsBean project : projects) {
			    	  System.out.println("Projects : "+project.getProjectName());
			%>
            <!-- Dynamic project cards will go here -->
            <div class="col-md-4">
                <div class="project-card text-dark my-5 text-left">
                    <h5><%= project.getProjectName() %></h5>
                    <p><%= project.getStatus() %></p>
                    <div class="progress my-2">
                        <div class="progress-bar" style="width: <%= project.getProgress() %>%;"><%= project.getProgress() %>% Complete</div>
                    </div>
                    <button class="btn btn-primary btn-sm mt-2" data-toggle="modal" data-target="#projectDetailsModal">View Details</button>
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

    <!-- Modal for Project Details -->
    <div class="modal fade details-modal" id="projectDetailsModal" tabindex="-1" role="dialog" aria-labelledby="projectDetailsLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="projectDetailsLabel">Project Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h4 id="project-title"></h4>
                    <p id="project-description"></p>
                    <div id="project-timeline"></div>
                    <div id="project-contributions"></div>
                    <div id="project-links">
                        <a href="#" id="repo-link" class="btn btn-primary" target="_blank">View Repository</a>
                        <a href="#" id="docs-link" class="btn btn-secondary" target="_blank">View Documentation</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
  
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
  
</body>
</html>
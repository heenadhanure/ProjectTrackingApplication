<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.UserBean,com.nit.beans.ProjectsBean" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Projects Tab</title>
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
            	<li><a href="ProjectManagerDashboard">Dashboard</a>
                <li><a href="projectsDetails">All Projects</a></li>
                <li><a href="ManagerActiveProjects">Active Projects</a></li>
                <li><a href="ManagerInProgressProjects">In-Progress Projects</a></li>
                <li><a href="ManagerCompletedProjects">Completed</a></li>
                <li><a href="logout">Logout</a></li>
            </ul>
        </div>
        
       <!-- Main Content -->
    <div class="container my-5 text-dark">
        <h2 class="text-center mb-4">All Projects</h2>
        <div class="row mb-3">
            <div class="col-md-6">
                <input type="text" id="search" class="form-control" placeholder="Search projects...">
            </div>
            <div class="col-md-6 text-right">
                <select id="filter" class="form-control">
                    <option value="all">All</option>
                    <option value="active">Active</option>
                    <option value="completed">Completed</option>
                    <option value="on-hold">On-Hold</option>
                </select>
            </div>
        </div>
		
</body>
</html>
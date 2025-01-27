<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Team Details</title>
<!-- <link rel="stylesheet/css" href="CSS/TeamDetails.css"> -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: #f4f8fb;
    color: #333;
    line-height: 1.6;
    padding: 20px;
}

/* Main Container */
.team-container {
    max-width: 1100px;
    margin: auto;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px 25px;
}

/* Headings */
.team-container h2, .team-container h3 {
    color: #2c3e50;
    margin-bottom: 10px;
    border-bottom: 3px solid #4a90e2;
    padding-bottom: 5px;
    font-weight: 600;
    letter-spacing: 0.5px;
}

/* Team Info */
.team-container p {
    font-size: 16px;
    margin: 8px 0;
    color: #555;
}

.team-container a{
	text-decoration: underline;
	padding-left: 20px;
	font-size: 20px;
}
.team-container strong {
    color: #444;
}

/* Table Styling */
.team-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
    border-radius: 8px;
    overflow: hidden;
}

.team-table th, .team-table td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #e0e0e0;
}

.team-table th {
    background-color: #4a90e2;
    color: #fff;
    text-transform: uppercase;
    font-size: 14px;
}

.team-table tr:nth-child(even) {
    background-color: #f8f9fd;
}

.team-table tr:hover {
    background-color: #e3f2fd;
}

.team-table td {
    color: #333;
    font-size: 14px;
}

/* No Content Message */
.no-content {
    color: #e74c3c;
    font-size: 16px;
    text-align: center;
    margin: 20px 0;
    font-weight: bold;
}

/* Responsive Design */
@media (max-width: 768px) {
    .team-container {
        padding: 15px;
    }

    .team-table th, .team-table td {
        padding: 8px;
        font-size: 12px;
    }
}

</style>
</head>
<body>
	<%
	    TeamsBean teamDetails = (TeamsBean) request.getAttribute("teamDetails");
	    List<TeamMembersBean> teamMembers = (List<TeamMembersBean>) request.getAttribute("teamMembers");
	%>
	
	<div class="team-container">
		<h2>Team Details</h2>
		<% if (teamDetails != null) { %>
		    <p><strong>Team Name:</strong> <%= teamDetails.getTeamName() %></p>
		    <p><strong>Team Lead:</strong> <%= teamDetails.getTeamLead() %></p>
		    <p><strong>Created Date:</strong> <%= teamDetails.getCreatedDate() %></p>
		<% } else { %>
		    <p>Team details not available.</p>
		<% } %>
		
		<h3>Team Members</h3>
		<% if (teamMembers != null && !teamMembers.isEmpty()) { %>
		    <table class="team-table">
		       <thead>
		         <tr>
		            <th>Member ID</th>
		            <th>Username</th>
		            <th>First Name</th>
		            <th>Last Name</th>
		            <th>Role</th>
		            <th>Email</th>
		            <th>Phone</th>
		            <th>Operation</th>
		        </tr>
		       </thead>
		       <tbody>
		        <% for (TeamMembersBean member : teamMembers) { %>
		            <tr>
		                <td><%= member.getMember_id() %></td>
		                <td><%= member.getUsername() %></td>
		                <td><%= member.getFirstName() %></td>
		                <td><%= member.getLastName() %></td>
		                <td><%= member.getRole() %></td>
		                <td><%= member.getEmail() %></td>
		                <td><%= member.getPhone() %></td>
		                <td><button class="btn btn-danger p-2 w-5 h-1"><i class="fa-solid fa-trash-can"></i>&nbsp;Delete</button></td>
		            </tr>
		        <% } %>
		       </tbody>
		    </table>
		<% } else { %>
		    <p class="no-content">No members found for this team.</p>
		<% } %>
		         <button class="btn btn-primary p-2 my-3"><i class="fa-solid fa-plus"></i>&nbsp;Add Team Member</button>
		         <a href="fetchProjects">Go Back</a>
		
   </div>
</body>
</html>
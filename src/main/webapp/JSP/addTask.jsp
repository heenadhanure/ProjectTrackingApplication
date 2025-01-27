<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Task</title>
<link rel="stylesheet" href="../CSS/addTask.css">
</head>
<body>
	<% 
		UserBean ub = (UserBean)application.getAttribute("ubean");
	%>
	<form action="addTask" method="post">
<!-- Header Bar with User Welcome Message -->
<header>
    Welcome, <span id="userName"><%= ub.getFirstName() %></span>!
</header>

<!-- Left Sidebar with Options -->
<div class="sidebar">
    <a href="#">Task Management</a>
    <a href="#">View Tasks</a>
    <a href="#">Assign Task</a>
    <a href="#">Log Out</a>
</div>

<!-- Main Content Area -->
<div class="content">
    <label for="status">Status:</label>
    <select id="status" name="status" required>
        <option value="pending">Pending</option>
        <option value="in-progress">In Progress</option>
        <option value="completed">Completed</option>
        <option value="deadline"> Deadline</option>
    </select><br>
    <table>
     <tr>
            <td><label for="companyName">Company Name :</label></td>
            <td><input type="text" id="companyName" name="companyName"></td>
        </tr>
        <tr>
            <td><label for="projectId">Project ID :</label></td>
            <td><input type="text" id="projectId" name="projectId"></td>
        </tr>
        <tr>
            <td><label for="taskName">Task Name</label></td>
            <td><input type="text" id="taskName" name="taskName"></td>
        </tr>
        <tr>
            <td><label for="taskCreatedOn">Task Created On</label></td>
            <td><input type="text" id="taskCreatedOn" name="taskCreatedOn"></td>
        </tr>
        <tr>
            <td><label for="startDatTime">Start Date & Time</label></td>
            <td><input type="date" id="startDatTime" name="startDatTime"></td>
        </tr>
        <tr>
            <td><label for="endDatTime">End Date & Time</label></td>
            <td><input type="date" id="endDatTime" name="endDatTime"></td>
        </tr>
        <tr>
            <td><label for="deadline">Deadline</label></td>
            <td><input type="date" id="deadline" name="deadline"></td>
        </tr>
<tr>			<td>
		<input type="submit" value="Submit"></td>
		</tr>
    </table>
    
    
</div>

<script>
function getQueryParameter(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}

const username = getQueryParameter('username');
if (username) {
    document.getElementById("userTag").innerText = username;
}
</script>
</form>
</body>
</html>
</body>
</html>
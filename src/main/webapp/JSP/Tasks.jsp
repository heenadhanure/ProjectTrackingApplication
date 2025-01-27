<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tasks</title>
/* <link rel="stylesheet" href="../CSS/tasks.css" /> */
</head>
<body>
	<%
		UserBean ub = (UserBean)application.getAttribute("ubean");
	//	out.println(ub.getUserName());
	%>
	<div class="header-bar">
        <h3>Welcome <%= ub.getFirstName() %>&nbsp;!</h3>
    </div>

    <div class="main-layout">
        <div class="sidebar">
            <h3>Task Management</h3>
            <ul>
            	<li><a href="../login">Dashboard</a>
                <li><a href="addTask.jsp">Add task</a></li>
                <li><a href="#">Assign Task</a></li>
                <li><a href="#">View Task</a></li>
                <li><a href="#">Pending Task</a></li>
                <li><a href="#">In progress Task</a></li>
                <li><a href="#">Completed</a></li>
                <li><a href="../logout">Logout</a></li>
            </ul>
        </div>

        <div class="content">
            

            <!-- Three containers for task statuses -->
            <div class="container pending">
                <h3>Pending</h3>
                <p id="pendingCount">0</p>
            </div>
            <div class="container in-progress">
                <h3>In Progress</h3>
                <p id="inProgressCount">0</p>
            </div>
            <div class="container completed">
                <h3>Completed</h3>
                <p id="completedCount">0</p>
            </div>

            <!-- Table structure -->
            <table>
                <thead>
                    <tr>
                        <th>Sr. no</th>
                        <th>Assigned by</th>
                        <th>Company Name</th>
                        <th>Task Name</th>
                        <th>Task Created on</th>
                        <th>Start Date/time</th>
                        <th>End Date/time</th>
                        <th>Deadline</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Data will be filled here in the future -->
                </tbody>
            </table>
        </div>
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"
import="com.nit.beans.NotificationBean,com.nit.controller.projectcontroller.NotificationServlet" import="java.sql.*,java.util.*"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project Notifications</title>
<link rel="stylesheet" href="CSS/notifications.css" />
<script>
    document.querySelectorAll('.mark-read-btn').forEach(button => {
        button.addEventListener('click', function () {
            const notificationId = this.dataset.id;
            fetch('NotificationServlet', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `action=markAsRead&notificationId=${notificationId}`
            })
            .then(response => response.text())
            .then(result => {
                if (result === 'success') {
                    alert('Notification marked as read');
                    location.reload(); // Reload to update UI
                } else {
                    alert('Failed to mark notification as read');
                }
            });
        });
    });

    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function () {
            const notificationId = this.dataset.id;
            fetch('NotificationServlet', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `action=markAsRead&notificationId=${notificationId}`
            })
            .then(response => response.text())
            .then(result => {
                if (result === 'success') {
                    alert('Notification deleted');
                    location.reload();
                } else {
                    alert('Failed to delete notification');
                }
            });
        });
    });
</script>

</head>
<body>
   

    <!-- Navigation Bar -->
    <nav>
        <ul>
            <li><a href="../dashboard.jsp">Dashboard</a></li>
            <li><a href="../projects.jsp">Projects</a></li>
            <li><a href="../tasks.jsp">Tasks</a></li>
            <li><a href="../notifications].jsp">Notifications</a></li>
            <li><a href="../logout.jsp" class="logout-link">Logout</a></li>
        </ul>

        <div class="profile-menu">
            <span class="profile-icon">
                <i class="fas fa-user-circle"></i>
            </span>
            <div class="profile-dropdown">
                <h5>Profile</h5>
                <p>View and edit your profile information.</p>
                <button class="cp">Edit Profile</button>
            </div>
        </div>
    </nav>

    <!-- Main Content Layout -->
    <div class="main-layout">
        

        


<div class="content">
    <h2>Notifications</h2>

    <div class="notification-section">
        <h3>Project Notifications</h3>
        <form action="NotificationServlet" method="post">
        <table>
            <thead>
                <tr>
                    <th>Message</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<NotificationBean> notifications = 
                        (List<NotificationBean>) request.getAttribute("notifications");
                    if (notifications != null && !notifications.isEmpty()) {
                        for (NotificationBean notification : notifications) {
                %>
                <tr>
                    <td><%= notification.getNotificationMessage() %></td>
                    <td><%= notification.getCreatedAt() %></td>
                    <td>
                        <button class="mark-read-btn" data-id="<%= notification.getNotificationId() %>">Mark as Read</button>
                        <button class="delete-btn" data-id="<%= notification.getNotificationId() %>">Delete</button>
                    </td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr>
                    <td colspan="3" class="text-center">No notifications available.</td>
                </tr>
                <% } %>
            </tbody>
            
        </table>
        </form>
    </div>
</div>

            

            <!-- Task Status Updates 
            <div class="notification-section">
                <h3>Task Status Updates</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Task</th>
                            <th>Project</th>
                            <th>Old Status</th>
                            <th>New Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Update Project Brief</td>
                            <td>Client Project</td>
                            <td>In Progress</td>
                            <td>Completed</td>
                            <td>2024-12-05</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Deadline Reminders 
            <div class="notification-section">
                <h3>Upcoming Deadlines</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Task</th>
                            <th>Project</th>
                            <th>Deadline</th>
                            <th>Reminder</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Submit Final Design</td>
                            <td>Website Redesign</td>
                            <td>2024-12-10</td>
                            <td><button>Set Reminder</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Project Milestones 
            <div class="notification-section">
                <h3>Project Milestones</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Milestone</th>
                            <th>Project</th>
                            <th>Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>First Prototype</td>
                            <td>Mobile App Development</td>
                            <td>Completed</td>
                            <td>2024-12-01</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- System Notifications 
            <div class="notification-section">
                <h3>System Notifications</h3>
                <table>
                    <thead>
                        <tr>
                            <th>Notification</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>System Maintenance on Dec 15, 2024</td>
                            <td>2024-12-05</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
-->
</body>
</html>

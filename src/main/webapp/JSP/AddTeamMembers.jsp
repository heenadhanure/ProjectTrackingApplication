<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.UserBean" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<style>
	/* General Page Styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa; /* Light gray background */
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        color: #343a40; /* Dark gray */
        margin-bottom: 20px;
    }

    /* Form Container */
    form {
        max-width: 500px;
        margin: 50px auto; /* Center the form */
        background-color: #ffffff; /* White background */
        padding: 20px 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    /* Form Inputs and Labels */
    label {
        font-weight: bold;
        display: block;
        margin-bottom: 10px;
        color: #495057; /* Medium dark gray */
    }

    input[type="checkbox"] {
        margin-right: 10px;
        transform: scale(1.2); /* Larger checkboxes */
    }

    input[type="hidden"] {
        display: none;
    }

    /* Submit Button */
    button[type="submit"] {
        display: inline-block;
        background-color: #007bff; /* Bootstrap primary blue */
        color: #ffffff;
        font-size: 16px;
        font-weight: bold;
        text-align: center;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 15px;
    }

    button[type="submit"]:hover {
        background-color: #0056b3; /* Darker blue */
    }

    /* Message Styling */
    h4 {
        text-align: center;
        color: #dc3545; /* Bootstrap danger red */
        margin-top: 20px;
    }

    /* Checkbox Labels */
    input[type="checkbox"] + label {
        font-size: 14px;
        color: #495057;
        cursor: pointer;
    }

    /* Responsiveness */
    @media (max-width: 600px) {
        form {
            padding: 15px;
        }
    }
</style>
</head>
<body>
	  
   <% 
   		String teamId = (String) session.getAttribute("teamId"); // team_id from request
   		String msg = (String) request.getAttribute("msg");
        if (msg != null) {
   %>
        <!-- Place script tag correctly -->
        <script type="text/javascript">
            alert("<%= msg %>");
        </script>
   <%
        }
   %>

    <form action="addTeamMembers" method="post">
        <h2>Add Team Members</h2>
        
        <input type="hidden" id="team_id" name="team_id" value="<%= teamId %>"> <!-- Pass team_id dynamically -->
        
    
        <label>Select Team Members:</label><br>
        <% 
            List<UserBean> users = (List<UserBean>) session.getAttribute("usersList");
            if (users != null && !users.isEmpty()) {
                for (UserBean user : users) { 
                	System.out.print("User : "+user+"/n");
        %>
                 <input type="checkbox" name="team_members" value="<%= user.getUserName() %>"> <%= user.getUserName() %><br>
        <% 
                }
            } else {
        %>
            <h4>No Users Available</h4>
        <%
            }
        %>
        
        <button type="submit">Add Members</button>
    </form>
</body>

</body>
</html>
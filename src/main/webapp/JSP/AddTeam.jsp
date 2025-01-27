<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.ProjectsBean" import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Add New Team</title>
    <link rel="stylesheet" href="../CSS/AddTeam.css">
    
</head>
<body>
    <form action="../addTeam" method="post">
	    <h2>Add New Team</h2>
        <!-- Project Name Dropdown -->
        <label for="projectName">Select Project:</label>
        <select name="projectName" id="projectName" onchange="updateProjectId()" required>
            <% 
                List<ProjectsBean> projects = (List<ProjectsBean>) session.getAttribute("projects");
                if (projects != null) {
                    for (ProjectsBean project : projects) { 
            %>
                <option value="<%= project.getProjectName() %>" data-project-id="<%= project.getProjectId() %>">
                    <%= project.getProjectName() %>
                </option>
            <% 
                    }
                }
            %>
        </select><br><br>

        <!-- Hidden Project ID Field -->
        <input type="hidden" id="projectId" name="projectId">

        <!-- Other Fields -->
        <label for="teamName">Team Name:</label>
        <input type="text" id="teamName" name="teamName" required><br><br>

        <label for="teamLead">Team Lead:</label>
        <input type="text" id="teamLead" name="teamLead" required><br><br>

        <label for="members">Number of Members:</label>
        <input type="number" id="members" name="members" required><br><br>

        <label for="description">Team Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea><br><br>

        <button type="submit">Create Team</button>
    </form>

    <!-- JavaScript to Populate Project ID -->
    <script>
        function updateProjectId() {
            // Get the dropdown list
            var projectDropdown = document.getElementById("projectName");
            // Get the selected option
            var selectedOption = projectDropdown.options[projectDropdown.selectedIndex];
            // Get the project ID from the data attribute
            var projectId = selectedOption.getAttribute("data-project-id");
            // Set the value of the hidden input field
            document.getElementById("projectId").value = projectId;
        }

        // Set projectId initially on page load
        window.onload = updateProjectId;
    </script>
</body>
</html>

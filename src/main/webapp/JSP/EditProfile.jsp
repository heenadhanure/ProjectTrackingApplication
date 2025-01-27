<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.nit.beans.UserBean"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Update Profile</title>
  <style>
	/* Global styles */
	body {
	    font-family: Arial, sans-serif;
	    background-color: #f7f9fc;
	    margin: 0;
	    padding: 20px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    min-height: 100vh;
	}
	
	h3 {
	    font-size: 1.5em;
	    color: #333;
	    margin-top: 5px;
	    margin-bottom: -5px;
	    text-align: center;
	}
	
	/* Form container */
	form {
	    background-color: #fff;
	    border-radius: 8px;
	    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	    padding: 30px;
	    max-width: 400px;
	    width: 100%;
	    box-sizing: border-box;
	}
	
	/* Form field labels */
	form label {
	    display: block;
	    font-weight: bold;
	    color: #333;
	    margin-bottom: 5px;
	}
	
	/* Input fields */
	form input[type="text"],
	form input[type="email"],
	form input[type="tel"],
	form input[type="file"],
	form select {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 15px;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	    box-sizing: border-box;
	    font-size: 1em;
	}
	
	/* Dropdown */
	form select {
	    appearance: none;
	    background: #fff url('data:image/svg+xml;base64,PHN2ZyBmaWxsPSIjMDAwMDAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxOCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDE4IDE4Ij48cGF0aCBkPSJNNSAyYzAuNTI5IDAgMS4wMjUuMjI1IDEuMzYyLjU5Nmw2LjU2NiA2LjQ5OS02LjU2NiA2LjQ5OWMtLjM0MS4zNzEtLjgzMy41OTYtMS4zNjIuNTk2LS41MjkgMC0xLjAyNS0uMjI1LTEuMzYyLS41OTZMLjU5NiAxMi4xOTVjLS43OC0uNzY4LS43OC0yLjAwMiAwLTIuNzY4TDQuMzc5IDIuNTk2QzQuNzE1IDIuMjI1IDUuMTg1IDIgNSAyWiIvPjwvc3ZnPg==') no-repeat right 10px center;
	    background-size: 12px;
	    border-radius: 4px;
	}
	
	/* Submit button */
	form input[type="submit"] {
	    width: 100%;
	    padding: 12px;
	    border: none;
	    background-color: #007bff;
	    color: #fff;
	    font-size: 1em;
	    font-weight: bold;
	    border-radius: 4px;
	    cursor: pointer;
	    transition: background-color 0.3s;
	}
	
	form input[type="submit"]:hover {
	    background-color: #0056b3;
	}
	
	/* Responsive Design */
	@media (max-width: 480px) {
	    form {
	        padding: 20px;
	    }
	
	    h3 {
	        font-size: 1.2em;
	    }
	}
		
	</style>
  </head>
<body>
	<%
		String fName = (String)session.getAttribute("name");
		UserBean ub = (UserBean)session.getAttribute("ubean");
	%>
	<form action="update" method="post">
		<h3><%=ub.getFirstName() %>&nbsp;<%= ub.getLastName()%></h3><br><br>
		Username : <input type="text" name="uname" value=<%= ub.getUserName() %> ><br><br>
		Email ID : <input type="email" name="email" value=<%=ub.getEmail() %>><br><br>
		Role : 	<select id="role" name="role" value=<%ub.getRole(); %> required>
					<option value="" disabled selected> required>select</option>
					<option value="project manager">Project Manager</option>
					<option value="team lead">Team Lead</option>
					<option value="developer">Developer</option>
			   </select><br><br>
	
		Profile : <input type="file" id="setprofile" name="setprofile" accept="image/*" value=<%= ub.getProfileImage() %>><br><br>	
		<input type="submit" value="Update Profile">
	</form>
</body>
</html>
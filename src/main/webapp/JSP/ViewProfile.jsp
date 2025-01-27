<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.nit.*,java.util.*,com.nit.beans.UserBean,com.nit.controller.usercontroller.LogoutServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
</head>
<body>
	<%
	    UserBean ub = (UserBean)application.getAttribute("ubean");
		out.println("<h2>Your Profile</h2>UserName :\t"+ub.getUserName()+"<br>First Name :\t"+ub.getFirstName()+"<br>Last Name :\t"+ub.getLastName()+"<br>Email :\t"+ub.getEmail()+"<br>Role :\t"+ub.getRole());
	%>
	<br><br>
	<a href="editProfile">Edit Profile</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="logout">Logout</a><br><br>
	<form action="deleteProfile" method="post">
		 <input type="hidden" name="uname" value="<%=ub.getUserName()%>">
         <button type="submit">Delete Profile</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
 <link rel="stylesheet" href="CSS/loginstyle.css">
</head>
<body>
	<%
		String msg = (String)request.getAttribute("msg");
		out.println(msg);
	%>
	<div class="login-form">
	<h3>User Login</h3>
	<form action="login" method="post" id="loginform">
		<table>
          <tr class="form-group">
            <td><label for="user">UserName</label></td>
            <td><input type="text" id="user" name="uname" required></input></td>
          
          </tr>
            <tr class="form-group">
              <td> <label for="pass">Password</label></td>
              <td><input type="password" id="pass" name="pword" required></input></td>
            </tr>
        	
		
		<tr class="form-group">
              <td><input type="submit" value="Login" id="loginBtn"></td>
               <td><a href="register.html" style="height:50px;border:1px solid black;text-decoration: none;color:black;padding:2px;border-radius: 3px;" >New User?</a></td>
          </tr>
    
		</table>
		</form>
		</div>
		 <script src="JS/login.js"></script>
</body>
</html>
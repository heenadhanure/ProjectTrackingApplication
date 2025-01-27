<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">	
<link rel="stylesheet" type="text/css" href="home.css">
</head>
<body>
	<script>
	   <% 
            String msg = (String) request.getAttribute("msg");
           	if(msg!=null){
        %>
        	alert("<%= msg %>");
        <%
           	}
        %>
        window.location.href = "<%= request.getContextPath() %>/index.html"; 
    </script>
</body>
</html>
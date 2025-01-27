<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String fName = (String)session.getAttribute("name");
		String msg = (String)session.getAttribute("msg");
		out.println(msg);
	%>
	<a href="viewProfile">View Profile</a>
	<a href="logout">Logout</a>
</body>
</html>
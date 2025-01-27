<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <script type="text/javascript">
	
	<% 
   		String teamId = (String) session.getAttribute("teamId"); // team_id from request
   		String msg = (String) request.getAttribute("msg");
        if (msg != null) {
   %>
        <!-- Place script tag correctly -->
            alert("<%= msg %>");
       
   <%
        }
   %>
      window.location.href = "<%= request.getContextPath() %>/fetchProjects"; 
   </script>
</body>
</html>
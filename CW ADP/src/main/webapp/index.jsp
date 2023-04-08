<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
	String name = (String) session.getAttribute("name");
	if(session.getAttribute("name")== null){
		response.sendRedirect("login.jsp");
	}
	else{
		session.removeAttribute("name");
	}

%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<%@include file= "navbar.jsp"%>
	<h1>Welcome</h1>
	<%= name %>
</body>
</html>
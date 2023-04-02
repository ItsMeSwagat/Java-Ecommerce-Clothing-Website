<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Alert Message</title>

<style>
	.alert {
	  padding: 1.5rem;
	  background-color: #1ca5af;
	  color: white;
	  margin: 0 auto;
	  top:0;
	}
	
	.closebtn {
	  margin-left: 15px;
	  color: white;
	  font-weight: bold;
	  float: right;
	  font-size: 22px;
	  line-height: 20px;
	  cursor: pointer;
	  transition: 0.3s;
	}
	
	.closebtn:hover {
	  color: black;
	}
	strong{
		font-size: 1.8rem;
	}
</style>
</head>
<body>

<%

String message = (String) session.getAttribute("credential");

if(message != null){
	
%>
<div class="alert" role="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%= message %></strong>
</div>

<%
session.removeAttribute("credential");
}
%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Successful Alert Message</title>

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

String Smessage = (String) session.getAttribute("success-message");
String Fmessage = (String) session.getAttribute("fail-message");
if(Smessage != null){
	
%>
<div class="alert" role="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong><%= Smessage %></strong>
</div>

<%
session.removeAttribute("success-message");
}
else if(Fmessage != null){
%>

	<div class="alert" role="alert">
  		<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  		<strong><%= Fmessage %></strong>
	</div>
	
<% 
session.removeAttribute("fail-message");
}
	
%>	
	
</body>
</html>
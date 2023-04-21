<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.register.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>

    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@include file= "Message/AlertMessage.jsp"%>
    <div class="update-profile">
        <%
                    String email = (String) request.getParameter("uemail");           
                    UserDao userDao = new UserDao();
                    user u = userDao.getUserByEmail(email);
                    
                    %>
        <form action="updateProfile" method="post" enctype="multipart/form-data">
        	
            <img src="images/<%= u.getImage() %>" alt="">
            <div class="flex">
                <div class="input-box">
                	<input type="hidden" name="old_email" value="<%= u.getEmail()%>">
                    <span>Name :</span>
                    <input type="text" name="updateName" placeholder="Enter your Name" class="box" value="<%= u.getName()%>">
                    <span>Email :</span>
                    <input type="email" name="updateEmail" placeholder="Enter your email" class="box" value="<%=u.getEmail()%>">
                    <span>PhoneNumber :</span>
                    <input type="text" name="updatePhonenumber" placeholder="Enter your phone number" class="box" value="<%= u.getPhonenumber()%>">
                    
                </div>
                <div class="input-box">
                    <span>Address :</span>
                    <input type="text" name="updateAddress" placeholder="Enter your Address"  class="box" value="<%= u.getAddress()%>">
                    <span>New Password :</span>
                    <input type="password" name="updatePassword" placeholder="Enter new password"  class="box" value="<%= u.getPassword()%>">
                    <span>Pic :</span>          
                    <input type="file" accept="image/jpg, image/jpeg, image/png" class="box" name="updateImage" value="<%= u.getImage() %>">
                </div>
            </div>
            <input type="submit" value="update profile" name="update_profile" class="btn">
            <a href="index.jsp" class="option-btn">go back</a>
            <a href="logout" class="delete-btn">logout</a>
        </form>
    </div>
</body>
</html>
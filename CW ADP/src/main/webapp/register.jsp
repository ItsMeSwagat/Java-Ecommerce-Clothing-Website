<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>


    <!-- Font awesome link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!--css link-->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	
    <div class="form-container">
    	
        <form action="register" method="post">
        	<%@include file="Message/AlertMessage.jsp"%>
            <h3>Register Now</h3>
            <input type="text" name="name" placeholder="Enter your Name" required class="box">
            <input type="email" name="email" placeholder="Enter your email" required class="box">
            <input type="text" name="phonenumber" placeholder="Enter your phone number" required class="box">
            <input type="text" name="address" placeholder="Enter your Address" required class="box">
            <input type="password" name="password" placeholder="Enter your password" required class="box">            
            <input type="file" accept="image/jpg, image/jpeg, image/png" class="box" required name="image">
            <input type="submit" name="submit" value="Register now" class="btn">
            <p>Already have an account? <a href="login.jsp">login now</a></p>
        </form>
    </div>
    
</body>
</html>
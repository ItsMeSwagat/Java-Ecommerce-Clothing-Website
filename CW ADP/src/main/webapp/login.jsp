<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>


    <!-- Font awesome link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!--css link-->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="form-container">
        <form action="login" method="post">
        	<%@include file="Message/AlertMessage.jsp"%>
            <h3>Login Now</h3>
            <input type="email" name="email" placeholder="Enter your email" class="box">
            <input type="password" name="password" placeholder="Enter your password" class="box">
            <input type="submit" name="submit" value="Login now" class="btn">
            <p>Don't have an account? <a href="register.jsp">register now</a></p>
        </form>
    </div>
</body>
</html>
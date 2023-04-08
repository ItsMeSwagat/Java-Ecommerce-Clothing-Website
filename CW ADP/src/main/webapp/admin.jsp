<%
	boolean isAdmin = (boolean) session.getAttribute("current_user");
	if (isAdmin == false){
		
		session.setAttribute("credential", "You are not Admin!! No Access");
		response.sendRedirect("login.jsp");
		return;
	}
%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>


    <!-- Font awesome link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    
    <!--css link-->
    <link rel="stylesheet" href="css/admin_style.css">
</head>
<body>

<header class="header">

    <div class="flex">

        <a href="" class="logo">Admin<span>Panel</span></a>

        <nav class="navbar">
            <a href="#">Home</a>
            <a href="admin_product.jsp">Products</a>
            <a href="admin_order.jsp">Orders</a>
            
        </nav>

        <div class="icons">
            <div id="menu-btn" class="fas fa-bars"></div>
            <div id="user-btn" class="fas fa-user"></div>
        </div>
        
        <div class="account-box">
            <p>username: <span>admin</span></p>
            <p>email: <span>admin@gmail.com</span></p>
            <a href="logout"  class="delete-btn">logout</a>
        </div>
    </div>
</header>

 <!--Admin  Dashboard-->
<section class="dashboard">

    <!--<h1 class="title">dashboard</h1> -->
    
    <div class="box-container">
        <div class="box">
            <h3>0</h3>
            <p>Total Pendings</p>
        </div>

        <div class="box">
            <h3>0</h3>
            <p>Completed Payments</p>
        </div>

        <div class="box">
            <h3>0</h3>
            <p>Order Placed</p>
        </div>

        <div class="box">
            <h3>0</h3>
            <p>Products added</p>
        </div>

        <div class="box">
            <h3>0</h3>
            <p>Normal Users</p>
        </div>

        <div class="box">
            <h3>0</h3>
            <p>Admin Users</p>
        </div>
    </div>

</section>
<script src="js/admin.js"></script>
</body>
</html>
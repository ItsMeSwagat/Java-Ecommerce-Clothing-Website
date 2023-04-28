<%
if(session.getAttribute("current_user") != null){
	int isAdmin = (int) session.getAttribute("current_user");
	if (isAdmin != 1){
		
		session.setAttribute("credential", "You are not Admin!! No Access");
		response.sendRedirect("index.jsp");
		return;
	}
}
else{
	session.setAttribute("credential","Please login first!!");
	response.sendRedirect("login.jsp");
}

	
	String name = (String) session.getAttribute("name");
	String email = (String) session.getAttribute("email");
%>





<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.productOperation.*" %>
<%@ page import="com.register.*" %>
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
	<%@include file="Message/AlertMessage.jsp"%>
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
            <p>name: <span><%=name %></span></p>
            <p>email: <span><%=email %></span></p>
            <a href="logout"  class="delete-btn">logout</a>
        </div>
    </div>
</header>

 <!--Admin  Dashboard-->
<section class="dashboard">

    <!--<h1 class="title">dashboard</h1> -->
    <%
    	UserDao userDao = new UserDao();
      	int totalUser = userDao.getTotalUsers();
    %>
    <div class="box-container">
        <div class="box">
            <h3><%=totalUser%></h3>
            <p>Total Users</p>
        </div>

	
        <div class="box">
            <h3>0</h3>
            <p>Order Placed</p>
        </div>
	<%
		ProductDao productDao = new ProductDao();
    	int totalProducts = productDao.getTotalProducts();
	%>
        <div class="box">
            <h3><%=totalProducts%></h3>
            <p>Products added</p>
        </div>

    </div>

</section>
<script src="js/admin.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- Font awesome link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!--css link-->
    <link rel="stylesheet" href="css/admin_style.css">
</head>
<body>
	<header class="header">

    <div class="flex">

        <a href="admin.jsp" class="logo">Admin<span>Panel</span></a>

        <nav class="navbar">
            <a href="admin.jsp">Home</a>
            <a href="admin_product.jsp">Products</a>
            <a href="">Orders</a>
            
        </nav>

        <div class="icons">
            <div id="menu-btn" class="fas fa-bars"></div>
            <div id="user-btn" class="fas fa-user"></div>
        </div>
        
        <div class="account-box">
            <p>username: <span>admin</span></p>
            <p>email: <span>admin@gmail.com</span></p>
            <a href="login.html" class="delete-btn">logout</a>
        </div>
    </div>
</header>

<!--Header Ends-->

<section class="order">
	<h1 class="title">placed orders</h1>
	
	<div class="box-container">
	
	</div>
	
</section>

</body>
</html>
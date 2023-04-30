<%

if(session.getAttribute("current_user") != null){
	int isAdmin = (int) session.getAttribute("current_user");
	if (isAdmin != 1){
		
		session.setAttribute("credential", "You are not Admin!! No Access");
		response.sendRedirect("login.jsp");
		return;
	}
}
else{
	session.setAttribute("credential","Please login first!!");
	response.sendRedirect("login.jsp");
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.order.*" %>
<%@ page import="com.cart.*" %>
<%@ page import="com.register.*" %>
<%@ page import="java.util.List" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>orders</title>

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
            <a href="logout" class="delete-btn">logout</a>
        </div>
    </div>
</header>

<!--Header Ends-->

<section class="orders">
	<%
		orderDao orderDao = new orderDao();
		List<order> olist = orderDao.getOrderAdmin();
		
		for(order o:olist){
			
			int itemTotal = o.getPrice()*o.getQuantity();
			double totalAmount = 0.0;
			totalAmount += itemTotal;	
	%>
	<div class="box-container">
	
	
		<div class="box">
			<p>order id : <span><%=o.getOrder_id() %></span></p>
			<p>name : <span><%=o.getName() %></span></p>
			<p>number : <span><%=o.getNumber() %></span></p>
			<p>email : <span><%=o.getEmail() %></span></p>
			<p>address : <span><%=o.getFullAddress() %></span></p>
			<p>product : <span><%=o.getProduct_name() %>(<%=o.getQuantity() %>)</span></p>
			<p>price : <span><%=itemTotal %></span></p>
			<p>payment type : <span><%=o.getPayment() %></span></p>
		</div>
	
	</div>
	<% }%>
	
</section>

<script src="js/admin.js"></script>
</body>
</html>
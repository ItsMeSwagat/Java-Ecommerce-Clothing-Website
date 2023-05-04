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
            <div id="menu-btn"><img src="images/menu.png" style="width: 2.4rem; height: 2.4rem;"></div>
            <div id="user-btn"><img src="images/user.png" style="width: 2.4rem; height: 2.4rem;"></div>
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
	
	<div class="box-container">
		<%
		orderDao orderDao = new orderDao();
		List<order> olist = orderDao.getOrderAdmin();
		
		for(order o:olist){
			
			int itemTotal = o.getPrice()*o.getQuantity();
			double totalAmount = 0.0;
			totalAmount += itemTotal;	
	%>
	
		<div class="box">
			<p>order id : <span><%=o.getOrder_id() %></span></p>
			<p>name : <span><%=o.getName() %></span></p>
			<p>number : <span><%=o.getNumber() %></span></p>
			<p>email : <span><%=o.getEmail() %></span></p>
			<p>address : <span><%=o.getFullAddress() %></span></p>
			<p>product : <span><%=o.getProduct_name() %>(<%=o.getQuantity() %>)</span></p>
			<p>total price : <span>Rs <%=itemTotal %> /-</span></p>
			<p>payment type : <span><%=o.getPayment() %></span></p>
		</div>
	<% }%>
	</div>
	
	
</section>

<script src="js/admin.js"></script>
</body>
</html>
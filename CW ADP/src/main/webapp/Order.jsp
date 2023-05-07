<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.controller.*" %>
<%@ page import="com.model.*" %>
<%@ page import="java.util.List" %>    
<%    
if(session.getAttribute("current_user") != null){
	int isAdmin = (int) session.getAttribute("current_user");
	if (isAdmin == 1){
		
		session.setAttribute("credential", "You are Admin!! No access to this page");
		response.sendRedirect("admin.jsp");
		return;
	}
}
else{
	session.setAttribute("credential","Please login first!!");
	response.sendRedirect("login.jsp");
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order</title>

    <!--css link-->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
	<%@include file= "navbar.jsp"%>
	<div class="heading">
		<h3>Order</h3>
		<p><a href="index.jsp">home</a>/order</p>
	</div>
	
	
	<%
	String uemail = (String) session.getAttribute("email");           
    UserDao userDao = new UserDao();
    user u = userDao.getUserByEmail(uemail);
    orderDao orderDao = new orderDao();
    
    List<order> olist = orderDao.getOrder(u.getEmail());
    %>
    
	<section class="placed-orders">
		<h1 class="title">placed orders</h1>
		<% 
		if(olist.isEmpty()){
		    %>
		    	<div class="btn" style="text-align: center; margin-left: 68rem; margin-bottom: 2rem; pointer-events: none;">No Order Placed.</div>
		    <%
		    }
		else{
			%>
		
		<div class="box-container">
		
			<%
				for(order o:olist){
				
				int itemTotal = o.getPrice()*o.getQuantity();
				double totalAmount = 0.0;
				totalAmount += itemTotal;
			%>

			<div class="box">
				<p>Order ID: <span><%=o.getOrder_id() %></span></p>
				<p>Name: <span><%=o.getName() %></span></p>
				<p>Number: <span><%=o.getNumber() %></span></p>
				<p>Email : <span><%=o.getEmail() %></span></p>
				<p>Address : <span><%=o.getFullAddress() %></span></p>
				<p>your orders : <span><%=o.getProduct_name() %>(<%=o.getQuantity() %>)</span></p>
				<p>price : <span>Rs <%=itemTotal %> /-</span></p>
				<p>payment type : <span><%=o.getPayment() %></span></p>
			</div>
		<%
			}
		}
		%>	
		</div>
	
	</section>
	
	
	
	<%@include file= "footer.jsp"%>	
</body>
</html>
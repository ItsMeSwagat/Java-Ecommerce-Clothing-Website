<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.productOperation.product" %>
<%@ page import="com.productOperation.*" %>
<%@ page import="java.util.List" %>
    
<% 	
	String user = (String)session.getAttribute("email");
	if(session.getAttribute("current_user") != null){
		int isAdmin = (int) session.getAttribute("current_user");
		if (isAdmin == 1){
			
			session.setAttribute("credential", "You are Admin!! No access to this page");
			response.sendRedirect("admin.jsp");
			return;
		}
	}
	

%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

  
    <!--css link-->
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>
	<%@include file= "navbar.jsp"%>
	
	<section class="home">
	
	<div class="content">
		<h3>Get the clothes at the greatest Quality.</h3>
		<p>lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum lorem ipsum</p>
		<a href="shop.jsp" class="white-btn">discover more</a>
	</div>
	
	
	</section>
	
	<section class="products">
		<h1 class="title">latest products</h1>
		<div class="box-container">
		<%
        ProductDao productDao = new ProductDao();
        List<product> productList = productDao.getAllProducts();
        for (product product : productList) {
    	%>
				<div class="box">
					<img src="images/<%= product.getP_image() %>">
					<div class="name"><%= product.getP_name() %></div>
					<div class="price">Rs<%= product.getP_price() %> /-</div>
					<form method="post" action="AddToCart">
					<input type="hidden" name="productId" value="<%= product.getP_id()%>">
					<input type="number" min="1" name="quantity" value="1" max="<%= product.getP_quantity() %>" class="qty">
					<%
					if(user == null){
						
					%>
					<a href="login.jsp" class="btn">add to cart</a>
					<%
					}
					else{
					%>	
					<input type="submit" name="add to cart" value="add to cart" class="btn"> 
					<% 	
					}
					%>
					</form>
				</div>
		 <%
        }
    	%>		
		</div>
	</section>
	
	
	
	
	
	<%@include file= "footer.jsp"%>
	
	<script src="js/script.js"></script>
</body>
</html>
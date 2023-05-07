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


%>




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>shop</title>
	
    <!--css link-->
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>
	<%@include file= "navbar.jsp" %>
	
	
		<div class="heading">
			<h3>shop</h3>
			<p><a href="index.jsp">home</a>/shop</p>
		</div>
	<%
		ProductDao productDao = new ProductDao();
		List<product> productList;
   		
		%>
	<section class="search-form">
		<form action="searchProduct" method="post">
			<input type="text" name="search" placeholder="search products..." class="box">
			<input type="submit" name="submit" value="search" class="btn">
		</form>
	</section>
		
		
		
	<section class="products-c">
		<div class="box-container-c">
		
			<div class="box-c">
				<p>Categories</p>
				<div class="categories"><a href="shop.jsp?category=all">All Products</a></div>
				<div class="categories"><a href="shop.jsp?category=Men">Mens Wear</a></div>
				<div class="categories"><a href="shop.jsp?category=Women">Womens Wear</a></div>
				<div class="categories"><a href="shop.jsp?category=children">Children Wear</a></div>
				<div class="categories"><a href="shop.jsp?category=Highest_price">Highest Price</a></div>
			</div>
		</div>
		
		
		
		<div class="box-container">
		
			<%
				productList = (List<product>)request.getAttribute("productList");
				if(productList != null && !productList.isEmpty()) {
		   	 	for(product product : productList) {
			%>
			<div class="box">
				<form method="post" action="AddToCart">
						<input type="hidden" name="productId" value="<%= product.getP_id()%>">
						<img src="images/<%= product.getP_image() %>">
						<div class="name"><%= product.getP_name() %></div>
						<div class="price">Rs<%= product.getP_price() %> /-</div>
						<input type="number" min="1" name="quantity" value="1" max="<%= product.getP_quantity() %>" class="qty">
						<input type="submit" value="add to cart" name="add-to cart" class="btn">
				</form>
			</div>
	
			<%
			}
				}
		   	 %>
		
		
		<%
		
		String p_category = request.getParameter("category");
		
		if(p_category == null || p_category.trim().equals("all")){
			productList = productDao.getAllProducts();
			for (product product : productList){
		%>		
			<div class="box">
					<form method="post" action="AddToCart">
					<input type="hidden" name="productId" value="<%= product.getP_id()%>">
					<img src="images/<%= product.getP_image() %>">
					<div class="name"><%= product.getP_name() %></div>
					<div class="price">Rs<%= product.getP_price() %> /-</div>
					<input type="number" min="1" name="quantity" value="1" max="<%= product.getP_quantity() %>" class="qty">
					<input type="submit" value="add to cart" name="add-to cart" class="btn">
					</form>
				</div>
			
		<%
			}
		}
		else if(p_category.trim().equals("Highest_price"))
		{
			productList = productDao.getAllProductsSortedByPrice();
			for (product product : productList){
		%>	
			<div class="box">
					<form method="post" action="AddToCart">
					<input type="hidden" name="productId" value="<%= product.getP_id()%>">
					<img src="images/<%= product.getP_image() %>">
					<div class="name"><%= product.getP_name() %></div>
					<div class="price">Rs<%= product.getP_price() %> /-</div>
					<input type="number" min="1" name="quantity" value="1" max="<%= product.getP_quantity() %>" class="qty">
					<input type="submit" value="add to cart" name="add-to cart" class="btn">
					</form>
				</div>
			
		<% 
			}
		}
		else{
			productList = productDao.getProductByCategory(p_category);
			for (product product : productList){		
		%>
			<div class="box">
					<form method="post" action="AddToCart">
					<input type="hidden" name="productId" value="<%= product.getP_id()%>">
					<img src="images/<%= product.getP_image() %>">
					<div class="name"><%= product.getP_name() %></div>
					<div class="price">Rs<%= product.getP_price() %> /-</div>
					<input type="number" min="1" name="quantity" value="1" max="<%= product.getP_quantity() %>" class="qty">
					<input type="submit" value="add to cart" name="add-to cart" class="btn">
					</form>
				</div>
		
		<%
			}
	
		}
    	%>
				
		</div>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>
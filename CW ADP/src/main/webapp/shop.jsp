<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.productOperation.product" %>
<%@ page import="com.productOperation.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>shop</title>
	 <!-- Font awesome link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!--css link-->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@include file= "navbar.jsp" %>
	<section class="shop">
	
		<div class="heading">
			<h3>shop</h3>
			<p><a href="index.jsp">home</a>/shop</p>
		</div>
	
		
		
		
	<section class="products-c">
		<div class="box-container-c">
		<%
		ProductDao productDao = new ProductDao();
		List<product> productList;
   		
		%>
			<div class="box-c">
				<p>Categories</p>
				<div class="categories"><a href="shop.jsp?category=all">All Products</a></div>
				<div class="categories"><a href="shop.jsp?category=Men">Mens Wear</a></div>
				<div class="categories"><a href="shop.jsp?category=Women">Womens Wear</a></div>
				<div class="categories"><a href="shop.jsp?category=children">Children Wear</a></div>
			</div>
		</div>
		
		
		
		<div class="box-container">
		<%
		
		String p_category = request.getParameter("category");
		
		if(p_category == null || p_category.trim().equals("all")){
			productList = productDao.getAllProducts();
			for (product product : productList){
		%>		
			<div class="box">
					<img src="images/<%= product.getP_image() %>">
					<div class="name"><%= product.getP_name() %></div>
					<div class="price">Rs<%= product.getP_price() %> /-</div>
					<input type="number" min="1" name="product_quantity" value="1" max="<%= product.getP_quantity() %>" class="qty">
					<input type="submit" value="add to cart" name="add-to cart" class="btn">
				</div>
			
		<%
		} 
		%>	
			
			
		<% 
		}
		else{
			productList = productDao.getProductByCategory(p_category);
			for (product product : productList){		
		%>
			<div class="box">
					<img src="images/<%= product.getP_image() %>">
					<div class="name"><%= product.getP_name() %></div>
					<div class="price">Rs<%= product.getP_price() %> /-</div>
					<input type="number" min="1" name="product_quantity" value="1" max="<%= product.getP_quantity() %>" class="qty">
					<input type="submit" value="add to cart" name="add-to cart" class="btn">
				</div>
		
		<% 		
			}
	
		}
		
		
      
    	%>
				
		</div>
	</section>
	
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>
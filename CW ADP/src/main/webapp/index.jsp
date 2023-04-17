<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
	String name = (String) session.getAttribute("name");
	if(session.getAttribute("name")== null){
		
	}
	else{
		session.removeAttribute("name");
	}
	
	if(session.getAttribute("current_user") != null){
		int isAdmin = (int) session.getAttribute("current_user");
		if (isAdmin == 1){
			
			session.setAttribute("credential", "You are Admin!! No access to home page.");
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

  <!-- Font awesome link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!--css link-->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@include file= "navbar.jsp"%>
	
	<section class="home">
	
	<div class="content">
		<h3>Get the clothes at the greatest Quality.</h3>
		<p>lorem ipsum lorem ipsum lorem ipsum lorem ipsumlorem ipsum lorem ipsum lorem ipsum</p>
		<a href="" class="white-btn">discover more</a>
	</div>
	
	
	</section>
	
	<section class="products">
		<h1 class="title">latest products</h1>
		<div class="box-container">
				<div class="box">
					<img src="images/hoodie3.jpg">
					<div class="name">Yellow Tshirt</div>
					<div class="price">Rs 1200 /-</div>
					<input type="number" min="1" name="product_quantity" value="1" class="qty">
					<input type="submit" value="add to cart" name="add-to cart" class="btn">
				</div>
				
				<div class="box">
					<img src="images/hoodie1.jpg">
					<div class="name">Yellow Tshirt</div>
					<div class="price">Rs 1200 /-</div>
					<input type="number" min="1" name="product_quantity" value="1" class="qty">
					<input type="submit" value="add to cart" name="add-to cart" class="btn">
				</div>
				
				<div class="box">
					<img src="images/hoodie2.jpg">
					<div class="name">Yellow Tshirt</div>
					<div class="price">Rs 1200 /-</div>
					<input type="number" min="1" name="product_quantity" value="1" class="qty">
					<input type="submit" value="add to cart" name="add-to cart" class="btn">
				</div>
				
				<div class="box">
					<img src="images/hoodie2.jpg">
					<div class="name">Yellow Tshirt</div>
					<div class="price">Rs 1200 /-</div>
					<input type="number" min="1" name="product_quantity" value="1" class="qty">
					<input type="submit" value="add-to-cart" name="add-to-cart" class="btn">
				</div>
		</div>
	</section>
	
	
	
	
	
	<%@include file= "footer.jsp"%>
	
	<script src="js/script.js"></script>
</body>
</html>
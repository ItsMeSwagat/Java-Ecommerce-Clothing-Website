<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>cart</title>

  <!-- Font awesome link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!--css link-->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
	<%@include file= "navbar.jsp" %>
	<section class="shopping-cart">
	
		<div class="heading">
			<h3>shopping cart</h3>
			<p><a href="index.jsp">home</a>/cart</p>
		</div>
		<h1 class="title">products Added</h1>
		
		<div class="box-container">
			<div class="box">
				<a href=""></a>
				<img src="images/hoodie1.jpg" alt="">
				<div class="name">Hoodie</div>
				<div class="price">Rs 1220/-</div>
				<form action="post" action="">
					<input type="hidden" name="cart_id" value="">
					<input type="number" min="1" name="cart_quantity" value="1"> 
					<input type="submit" name="update_cart" value="update" class="option-btn">
				</form>
				<div class="sub-total">sub total : <span>Rs 1220/-</span></div>
			</div>
		</div>
		<div style="margin-top: 2rem; text-align:center;">
			<a href="" class="delete-btn">delete all</a>
		</div>
		
		<div class="cart-total">
			<p>grand total : <span>Rs 1220/-</span></p>
			<div class="flex">
				<a href="" class="option-btn">continue shopping</a>
				<a href="" class="btn">proceed to checkout</a>
			</div>
		</div>
	</section>
	
	<%@include file="footer.jsp"%>
</body>
</html>
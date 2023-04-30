<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.productOperation.product" %>
<%@ page import="com.productOperation.*" %>
<%@ page import="java.util.List" %>    
<%@ page import="com.cart.*" %> 
<%@ page import="com.cart.CartItem" %>

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
<title>checkout</title>

	<!--css link-->
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>
	<%@include file= "navbar.jsp" %>
	
	<div class="heading">
		<h3>checkout</h3>
		<p><a href="index.jsp">home</a>/checkout</p>
	</div>
	
	<section class="display-order">
	<%
		Cart c = (Cart) session.getAttribute("cart");
		if(c != null || c.getItems().isEmpty() == false){
	        List<CartItem> cartItems = c.getItems();
	        for (CartItem cartItem : cartItems) {
	            product product = cartItem.getProduct();
		
	%>
		<p><%=product.getP_name() %><span>(Rs <%=product.getP_price() %> x <%=cartItem.getQuantity() %>)</span></p>
	<%}
		}
	 %>
	 <c:set var="grandTotal" value="${cart.getTotalPrice()}" />
		<div class="grand-total">grand total : <span>Rs ${grandTotal} /-</span></div>
	</section>
	
	<section class="checkout">
		<%
                    String uemail = (String) session.getAttribute("email");           
                    UserDao userDao = new UserDao();
                    user u = userDao.getUserByEmail(uemail);
                    
                    %>
		
		<form action="orderServlet" method="post">
			<h3>place your order</h3>
			<div class="flex">
				
				<div class="input-box">
					<span>your name:</span>
					<input type="text" name="name" placeholder="enter your name" value="<%=u.getName()  %>">
				</div>
				<div class="input-box">
					<span>your number:</span>
					<input type="text" name="number" placeholder="enter your number" value="<%=u.getPhonenumber()  %>">
				</div>
				<div class="input-box">
					<span>your address:</span>
					<input type="text" name="address" placeholder="enter your address" value="<%=u.getAddress()  %>">
				</div>
				
				<div class="input-box">
					<span>your email:</span>
					<input type="email" name="email" placeholder="enter your email" value="<%=u.getEmail()  %>">
				</div>
				<div class="input-box">
					<span>city:</span>
					<input type="text" name="city" placeholder="Eg :- Biratnagar" required>
				</div>
				<div class="input-box">
					<span>pin code:</span>
					<input type="number" name="pincode" placeholder="Eg :- 123124" required>
				</div>
				<div class="input-box">
					<span>province:</span>
					<select name="province">
						<option value="Koshi Province">koshi Province</option>
						<option value="Madhesh Province">Madhesh Province</option>
						<option value="Bagmati Province">Bagmati Province</option>
						<option value="Gandaki Province">Gandaki Province</option>
						<option value="Lumbini Province">Lumbini Province</option>
						<option value="Karnali Province">Karnali Province</option>
						<option value="Sudurpashchim Province">Sudurpashchim Province</option>
					</select>
				</div>
				<div class="input-box">
					<span>payment method:</span>
					<select name="method">
						<option value="cash on delivery">cash on delivery</option>
						<option value="credit card">credit card</option>
						<option value="paypal">paypal</option>
					</select>
				</div>
			
			</div>
			<a href="cart.jsp" class="option-btn">go back</a>
			<input type="submit" value="order now" class="btn" name="order-btn">
		</form>
	
	
	
	
	</section>




	<%@include file="footer.jsp"%>
</body>
</html>
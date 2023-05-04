<%
	int isAdmin = (int) session.getAttribute("current_user");
	if (isAdmin != 1){
		
		session.setAttribute("credential", "You are not Admin!! No Access");
		response.sendRedirect("login.jsp");
		return;
	}
	
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.productOperation.product" %>
<%@ page import="com.productOperation.*" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>


    <!--css link-->
    <link rel="stylesheet" href="css/admin_style.css">

</head>
<body>

<section class="edit-product-form" id="updateProduct">
	
	<%
		int p_id = Integer.parseInt(request.getParameter("p_id"));
	ProductDao productDao = new ProductDao();
    product product = productDao.getProductById(p_id);
	
	%>
    <form action="updateProduct" method="post" enctype="multipart/form-data">
        <input type="hidden" name="u_p_id" value="<%=product.getP_id()%>">
        <input type="hidden" name="c_image" value="<%=product.getP_image()%>">
        <img src="images/<%=product.getP_image()%>">
        
        <input type="text" name="u_name" value="<%=product.getP_name() %>" class="box" placeholder="enter product name">
        <input type="number" name="u_price" value="<%=product.getP_price() %>" class="box" placeholder="enter product price">
        <input type="number" name="u_quantity" value="<%=product.getP_quantity() %>" class="box" placeholder="enter product quantity">
        <select name="u_category" class="box">
        	<option value="Men">Mens Wear</option>
        	<option value="Women">Womens Wear</option>
        	<option value="children">Children Wear</option>
        </select>        
        <input type="file" class="box" name="u_image" accept="image/jpg, image/jpeg, image/png" value="<%=product.getP_image() %>">
        <input type="submit" value="update" name="update_product" class="btn">
        <input type="reset" value="cancel" id="close-update" class="delete-btn" onclick="window.location.href='admin_product.jsp'">
    </form>

</section>

<script src="js/admin.js"></script>

</body>
</html>
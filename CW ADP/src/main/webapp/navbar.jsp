<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.register.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- Font awesome link-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!--css link-->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
    <header class="header">
    	<%@include file="Message/AlertMessage.jsp"%>
        <div class="header-1">
            <div class="flex">
                <div class="share">
                    <a href="#" class="fab fa-facebook"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
                <p><a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></p>
            </div>
        </div>

        <div class="header-2">
            <div class="flex">
                <a href="index.jsp" class="logo">Shopify</a>

                <nav class="navbar">
                    <a href="index.jsp">Home</a>
                    <a href="shop.jsp">Shop</a>
                    <a href="cart.jsp">Cart</a>
                    <a href="">Orders</a>
                </nav>

                <div class="icons">
                    <div id="menu-btn" class="fas fa-bars"></div>
                    <a href=""><img class="icon" src="images/search.png" style="width: 2.4rem; height: 2.4rem;"></a>
                    <c:if test="${not empty sessionScope.email}">
                    <%
                    String email = (String) session.getAttribute("email");           
                    UserDao userDao = new UserDao();
                    user u = userDao.getUserByEmail(email);
                    
                    %>
                    <a href="updateProfile.jsp?uemail=<%=u.getEmail() %>" id="user-btn"><img src="images/user.png" style="width: 2.4rem; height: 2.4rem;"></a>
                    </c:if>
                    <a href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
                </div>
            </div>
        </div>
    </header>

    <script src="js/script.js"></script>
</body>
</html>
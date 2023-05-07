<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.controller.*" %>
<%@ page import="com.model.*" %>
<jsp:useBean id="cart" class="com.model.Cart" scope="session" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <% int NoOfItems = cart.getNumberOfItems();%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!--css link-->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
    <header class="header">
    	<%@include file="Message/AlertMessage.jsp"%>
        <div class="header-1">
            <div class="flex">
                <div class="share">
                    <a href="#"><img class="icon" src="images/facebook.png" style="width: 2.5rem; height: 2.5rem;"></a>
                    <a href="#"><img class="icon" src="images/twitter.png" style="width: 2.5rem; height: 2.5rem;"></a>
                    <a href="#"><img class="icon" src="images/instagram.png" style="width: 2.5rem; height: 2.5rem;"></a>
                </div>
                <%
                if (session.getAttribute("email") == null){
                %>
                <p><a href="login.jsp">Login</a> | <a href="register.jsp">Register</a></p>
                <%} %>
            </div>
        </div>

        <div class="header-2">
            <div class="flex">
                <a href="index.jsp" class="logo">Shopify</a>

                <nav class="navbar">
                    <a href="index.jsp">Home</a>
                    <a href="shop.jsp">Shop</a>
                    <a href="Order.jsp">Orders</a>
                </nav>

                <div class="icons">
                    <div id="menu-btn"><img class="icon" src="images/menu.png" style="width: 2.4rem; height: 2.4rem;"></div>
                    <a href="shop.jsp"><img class="icon" src="images/search.png" style="width: 2.4rem; height: 2.4rem;"></a>
                    <c:if test="${not empty sessionScope.email}">
                    <%
                    String email = (String) session.getAttribute("email");           
                    UserDao userDao = new UserDao();
                    user u = userDao.getUserByEmail(email);
                    
                    %>
                    <a href="updateProfile.jsp?uemail=<%=u.getEmail() %>" id="user-btn"><img src="images/user.png" style="width: 2.4rem; height: 2.4rem;"></a>
                    </c:if>
                    
                    <%
                    String email = (String) session.getAttribute("email");
                    if(email == null) 
                    {
                    %>
                    <a href="login.jsp"><img class="icon" src="images/grocery-store.png" style="width: 2.5rem; height: 2.5rem;"></a>
                    <%
                    }
                    else{
                    %>
                     <a href="cart.jsp"><img class="icon" src="images/grocery-store.png" style="width: 2.5rem; height: 2.5rem;">(<%= NoOfItems%>)</a>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>
    </header>

    <script src="js/script.js"></script>
</body>
</html>
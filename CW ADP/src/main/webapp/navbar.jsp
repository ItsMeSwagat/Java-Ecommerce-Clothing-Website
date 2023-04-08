<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
        <div class="header-1">
            <div class="flex">
                <div class="share">
                    <a href="#" class="fab fa-facebook"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
                <p><a href="login.html">Login</a> | <a href="register.html">Register</a></p>
            </div>
        </div>

        <div class="header-2">
            <div class="flex">
                <a href="#" class="logo">Shopify</a>

                <nav class="navbar">
                    <a href="">Home</a>
                    <a href="">Shop</a>
                    <a href="">Cart</a>
                    <a href="">Orders</a>
                </nav>

                <div class="icons">
                    <div id="menu-btn" class="fas fa-bars"></div>
                    <a href=""><i class="fas fa-search"></i></a>
                    <div id="user-btn" class="fas fa-user"></div>
                    <a href=""><i class="fas fa-shopping-cart"></i><span>(00)</span></a>
                </div>
                <div class="user-box">
                    <p>name: <span>user</span></p>
                    <p>email: <span>user@gmail.com</span></p>
                    <a href="" class="delete-btn">logout</a>
                </div>
            </div>
        </div>
    </header>

    <script src="script.js"></script>
</body>
</html>
package com.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UpdateCart")
public class UpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public UpdateCart() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // get the product ID and new quantity from the request
        int productId = Integer.parseInt(request.getParameter("cart_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession hs = request.getSession();
        // get the cart from the session
        Cart cart = (Cart) request.getSession().getAttribute("cart");

        // update the quantity of the cart item
        for (CartItem item : cart.getItems()) {
            if (item.getProduct().getP_id() == productId) {
                item.setQuantity(quantity);
                break;
            }
        }

        // update the cart in the session
        request.getSession().setAttribute("cart", cart);
        hs.setAttribute("credential", "Cart Product updated!!");

        // redirect back to the cart page
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
	}

}

package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.*;

@WebServlet("/removeCartProduct")
public class removeCartProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public removeCartProduct() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("cart_id"));
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        
        HttpSession hs = request.getSession();
        if (cart != null) {
            cart.removeItem(productId);
            hs.setAttribute("credential", "Product Removed from cart!!");
            response.sendRedirect(request.getContextPath() + "/cart.jsp");
        }
		
	}	

}

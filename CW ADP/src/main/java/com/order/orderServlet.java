package com.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;
import java.util.ArrayList;

import com.cart.*;
import com.productOperation.*;


@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String number = request.getParameter("number");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String pincode = request.getParameter("pincode");
			String province = request.getParameter("province");
			String payment = request.getParameter("method");
			
			String fullAddress = address+","+city+","+province+","+pincode;
			
			HttpSession session = request.getSession();
			
			if (name == null || name.trim().isEmpty() ||
			        number == null || number.trim().isEmpty() ||
			        email == null || email.trim().isEmpty() ||
			        address == null || address.trim().isEmpty() ||
			        city == null || city.trim().isEmpty() ||
			        pincode == null || pincode.trim().isEmpty() ||
			        province == null || province.trim().isEmpty() ||
			        payment == null || payment.trim().isEmpty()) {

			        session.setAttribute("credential", "Please enter all the details!!!");
			        response.sendRedirect("checkout.jsp");
			        return;
			    }
			
			
			
			Cart c = (Cart) session.getAttribute("cart");
			if(session.getAttribute("cart") != null) {
		        List<CartItem> olist = c.getItems();
		        
		        orderDao orderDao = new orderDao();
		        order o = null;
		        ArrayList<order> orderList = new ArrayList<order>();
		        Random r = new Random();
		        for (CartItem cartItem : olist) {
		            product product = cartItem.getProduct();
		            
		            o = new order();
		            o.setOrder_id(r.nextInt(1000));
		            o.setName(name);
		            o.setEmail(email);
		            o.setNumber(number);
		            o.setFullAddress(fullAddress);
		            o.setProduct_name(product.getP_name());
		            o.setQuantity(cartItem.getQuantity());
		            o.setPrice(cartItem.getProduct().getP_price());
		            o.setPayment(payment);
		            orderList.add(o);
		            
		            
		        }
		        boolean f = orderDao.saveOrder(orderList);
		        if(f) {
		        	session.setAttribute("credential", "Ordered Successfully!!");
		        	session.removeAttribute("cart");
		        	response.sendRedirect("Order.jsp");
		        }
		        else {
		        	session.setAttribute("credential", "Ordered failed!!");
		        	response.sendRedirect("checkout.jsp");
		        }
			}
			else {
				session.setAttribute("credential", "Cart is Empty!!");
				response.sendRedirect("cart.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}

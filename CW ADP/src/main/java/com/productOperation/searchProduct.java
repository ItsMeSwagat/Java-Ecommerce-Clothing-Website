package com.productOperation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class searchProduct
 */
@WebServlet("/searchProduct")
public class searchProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String p_name = request.getParameter("search");

	        // perform the search operation
	        ProductDao productDao = new ProductDao();
	        List<product> productList = productDao.searchProductsByName(p_name);

	        // set the search results as an attribute in the request
	        request.setAttribute("productList", productList);

	        // forward the request to the JSP page to display the search results
	        request.getRequestDispatcher("shop.jsp").forward(request, response);
	}

}

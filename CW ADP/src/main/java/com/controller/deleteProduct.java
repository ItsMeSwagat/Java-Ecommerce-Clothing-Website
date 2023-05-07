package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class deleteProduct
 */
@WebServlet("/deleteProduct")
public class deleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public deleteProduct() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		    String message = "";

		    int p_id = Integer.parseInt(request.getParameter("delete_p_id"));

		    try {
		      Connection con = DatabaseConnection.getConnection();
		      PreparedStatement ps = con.prepareStatement("DELETE FROM product WHERE p_id=?");
		      ps.setInt(1, p_id);

		      int rowDeleted = ps.executeUpdate();
		      if (rowDeleted > 0) {
		        message = "Product deleted successfully!";
		      } else {
		        message = "Error deleting product!";
		      }
		    } catch (SQLException e) {
		      message = "Error deleting product: " + e.getMessage();
		    }

		    session.setAttribute("credential", message);
		    response.sendRedirect("admin_product.jsp");
		
	}

}

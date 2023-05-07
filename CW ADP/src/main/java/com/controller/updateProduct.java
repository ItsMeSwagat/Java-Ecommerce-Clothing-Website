package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class updateProduct
 */
@WebServlet("/updateProduct")
@MultipartConfig
public class updateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public updateProduct() {
        super();
       
    }


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String message = "";

        String p_id = request.getParameter("u_p_id");
        String p_name = request.getParameter("u_name");
        String p_price = request.getParameter("u_price");
        String p_quantity = request.getParameter("u_quantity");
        String p_category = request.getParameter("u_category");

        Part part = request.getPart("u_image");
        String fileName = null;
        InputStream fileContent = null;
        
        if (part != null && part.getSize() > 0) {
	        fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
	        fileContent = part.getInputStream();
	        Files.copy(fileContent, Paths.get(getServletContext().getRealPath("/images"), fileName),
	               StandardCopyOption.REPLACE_EXISTING);
        }
        else {
        	fileName = request.getParameter("c_image");
        }

        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE product SET p_name=?, p_price=?, p_quantity=?, p_category=?, p_image=? WHERE p_id=?");
            ps.setString(1, p_name);
            ps.setString(2, p_price);
            ps.setString(3, p_quantity);
            ps.setString(4, p_category);
            ps.setString(5, fileName);
            ps.setString(6, p_id);

            int rowUpdated = ps.executeUpdate();
            if (rowUpdated > 0) {
                message = "Product updated successfully!";
                
            } else {
                message = "Error updating product!";
            }
        } catch (Exception e) {
            message = "Error updating product: " + e.getMessage();
        }

        session.setAttribute("credential", message);
        response.sendRedirect("admin_product.jsp");
    
	}

}

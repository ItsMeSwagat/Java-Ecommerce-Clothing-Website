package com.productOperation;

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
 * Servlet implementation class ProductOperation
 */
@WebServlet("/addProduct")
@MultipartConfig
public class addProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public addProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String p_name = request.getParameter("p_name");
		int p_price = Integer.parseInt(request.getParameter("p_price"));
		int p_quantity = Integer.parseInt(request.getParameter("p_quantity"));
		String p_category = request.getParameter("p_category");
		Part part= request.getPart("p_image");
		
		HttpSession hs = request.getSession();
		
		product p = new product();
		p.setP_name(p_name);
		p.setP_price(p_price);
		p.setP_quantity(p_quantity);
		p.setP_category(p_category);
		
		
				String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
				InputStream fileContent = part.getInputStream();
				Files.copy(fileContent, Paths.get(getServletContext().getRealPath("/images"), fileName), StandardCopyOption.REPLACE_EXISTING);
				p.setP_image(fileName);
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO product (p_name, p_price, p_quantity, p_category, p_image) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, p.getP_name());
			ps.setInt(2, p.getP_price());
			ps.setInt(3, p.getP_quantity());
			ps.setString(4, p.getP_category());
			ps.setString(5, p.getP_image());
			ps.executeUpdate();
			hs.setAttribute("credential", "Product added successfully!!");
			response.sendRedirect("admin_product.jsp");
		} catch (Exception e) {
			hs.setAttribute("credential", "Error adding product: " + e.getMessage());
			response.sendRedirect("admin_product.jsp");
		}
		
	}
	
	
}

package com.register;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class registerServlet
 */
@WebServlet("/register")
@MultipartConfig
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		Part part = request.getPart("image");
		
		String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		InputStream fileContent = part.getInputStream();
		Files.copy(fileContent, Paths.get(getServletContext().getRealPath("/images"), fileName), StandardCopyOption.REPLACE_EXISTING);
		
		
		user u = new user();
		u.setName(name);
		u.setEmail(email);
		u.setPhonenumber(phonenumber);
		u.setAddress(address);
		u.setPassword(password);
		u.setImage(fileName);
		
		HttpSession hs = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
		    Connection con = DatabaseConnection.getConnection();
		    String query = "insert into user(name,email,phonenumber,address,password,image)" + "values(?,?,?,?,?,?)";;
		    PreparedStatement pst = con.prepareStatement(query);
		    pst.setString(1, u.getName());
		    pst.setString(2, u.getEmail());
		    pst.setString(3, u.getPhonenumber());
		    pst.setString(4, u.getAddress());
		    pst.setString(5, u.getPassword());
		    pst.setString(6, u.getImage());
		        	
		    int rowCount = pst.executeUpdate();
		    dispatcher = request.getRequestDispatcher("register.jsp");
		    if (rowCount > 0) {
		        hs.setAttribute("credential", "Account Registered Successfully!!");
		        
		    } else {
		        hs.setAttribute("credential", "Account Registration failed!!");
		    }
		    dispatcher.forward(request, response);
		
		}
		catch (Exception ex){
			hs.setAttribute("credential", "Please enter valid email.");
			dispatcher = request.getRequestDispatcher("register.jsp");
		    dispatcher.forward(request, response);
			
			
		}
		

	}

}

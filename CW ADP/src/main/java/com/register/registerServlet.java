package com.register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.DatabaseConnection;
/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/register")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phonenumber = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String image = request.getParameter("image");
		
		HttpSession hs = request.getSession();
		RequestDispatcher dispatcher = null;
		
		 //Inserting all values inside the database
        try {
            //Connecting database connection and querying in the database
        	Connection con = DatabaseConnection.getConnection();
        	String query = "insert into user(name,email,phonenumber,address,password,image)" + "values(?,?,?,?,?,?)";;
        	PreparedStatement pst = con.prepareStatement(query);
        	pst.setString(1, name);
        	pst.setString(2, email);
        	pst.setString(3, phonenumber);
        	pst.setString(4, address);
        	pst.setString(5, password);
        	pst.setString(6, image);
        	
        	int rowCount = pst.executeUpdate();
        	dispatcher = request.getRequestDispatcher("register.html");
            //If customer registered successfully in java online shopping system
            if (rowCount > 0) {
                String message = "Customer registered successfully.";
                //Passing message via session.
                hs.setAttribute("success-message", message);
               
                //Sending response back to the user/customer
                response.sendRedirect("register.html");
            } else {
                 //If customer fails to register 
                String message = "Customer registration fail";
                //Passing message via session.
                hs.setAttribute("fail-message", message);
                //Sending response back to the user/customer
                response.sendRedirect("register.html");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

	}

}

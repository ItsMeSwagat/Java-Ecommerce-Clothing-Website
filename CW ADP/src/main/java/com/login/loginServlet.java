package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

import com.connection.DatabaseConnection;
import com.register.UserDao;
import com.register.user;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public loginServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession hs = request.getSession();
	
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement("select * from user where email = ? and password = ?");
			pst.setString(1, email);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			 if (email.isEmpty() == false || password.isEmpty()== false) {
	                if (rs.next()) {
	                    //Storing the login details in session
	                    hs.setAttribute("current_user", rs.getInt("isAdmin"));
	                    hs.setAttribute("name", rs.getString("name"));
	                    
	                    
	                    if(rs.getInt("isAdmin")== 1) {
	                    	response.sendRedirect("admin.jsp");
	                    	hs.setAttribute("name",rs.getString("name"));
	                    	hs.setAttribute("email", rs.getString("email"));
	                    }
	                    else {
	                    	 //Redirecting response to the index.jsp
		                    response.sendRedirect("index.jsp");
		                    hs.setAttribute("email",rs.getString("email"));
		                    Cookie user= new Cookie("user",rs.getString("email") );
		                    response.addCookie(user);
		                    
	                    }
	                   
	                } else {
	                    //If wrong credentials are entered
	                    String message = "You have entered wrong credentials";
	                    hs.setAttribute("credential", message);
	                    //Redirecting response to the login.jsp
	                    response.sendRedirect("login.jsp");
	                }
	           } else {
	                //If username or password is empty or null
	                String message = "Please enter both Email or Password ";
	                hs.setAttribute("credential", message);
	                //Redirecting response to the login.jsp
	                response.sendRedirect("login.jsp");
	            }
			 
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		finally {
        	DatabaseConnection.CloseConnection();
        }
		

		
	}
		
}



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
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String ADMIN_ID = "admin@gmail.com";
	private final String ADMIN_PASSWORD = "admin";
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession hs = request.getSession();
		RequestDispatcher dispatcher = null;
		
		
		try {
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement("select * from user where email = ? and password = ?");
			pst.setString(1, email);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			if(ADMIN_ID.equals(email)&& ADMIN_PASSWORD.equals(password)) {
				dispatcher = request.getRequestDispatcher("admin.jsp");
			}
			else if(rs.next()) {
				hs.setAttribute("email", rs.getString("email"));
				dispatcher = request.getRequestDispatcher("index.jsp");
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			dispatcher.forward(request, response);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}

}

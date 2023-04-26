package com.register;

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
 * Servlet implementation class updateProfile
 */
@WebServlet("/updateProfile")
@MultipartConfig
public class updateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String message = "";

        String email = request.getParameter("old_email");
        String name = request.getParameter("updateName");
        String phonenumber = request.getParameter("updatePhonenumber");
        String address = request.getParameter("updateAddress");
        String password = request.getParameter("updatePassword");

        Part part = request.getPart("updateImage");
        String fileName = null;
        InputStream fileContent = null;
        
        if (part != null && part.getSize() > 0) { // check if the image is uploaded
        	fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            fileContent = part.getInputStream();
            Files.copy(fileContent, Paths.get(getServletContext().getRealPath("/images"), fileName),
                   StandardCopyOption.REPLACE_EXISTING);
        } else { // if the image is not uploaded, use the current image value
        	fileName = request.getParameter("current_image");
        }
        
        
        
        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE user SET name=?, phonenumber=?, address=?, password=?, image=? WHERE email=?");
            ps.setString(1, name);
            ps.setString(2, phonenumber);
            ps.setString(3, address);
            ps.setString(4, password);
            ps.setString(5, fileName);
            ps.setString(6, email);

            int rowUpdated = ps.executeUpdate();
            if (rowUpdated > 0) {
                message = "Profile updated successfully!";
                
            } else {
                message = "Error updating profile!";
            }
        } catch (Exception e) {
            message = "Error updating profile: " + e.getMessage();
        }

        session.setAttribute("credential", message);
        response.sendRedirect("index.jsp");
    
	}

}

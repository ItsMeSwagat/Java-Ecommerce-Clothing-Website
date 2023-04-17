package com.register;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.connection.DatabaseConnection;

public class UserDao {
    private Connection con;

    public UserDao() {
    	con = DatabaseConnection.getConnection();
    }

    // Get user by email
    public user getUserByEmail(String email) {
        user u = new user();
        try {
            String query = "SELECT * FROM user WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new user();
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhonenumber(rs.getString("phonenumber"));
                u.setAddress(rs.getString("address"));
                u.setPassword(rs.getString("password"));
                u.setImage(rs.getString("image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    // Update user by email
    public boolean updateUserByEmail(user u) {
        boolean flag = false;
        try {
            String query = "UPDATE user SET name=?, phonenumber=?, address=?, password=?, image=? WHERE email=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getName());
            ps.setString(2, u.getPhonenumber());
            ps.setString(3, u.getAddress());
            ps.setString(4, u.getPassword());
            ps.setString(5, u.getImage());
            ps.setString(6, u.getEmail());

            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}

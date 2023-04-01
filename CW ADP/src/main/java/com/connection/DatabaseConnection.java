package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseConnection {

    //Creating database Connection in java
    public static Connection con;

    //Creating universal method to open connect will mysql database
    public static Connection getConnection() {
        try {
            //Registering with mysql Driver
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursework", "root", "");
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (con);
    }

    //Creating universal method to close connect will mysql database
    public static void CloseConnection() {
        if (con != null) {
            try {
                con.close();
                con = null;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

}

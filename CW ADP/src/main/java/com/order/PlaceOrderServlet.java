package com.order;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;
import com.productOperation.*;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<product> cartItems = (List<product>) session.getAttribute("cartItems");
        String customerName = request.getParameter("customerName");
        String customerEmail = request.getParameter("customerEmail");
        String shippingAddress = request.getParameter("shippingAddress");

        if (cartItems == null || cartItems.isEmpty()) {
            session.setAttribute("orderStatus", "No items in the cart. Please add items before placing an order.");
            response.sendRedirect("cart.jsp");
            return;
        }

        try {
            Connection con = DatabaseConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO orders (customerName, customerEmail, shippingAddress) VALUES (?, ?, ?)");
            ps.setString(1, customerName);
            ps.setString(2, customerEmail);
            ps.setString(3, shippingAddress);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                int orderId = getGeneratedOrderId(con);
                insertOrderItems(con, orderId, cartItems);
                session.setAttribute("orderStatus", "Order placed successfully!");
                session.removeAttribute("cartItems");
                response.sendRedirect("orderConfirmation.jsp");
            } else {
                session.setAttribute("orderStatus", "Failed to place the order. Please try again.");
                response.sendRedirect("cart.jsp");
            }
        } catch (SQLException e) {
            session.setAttribute("orderStatus", "Error placing the order: " + e.getMessage());
            response.sendRedirect("cart.jsp");
        }
    }

    private int getGeneratedOrderId(Connection con) throws SQLException {
        PreparedStatement ps = con.prepareStatement("SELECT LAST_INSERT_ID()");
        int orderId = 0;
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
        }
        return orderId;
    }

    private void insertOrderItems(Connection con, int orderId, List<product> cartItems) throws SQLException {
        PreparedStatement ps = con.prepareStatement("INSERT INTO order_items (orderId, productId, quantity, price) VALUES (?, ?, ?, ?)");
        for (product product : cartItems) {
            ps.setInt(1, orderId);
            ps.setInt(2, product.getP_id());
            ps.setInt(3, product.getP_quantity());
            ps.setDouble(4, product.getP_price());
            ps.addBatch();
        }
        ps.executeBatch();
    }
}

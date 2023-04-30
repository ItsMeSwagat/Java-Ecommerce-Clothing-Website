package com.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.connection.DatabaseConnection;
import com.productOperation.product;
import com.register.*;

public class OrderController {
	final private static boolean OP_SUCCESS = true;
	final private static boolean OP_FAILED = false;
	
	private static ArrayList<order> orders = new ArrayList<order>();

	public static ArrayList<order> getOrders() {
		return orders;
	}

	public static void setOrders(ArrayList<order> orders) {
		OrderController.orders = orders;
	}
	
	public static boolean fetchAllOrders() {
		orders.clear();
		try {
			Connection con = DatabaseConnection.getConnection();
			final String allOrdersQuery = "SELECT * FROM orders;";
			PreparedStatement allOrdersStmt = con.prepareStatement(allOrdersQuery);
			ResultSet allOrdersResultSet = allOrdersStmt.executeQuery();
			UserDao userDao = new UserDao();
			while (allOrdersResultSet.next()) {
				int orderId = allOrdersResultSet.getInt("orders.id");
				String date = allOrdersResultSet.getDate("date").toString();
				float total = allOrdersResultSet.getFloat("order_total");
				user user = userDao.getUserByEmail(allOrdersResultSet.getString("c_email"));
				
				ArrayList<OrderItem> orderItems = new ArrayList<OrderItem>();
				String orderDetailQuery = "SELECT * FROM orders "
						+ "JOIN order_product ON order_product.order_id=orders.id "
						+ "JOIN product ON order_product.product_id=product.id "
						+ "WHERE orders.id = ?;";
				PreparedStatement orderDetailStmt = con.prepareStatement(orderDetailQuery);
				orderDetailStmt.setInt(1, orderId);
				ResultSet orderDetailResultSet = orderDetailStmt.executeQuery();
				
				while(orderDetailResultSet.next()) {
					int id = orderDetailResultSet.getInt("product.p_id");
					String name = orderDetailResultSet.getString("product.p_name");
					int price = orderDetailResultSet.getInt("product.p_price");
					String category = orderDetailResultSet.getString("product.p_category");
					String image = orderDetailResultSet.getString("product.p_iamge");
					int quantity = orderDetailResultSet.getInt("order_product.quantity");
					
					product product = new product(id, name, price, quantity, image, category);
					OrderItem orderItem = new OrderItem(product, quantity);
					orderItems.add(orderItem);
				}
				orderDetailResultSet.close();
				orderDetailStmt.close();
				
				order order = new order();
				orders.add(order);
			}
			allOrdersResultSet.close();
			allOrdersStmt.close();
			con.close();
			return OP_SUCCESS;
		} catch (SQLException e) {
			e.printStackTrace();
			return OP_FAILED;
		}
	}

	public static boolean createOrder(int userId, ArrayList<OrderItem> currentCart) {
		try {
			Connection con = DatabaseConnection.getConnection();
			float orderTotal = OrderItemController.calculateCartTotal(currentCart);
			String orderInsertQuery = "INSERT INTO orders(order_total, customer) VALUES (?, ?)";
			PreparedStatement orderInsertStmt = con.prepareStatement(orderInsertQuery, Statement.RETURN_GENERATED_KEYS);
			orderInsertStmt.setFloat(1, orderTotal);
			orderInsertStmt.setInt(2, userId);
			int orderInsertStatus = orderInsertStmt.executeUpdate();
			if(orderInsertStatus <= 0) {
				return OP_FAILED;
			}
			ResultSet orderIdResultSet = orderInsertStmt.getGeneratedKeys();
			orderIdResultSet.next();
			int orderId = orderIdResultSet.getInt(1);

			for (OrderItem item : currentCart) {
				String orderDetailQuery = "INSERT INTO order_product VALUES (?,?,?)";
				int productId = item.getProduct().getP_id();
				int productQty = item.getQuantity();
				PreparedStatement orderDetailStmt = con.prepareStatement(orderDetailQuery);
				orderDetailStmt.setInt(1, orderId);
				orderDetailStmt.setInt(2, productId);
				orderDetailStmt.setInt(3, productQty);
				int orderDetailStatus = orderDetailStmt.executeUpdate();
				if(orderDetailStatus <= 0) {
					return OP_FAILED;
				}
				orderDetailStmt.close();
			}
			orderIdResultSet.close();
			orderInsertStmt.close();
			con.close();
			return OP_SUCCESS;
		} catch (SQLException e) {
			e.printStackTrace();
			return OP_FAILED;
		}
	}

}

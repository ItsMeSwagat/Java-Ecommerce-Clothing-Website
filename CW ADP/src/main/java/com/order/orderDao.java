package com.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.connection.DatabaseConnection;

public class orderDao {
	private Connection con;

    public orderDao() {
    	con = DatabaseConnection.getConnection();
    }
    
    
    public boolean saveOrder(List<order> olist) {
    	boolean f = false;
    	try {
    		
    		String sql = "insert into orderdata(order_id,name,email,address,phone,product_name,quantity,price,payment) values(?,?,?,?,?,?,?,?,?)";
    		con.setAutoCommit(false);
    		PreparedStatement ps = con.prepareStatement(sql);
    		
    		for(order o:olist) {
    			ps.setInt(1, o.getOrder_id());
    			ps.setString(2, o.getName());
    			ps.setString(3, o.getEmail());
    			ps.setString(4, o.getFullAddress());
    			ps.setString(5, o.getNumber());
    			ps.setString(6, o.getProduct_name());
    			ps.setInt(7, o.getQuantity());
    			ps.setInt(8, o.getPrice());
    			ps.setString(9, o.getPayment());
    			ps.addBatch();
    		}
    		int[] count = ps.executeBatch();
    		con.commit();
    		f = true;
    		con.setAutoCommit(true);
    		
    		
    		
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	
    	return f;
    }
    
    public List<order> getOrder(String email){
    	List<order> list = new ArrayList<order>();
    	order o = null;
    	
    	
    	
    	try {
    		
    		String sql = "select * from orderdata where email=?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setString(1, email);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			o = new order();
    			o.setId(rs.getInt(1));
    			o.setOrder_id(rs.getInt(2));
    			o.setName(rs.getString(3));
    			o.setEmail(rs.getString(4));
    			o.setFullAddress(rs.getString(5));
    			o.setNumber(rs.getString(6));
    			o.setProduct_name(rs.getString(7));
    			o.setQuantity(rs.getInt(8));
    			o.setPrice(rs.getInt(9));
    			o.setPayment(rs.getString(10));	
    			list.add(o);
    		}
    		
    		
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    	return list;
    }
    
    public List<order> getOrderAdmin(){
    	List<order> list = new ArrayList<order>();
    	order o = null;
    	
    	
    	
    	try {
    		
    		String sql = "select * from orderdata";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			o = new order();
    			o.setId(rs.getInt(1));
    			o.setOrder_id(rs.getInt(2));
    			o.setName(rs.getString(3));
    			o.setEmail(rs.getString(4));
    			o.setFullAddress(rs.getString(5));
    			o.setNumber(rs.getString(6));
    			o.setProduct_name(rs.getString(7));
    			o.setQuantity(rs.getInt(8));
    			o.setPrice(rs.getInt(9));
    			o.setPayment(rs.getString(10));	
    			list.add(o);
    		}
    		
    		
    	}
    	catch(Exception e){
    		e.printStackTrace();
    	}
    	return list;
    	
    	
    }
    
    public int getTotalOrders() {
        int totalOrders = 0;
        try {
            String query = "SELECT COUNT(*) FROM orderdata";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalOrders = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalOrders;
    }
    
}

	
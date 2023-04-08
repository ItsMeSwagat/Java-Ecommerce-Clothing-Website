package com.productOperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.connection.DatabaseConnection;

public class ProductDao {
    private Connection con;

    public ProductDao() {
        con = DatabaseConnection.getConnection();
    }

    // add a new product to the database
    public void addProduct(product product) {
        try {
            PreparedStatement preparedStatement = con.prepareStatement(
                    "INSERT INTO product(p_name, p_price, p_quantity, p_category, p_image) VALUES (?, ?, ?, ?, ?)");
            preparedStatement.setString(1, product.getP_name());
            preparedStatement.setDouble(2, product.getP_price());
            preparedStatement.setInt(3, product.getP_quantity());
            preparedStatement.setString(4, product.getP_category());
            preparedStatement.setString(5, product.getP_image());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // get a list of all products in the database
    public List<product> getAllProducts() {
        List<product> productList = new ArrayList<product>();
        try {
            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM product");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                product product = new product();
                product.setP_id(resultSet.getInt("p_id"));
                product.setP_name(resultSet.getString("p_name"));
                product.setP_price(resultSet.getInt("p_price"));
                product.setP_quantity(resultSet.getInt("p_quantity"));
                product.setP_category(resultSet.getString("p_category"));
                product.setP_image(resultSet.getString("p_image"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    // get a product by its ID
    public product getProductById(int p_id) {
        product product = new product();
        try {
            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM product WHERE p_id=?");
            preparedStatement.setInt(1, p_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                product.setP_id(resultSet.getInt("p_id"));
                product.setP_name(resultSet.getString("p_name"));
                product.setP_price(resultSet.getInt("p_price"));
                product.setP_quantity(resultSet.getInt("p_quantity"));
                product.setP_category(resultSet.getString("p_category"));
                product.setP_image(resultSet.getString("p_image"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    // update an existing product
    public void updateProduct(product product) {
        try {
            PreparedStatement preparedStatement = con.prepareStatement(
                    "UPDATE product SET p_name=?, p_price=?, p_quantity=?, p_category=?, p_image=? WHERE p_id=?");
            preparedStatement.setString(1, product.getP_name());
            preparedStatement.setDouble(2, product.getP_price());
            preparedStatement.setInt(3, product.getP_quantity());
            preparedStatement.setString(4, product.getP_category());
            preparedStatement.setString(5, product.getP_image());
            preparedStatement.setInt(6, product.getP_id());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // delete a product from the database
    public void deleteProduct(int productId) {
        try {
            PreparedStatement preparedStatement = con.prepareStatement("DELETE FROM product WHERE p_id=?");
            preparedStatement.setInt(1, productId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

package com.codegym.dao.product;

import com.codegym.dao.database.Jdbc;
import com.codegym.model.Product;

import javax.swing.plaf.nimbus.State;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO {

    private static final String INSERT_PRODUCT_SQL = "INSERT INTO Product" +
            " (name, price,quantity,color,description,categoryID) VALUES " +
            " (?, ?, ?, ?, ?,?);";
    private static final String SELECT_PRODUCT_BY_ID_SQL = "SELECT * FROM Product where id = ?;";
    private static final String SELECT_ALL_PRODUCT_SQL = "SELECT * FROM Product";
    private static final String DELETE_PRODUCT_BY_ID_SQL = "DELETE  FROM Product where id = ?;";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE Product SET " +
            "name = ?, price = ? , quantity = ?, color = ?, description = ?,categoryID = ?" +
            " where id = ?;";
    private static final String SELECT_BY_SEARCH = "SELECT * from Product where name like ?;";

    protected Connection getConnection() {
        Connection connection = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");  ;
            connection = DriverManager.getConnection(Jdbc.jdbcURL, Jdbc.jdbcUsername, Jdbc.jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public void insertProduct(Product product) throws SQLException {
        System.out.println(INSERT_PRODUCT_SQL);
        try
                (Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL);) {
            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setDouble(2, product.getProductPrice());
            preparedStatement.setInt(3, product.getProductQuantity());
            preparedStatement.setString(4, product.getProductColor());
            preparedStatement.setString(5, product.getProductDesc());
            preparedStatement.setInt(6, product.getProductCategory());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public Product selectProduct(int id) throws SQLException {
        Product product = null;
        try
                (Connection connection = getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID_SQL);) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int Productid = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int categoryID = resultSet.getInt("categoryID");
                product = new Product(Productid, name, price, quantity, color, description,categoryID);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return product;
    }

    @Override
    public List<Product> selectAllProduct() throws SQLException {
        List<Product> products = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT_SQL);
        try {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int Productid = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int categoryID = resultSet.getInt("categoryID");
                products.add(new Product(Productid, name, price, quantity, color, description,categoryID));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return products;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_BY_ID_SQL);
        statement.setInt(1, id);
        rowDeleted = statement.executeUpdate() > 0;
        return rowDeleted;
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        boolean rowUpdated;
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL);

        preparedStatement.setString(1, product.getProductName());
        preparedStatement.setDouble(2, product.getProductPrice());
        preparedStatement.setInt(3, product.getProductQuantity());
        preparedStatement.setString(4, product.getProductColor());
        preparedStatement.setString(5, product.getProductDesc());
        preparedStatement.setInt(6, product.getProductCategory());
        preparedStatement.setInt(7, product.getProductId());

        System.out.println(preparedStatement);

        rowUpdated = preparedStatement.executeUpdate() > 0;

        return rowUpdated;
    }


    public List<Product> getProductsBySearch(String productName) throws SQLException {

        List<Product> products = new ArrayList<>();

        Connection connection = getConnection();
        PreparedStatement preparedStatement;
        preparedStatement = connection.prepareStatement(SELECT_BY_SEARCH);
        preparedStatement.setString(1, '%' + productName + '%');
              try {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int Productid = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int categoryID = resultSet.getInt("categoryID");
                products.add(new Product(Productid, name, price, quantity, color, description,categoryID));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

}


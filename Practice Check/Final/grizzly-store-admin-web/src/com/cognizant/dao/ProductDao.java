package com.cognizant.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.cognizant.bean.ProductBean;

public class ProductDao {
	
	
	public List<ProductBean> readAll() throws ClassNotFoundException, SQLException {
        List<ProductBean> prodList = new ArrayList<ProductBean>();
        ConnectionDao conDao = new ConnectionDao();
        Connection con = conDao.Connect();
        String readQuery = "SELECT * FROM products WHERE is_blocked=0";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(readQuery);
        
        
        while (rs.next()) {
               ProductBean prod = new ProductBean();
               prod.setProductId(rs.getInt(1));
               prod.setProductName(rs.getString(2));
               prod.setProductBrand(rs.getString(3));
               prod.setCategory(rs.getString(4));
               prod.setRating(rs.getInt(5));
               prodList.add(prod);
        }
        return prodList;
	}
	
	
	
	public int insert(ProductBean prod) throws ClassNotFoundException, SQLException {
		ConnectionDao conDao = new ConnectionDao();
        Connection con = conDao.Connect();
        String insertQuery = "INSERT INTO products (product_name, product_brand, category, rating, discount, description, price) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(insertQuery);
        
        pstmt.setString(1, prod.getProductName());
        pstmt.setString(2, prod.getProductBrand());
        pstmt.setString(3, prod.getCategory());
        pstmt.setInt(4, prod.getRating());
        pstmt.setInt(5, prod.getDiscount());
        pstmt.setString(6, prod.getDescription());
        pstmt.setInt(7, prod.getPrice());

        int insertStatus = 0;
        insertStatus = pstmt.executeUpdate();
        return insertStatus;
	}
	
	
    public ProductBean read(int prodId) throws ClassNotFoundException, SQLException {
    	ConnectionDao conDao = new ConnectionDao();
        Connection con = conDao.Connect();
        String readQuery = "SELECT * FROM products WHERE product_id="+prodId;
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(readQuery);
        ProductBean prod = new ProductBean();
        if (rs.next()) {
        	prod.setProductName(rs.getString("product_name"));
        	prod.setProductBrand(rs.getString("product_brand"));
        	prod.setRating(rs.getInt("rating"));
        	prod.setDescription(rs.getString("description"));
        	prod.setPrice(rs.getInt("price"));
        	prod.setDiscount(rs.getInt("discount"));

        }
        return prod;
    }
    
    public int blockProduct(int prodId) throws ClassNotFoundException, SQLException {
    	ConnectionDao conDao = new ConnectionDao();
        Connection con = conDao.Connect();
        
        String blockQuery = "UPDATE products SET is_blocked=1 WHERE product_id="+prodId;
       
        Statement stmt = con.createStatement();
        
        int blockStatus = 0;
        
        blockStatus = stmt.executeUpdate(blockQuery);

        
        

        return blockStatus;

    }
    
    
    public int deleteProduct(int prodId) throws ClassNotFoundException,  SQLException {
    	ConnectionDao conDao = new ConnectionDao();
        Connection con = conDao.Connect();
        
        String deleteQuery = "DELETE FROM products WHERE product_id="+prodId;
      
        
        Statement stmt = con.createStatement();
        
        int deleteStatus = 0;
        
        deleteStatus = stmt.executeUpdate(deleteQuery);
        
        return deleteStatus;
    }




}

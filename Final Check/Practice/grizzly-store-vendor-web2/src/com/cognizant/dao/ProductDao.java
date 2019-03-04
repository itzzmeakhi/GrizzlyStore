package com.cognizant.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



import com.cognizant.bean.ProductBean;
import com.cognizant.bean.ProductQuantityBean;


public class ProductDao {
	
	// To get the Column Names of the table
	
	/*public List<String> readProductColumnNames() throws ClassNotFoundException, SQLException {
        List<String> prodHeaderList = new ArrayList<String>();
        ConnectionDao conDao = new ConnectionDao();
        Connection con = conDao.Connect();
        String readQuery = "SELECT prod_name, id, prod_brand, prod_category, prod_offer FROM product_details Limit 1";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(readQuery);
        
        ResultSetMetaData rsmd = rs.getMetaData();
        
        int columnCount = rsmd.getColumnCount();
        
        
        while (rs.next()) {
        	
        	for(int iter = 1; iter <= columnCount; iter++) {
        		prodHeaderList.add(rsmd.getColumnName(iter));
        	}
        }
        stmt.close();
        rs.close();
        rsmd.close();
        con.close();
        return prodHeaderList;
	}*/
	
	
	// To get the Product table data
	
	
	public List<ProductBean> readAll(int roleId) throws ClassNotFoundException, SQLException {
        List<ProductBean> prodList = new ArrayList<ProductBean>();
        ConnectionDao conDao = new ConnectionDao();
        Connection con = conDao.Connect();
        String readQuery = "SELECT * FROM product_details WHERE role_id="+ roleId;
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(readQuery);
        
        
        while (rs.next()) {
			ProductBean prod = new ProductBean();
			prod.setProdName(rs.getString(3));
			prod.setId(rs.getInt(1));
			prod.setRoleId(rs.getInt(2));
			prod.setProdBrand(rs.getString(4));
			prod.setProdCategory(rs.getString(6));
			prod.setProdDescription(rs.getString(5));
			prod.setProdOffer(rs.getInt(8));
			prod.setProdPrice(rs.getInt(7));
			prod.setRating(rs.getInt(9));
			prod.setIsBlocked(rs.getInt(10));
			prod.setProdId(rs.getString(11));

			prodList.add(prod);
        }
        stmt.close();
        rs.close();
        return prodList;
	}
	
	
	
	public int insertProduct(ProductBean prod) throws ClassNotFoundException, SQLException {
		
		
		ConnectionDao conDao = new ConnectionDao();
		Connection con = conDao.Connect();
		
		String insertQuery = "INSERT INTO product_details (role_id, prod_name, prod_brand, prod_description, prod_category, prod_price, prod_offer, rating, prod_id) VALUES (?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement pstmt = con.prepareStatement(insertQuery);
		
		pstmt.setInt(1, prod.getRoleId());
		pstmt.setString(2, prod.getProdName());
		pstmt.setString(3, prod.getProdBrand());
		pstmt.setString(4, prod.getProdDescription());
		pstmt.setString(5, prod.getProdCategory());
		pstmt.setInt(6, prod.getProdPrice());
		pstmt.setInt(7, prod.getProdOffer());
		pstmt.setInt(8, prod.getRating());
		pstmt.setString(9, prod.getProdId());
		
		int insertStatus = 0;
		insertStatus = pstmt.executeUpdate();
		
		return insertStatus;
	}
	
	
	

}

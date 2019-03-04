package com.cognizant.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



import com.cognizant.bean.ProductBean;


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
	
	
	// To get the table data
	
	
	
	public List<ProductBean> readAll() throws ClassNotFoundException, SQLException {
        List<ProductBean> prodList = new ArrayList<ProductBean>();
        ConnectionDao conDao = new ConnectionDao();
        Connection con = conDao.Connect();
        String readQuery = "SELECT * FROM product_details";
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
	   			prod.setInStock(rs.getInt(9));
	   			prod.setRem(rs.getInt(10));
	   			prod.setBuffer(rs.getInt(11));
	   			prod.setRating(rs.getInt(12));
	   			prod.setIsBlocked(rs.getInt(13));
	   			prod.setPending(rs.getInt(14));
               
               prodList.add(prod);
        }
        return prodList;
	}
	
	

}

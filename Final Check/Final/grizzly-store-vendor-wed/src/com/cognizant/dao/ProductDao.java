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
import com.cognizant.bean.QuantityBean;

public class ProductDao {

	// To get the Column Names of the table

	/*
	 * public List<String> readProductColumnNames() throws ClassNotFoundException,
	 * SQLException { List<String> prodHeaderList = new ArrayList<String>();
	 * ConnectionDao conDao = new ConnectionDao(); Connection con =
	 * conDao.Connect(); String readQuery =
	 * "SELECT prod_name, id, prod_brand, prod_category, prod_offer FROM product_details Limit 1"
	 * ; Statement stmt = con.createStatement(); ResultSet rs =
	 * stmt.executeQuery(readQuery);
	 * 
	 * ResultSetMetaData rsmd = rs.getMetaData();
	 * 
	 * int columnCount = rsmd.getColumnCount();
	 * 
	 * 
	 * while (rs.next()) {
	 * 
	 * for(int iter = 1; iter <= columnCount; iter++) {
	 * prodHeaderList.add(rsmd.getColumnName(iter)); } } stmt.close(); rs.close();
	 * rsmd.close(); con.close(); return prodHeaderList; }
	 */

	// To get the product_details table data

	public List<ProductBean> readAll(int roleId) throws ClassNotFoundException, SQLException {
		List<ProductBean> prodList = new ArrayList<ProductBean>();
		ConnectionDao conDao = new ConnectionDao();
		Connection con = conDao.Connect();
		String readQuery = "SELECT prod_name, prod_id, prod_brand, prod_category, prod_offer, id FROM product_details WHERE role_id="+ roleId;
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);

		while (rs.next()) {
			ProductBean prod = new ProductBean();

			prod.setProdName(rs.getString(1));
			prod.setProdId(rs.getString(2));
			prod.setProdBrand(rs.getString(3));
			prod.setProdCategory(rs.getString(4));
			prod.setProdOffer(rs.getInt(5));
			prod.setId(rs.getInt(6));

			prodList.add(prod);
		}
		stmt.close();
		rs.close();
		return prodList;
	}

	// Inventory Data

	public List<ProductQuantityBean> readQuantity(int roleId) throws ClassNotFoundException, SQLException {
		List<ProductQuantityBean> prodQuantityList = new ArrayList<ProductQuantityBean>();
		ConnectionDao conDao = new ConnectionDao();
		Connection con = conDao.Connect();

		String readProductQuantityQuery = "SELECT product_details.prod_name, product_details.prod_id, quantity.in_stock, quantity.buffer, product_details.prod_price, quantity.pending, product_details.prod_rating, quantity.id FROM product_details INNER JOIN quantity ON product_details.prod_id = quantity.prod_id WHERE product_details.role_id='"
				+ roleId + "'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(readProductQuantityQuery);

		while (rs.next()) {

			ProductQuantityBean prodQuan = new ProductQuantityBean();

			prodQuan.setProdName(rs.getString(1));
			prodQuan.setProdId(rs.getString(2));
			prodQuan.setInStock(Integer.parseInt(rs.getString(3)));
			prodQuan.setBuffer(Integer.parseInt(rs.getString(4)));
			prodQuan.setProdPrice(Integer.parseInt(rs.getString(5)));
			prodQuan.setPending(Integer.parseInt(rs.getString(6)));
			prodQuan.setRating(Integer.parseInt(rs.getString(7)));
			prodQuan.setId(Integer.parseInt(rs.getString(8)));

			prodQuantityList.add(prodQuan);

		}

		return prodQuantityList;
	}

	// Product Description

	public ProductBean read(int id) throws ClassNotFoundException, SQLException {
		ConnectionDao conDao = new ConnectionDao();
		Connection con = conDao.Connect();
		String readQuery = "SELECT prod_name, prod_brand, prod_rating, prod_desc, prod_price, prod_offer FROM product_details WHERE id="+ id;
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		ProductBean prod = new ProductBean();
		if (rs.next()) {
			prod.setProdName(rs.getString(1));
			prod.setProdBrand(rs.getString(2));
			prod.setProdRating(Integer.parseInt(rs.getString(3)));
			prod.setProdDesc(rs.getString(4));
			prod.setProdPrice(Integer.parseInt(rs.getString(5)));
			prod.setProdOffer(Integer.parseInt(rs.getString(6)));

		}
		return prod;
	}

	// Insert Product

	public int insertProduct(ProductBean prod) throws ClassNotFoundException, SQLException {
		ConnectionDao conDao = new ConnectionDao();
		Connection con = conDao.Connect();

		String insertQuery = "INSERT INTO product_details(prod_id, prod_name, prod_brand, prod_desc, prod_category, prod_price, prod_offer, prod_rating, role_id) VALUES (?,?,?,?,?,?,?,?,?)";

		PreparedStatement pstmt = con.prepareStatement(insertQuery);

		pstmt.setString(1, prod.getProdId());
		pstmt.setString(2, prod.getProdName());
		pstmt.setString(3, prod.getProdBrand());
		pstmt.setString(4, prod.getProdDesc());
		pstmt.setString(5, prod.getProdCategory());
		pstmt.setInt(6, prod.getProdPrice());
		pstmt.setInt(7, prod.getProdOffer());
		pstmt.setInt(8, prod.getProdRating());
		pstmt.setInt(9, prod.getRoleId());

		int insertStatus = 0;
		insertStatus = pstmt.executeUpdate();
		pstmt.close();

		if (insertStatus == 1) {
			String insertQuantityQuery = "INSERT INTO quantity (prod_id) SELECT prod_id FROM product_details WHERE role_id='"+ prod.getRoleId() + "'";

			Statement stmt = con.createStatement();
			insertStatus = 0;
			insertStatus = stmt.executeUpdate(insertQuantityQuery);
			stmt.close();
		}

		return insertStatus;

	}
	
	// Delete Product
	
	public int deleteProduct(int id) throws ClassNotFoundException,  SQLException {
		
    	ConnectionDao conDao = new ConnectionDao();
        Connection con = conDao.Connect();
        
        String deleteQuery = "DELETE FROM quantity WHERE prod_id IN (SELECT prod_id FROM product_details WHERE id="+id+")";
        
        Statement stmt = con.createStatement();
        
        int deleteStatus = 0;
        
        deleteStatus = stmt.executeUpdate(deleteQuery);
        
        if(deleteStatus == 1) {
        	String deleteProductQuery = "DELETE FROM product_details WHERE id="+id;
        	
        	
        	deleteStatus = stmt.executeUpdate(deleteProductQuery);
        	
        	stmt.close();
        	
        	
        }
        
        return deleteStatus;
    }
	
	public QuantityBean readQuality(int prodId) throws ClassNotFoundException, SQLException {
		ConnectionDao conDao = new ConnectionDao();
		Connection con = conDao.Connect();
		String readQuery = "SELECT in_stock, prod_id, rem, buffer, pending FROM quantity WHERE prod_id='"+prodId+"'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		QuantityBean quan = new QuantityBean();
		if (rs.next()) {
			quan.setInStock(Integer.parseInt(rs.getString(1)));
			quan.setProdId(rs.getString(2));
			quan.setRem(Integer.parseInt(rs.getString(3)));
			quan.setBuffer(Integer.parseInt(rs.getString(4)));
			quan.setPending(Integer.parseInt(rs.getString(5)));
			

		}
		return quan;
	}
	

}
package com.cognizant.dao;

import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.cognizant.bean.VendorBean;



public class AddVendorDao {
	
	public int insert(VendorBean vendor) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException {
		ConnectionDao conDao = new ConnectionDao();
        Connection con = conDao.Connect();
        String insertQuery = "INSERT INTO vendors (username, password, name, mobile, address) VALUES (?,?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(insertQuery);
        
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashInBytes = md.digest(vendor.getPassword().getBytes(StandardCharsets.UTF_8));

		// bytes to hex
        
        StringBuilder sb = new StringBuilder();
        for (byte b : hashInBytes) {
            sb.append(String.format("%02x", b));
        }
        
        //System.out.println(sb.toString());
        
        pstmt.setString(1, vendor.getUsername());
        pstmt.setString(2, sb.toString());
        pstmt.setString(3, vendor.getName());
        pstmt.setBigDecimal(4, BigDecimal.valueOf(vendor.getMobile()));
        pstmt.setString(5, vendor.getAddress());
        int insertStatus = 0;
        insertStatus = pstmt.executeUpdate();
        pstmt.close();
        
        if(insertStatus == 1) {
        	String insertUserQuery = "INSERT INTO users (username, password, role, role_id) SELECT username, password, role, id FROM vendors WHERE username='"+vendor.getUsername()+"'";
        	 Statement stmt = con.createStatement();
             insertStatus = 0;
             insertStatus = stmt.executeUpdate(insertUserQuery);
        }
        return insertStatus;
	}

}

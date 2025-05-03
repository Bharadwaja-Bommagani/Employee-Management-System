package com.emp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.emp.model.AdminRegModel;
import com.emp.utility.DBConnection;

public class AdminRegDAO implements AdminRegDAOInterface {
	String status = "FAIL";
    // Method to register new Admin
    public String registerAdmin(AdminRegModel admin) {
     
        try {
            DBConnection db = new DBConnection();
            Connection con = db.getConnection();
            
            String query = "INSERT INTO admin(admin_name, email, phone, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, admin.getAdminName());
            ps.setString(2, admin.getEmail());
            ps.setString(3, admin.getPhone());
            ps.setString(4, admin.getPassword());
            
            int rows = ps.executeUpdate();
            if (rows > 0) {
            	System.out.println(rows + " row(s) inserted successfully");
                status = "SUCCESS";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    // Method to validate Admin login
    public AdminRegModel loginAdmin(String email, String password) {
    	AdminRegModel admin = null;
        try {
            DBConnection db = new DBConnection();
            Connection con = db.getConnection();
            
            String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                admin = new AdminRegModel();
                admin.setAdminId(rs.getInt("admin_id"));
                admin.setAdminName(rs.getString("admin_name"));
                admin.setEmail(rs.getString("email"));
                admin.setPhone(rs.getString("phone"));
                // password is optional to set
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
}

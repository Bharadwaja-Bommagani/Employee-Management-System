package com.emp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.emp.model.EmpLoginModel;
import com.emp.model.EmployeeRegModel;
import com.emp.utility.DBConnection;


public class EmployeeRegDAO implements EmpRegDAOInterface {
	String status = "FAIL";
	//1)For Emp Registration
	public String registerEmployee(EmployeeRegModel emp) {

	        try {
	        	DBConnection dbc = new DBConnection();
				Connection con = dbc.getConnection();
	            
	            String sql = "INSERT INTO employeeReg(firstname, lastname, email, phone, password, department, designation) VALUES (?, ?, ?, ?, ?, ?, ?)";
	            PreparedStatement ps = con.prepareStatement(sql);
	            
	            ps.setString(1, emp.getFirstname());
	            ps.setString(2, emp.getLastname());
	            ps.setString(3, emp.getEmail());
	            ps.setString(4, emp.getPhone());
	            ps.setString(5, emp.getPassword());
	            ps.setString(6, emp.getDepartment());
	            ps.setString(7, emp.getDesignation());

	            int n = ps.executeUpdate();
				
				if(n>0) {
					System.out.println(n + " row(s) inserted successfully");
					status = "SUCCESS";
				}
				else {
					System.out.println("Sorry, Something went Wrong!!");
				}

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    return status;
	  }

//----------------------------------------------------------------------
	
	//2)For Emp Login
	public EmployeeRegModel selectEmployee(String email, String password) {
		 EmployeeRegModel emp = null;
	
		try {
		DBConnection dbc = new DBConnection();
		Connection con = dbc.getConnection();
		PreparedStatement ps = con.prepareStatement("select * from employeereg where email = ? and password = ?");
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			emp = new EmployeeRegModel();
            emp.setId(rs.getInt("id"));
            emp.setFirstname(rs.getString("firstname"));
            emp.setLastname(rs.getString("lastname"));
            emp.setEmail(rs.getString("email"));
            emp.setPhone(rs.getString("phone"));
            emp.setDepartment(rs.getString("department"));
            emp.setDesignation(rs.getString("designation"));
            
        }
	}
		catch(Exception e) {
			System.out.println(e);
		}
		return emp;
	}

//----------------------------------------------------------------------
	
	//3)For Emp Profile Update
	public boolean updateEmployee(EmployeeRegModel emp) {
		boolean status = false;

		try {
				DBConnection dbc = new DBConnection();
				Connection con = dbc.getConnection();

			String sql = "UPDATE employeereg SET firstname = ?, lastname = ?, phone = ?, department = ?, designation = ? WHERE id = ?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, emp.getFirstname());
			ps.setString(2, emp.getLastname());
			ps.setString(3, emp.getPhone());
			ps.setString(4, emp.getDepartment());
			ps.setString(5, emp.getDesignation());
			ps.setInt(6, emp.getId());

			int rowsUpdated = ps.executeUpdate();

			if (rowsUpdated > 0) {
				System.out.println("Profile updated for email: " + emp.getId());
				status = true;
			} else {
				System.out.println("No profile found to update for email: " + emp.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

//----------------------------------------------------------------------
	
	//4)For View all Employees
	public List<EmployeeRegModel> getAllEmployees() {
	    List<EmployeeRegModel> employees = new ArrayList<>();
	    try {
	        DBConnection dbc = new DBConnection();
			Connection con = dbc.getConnection();
	        
			String query = "SELECT * FROM employeereg";
	        PreparedStatement ps = con.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            EmployeeRegModel emp = new EmployeeRegModel();
	            
	            emp.setId(rs.getInt("id"));
	            emp.setFirstname(rs.getString("firstname"));
	            emp.setLastname(rs.getString("lastname"));
	            emp.setEmail(rs.getString("email"));
	            emp.setPhone(rs.getString("phone"));
	            emp.setDepartment(rs.getString("department"));
	            emp.setDesignation(rs.getString("designation"));
	            
	            employees.add(emp);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return employees;
	}

//----------------------------------------------------------------------
	
	//5)Method to delete employee by ID
	public boolean deleteEmployeeById(int id) {
	    boolean isDeleted = false;

	    try {
	        DBConnection db = new DBConnection();
	        Connection con = db.getConnection();

	        String sql = "DELETE FROM employeereg WHERE id = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, id);

	        int rows = ps.executeUpdate();
	        if (rows > 0) {
	            isDeleted = true;
	        }

	        ps.close();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isDeleted;
	}

//---------------------------------------------------------------------
   //6) For changing password:
	
   public boolean updatePassword(String email, String oldPassword, String newPassword) {
      boolean isUpdated = false;
        try {
	        DBConnection db = new DBConnection();
	        Connection con = db.getConnection();

            String checkSql = "SELECT * FROM employeereg WHERE email=? AND password=?";
            PreparedStatement psCheck = con.prepareStatement(checkSql);
            psCheck.setString(1, email);
            psCheck.setString(2, oldPassword);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                // Update password
                String updateSql = "UPDATE employeereg SET password=? WHERE email=?";
                PreparedStatement psUpdate = con.prepareStatement(updateSql);
                psUpdate.setString(1, newPassword);
                psUpdate.setString(2, email);
                
                int rows = psUpdate.executeUpdate();
                if (rows > 0) {
                    isUpdated = true;
                    System.out.println("Password Upadated Successfully!!");
                }
                else {
                	System.out.println("Password not Updated!!");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

}


	
	
	

	
	



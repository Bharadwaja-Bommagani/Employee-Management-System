package com.emp.dao;

import com.emp.model.AdminRegModel;

public interface AdminRegDAOInterface {
	public String registerAdmin(AdminRegModel admin);
	public AdminRegModel loginAdmin(String email, String password);
}

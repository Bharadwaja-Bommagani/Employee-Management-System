package com.emp.dao;


import java.util.List;

import com.emp.model.EmployeeRegModel;

public interface EmpRegDAOInterface {
	
	public String registerEmployee(EmployeeRegModel emp);
	
	public EmployeeRegModel selectEmployee(String email, String password);
	
	public boolean updateEmployee(EmployeeRegModel emp);
	
	public List<EmployeeRegModel> getAllEmployees();
	
	public boolean deleteEmployeeById(int id);
	
	public boolean updatePassword(String email, String oldPassword, String newPassword);

}

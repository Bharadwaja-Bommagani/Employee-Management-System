package com.emp.controller;

import java.io.IOException;

import com.emp.dao.EmployeeRegDAO;
import com.emp.model.EmployeeRegModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EmployeeRegisterServlet")
public class EmployeeRegisterServlet extends HttpServlet {
    //private static final long serialVersionUID = 1L;

    public EmployeeRegisterServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("hello");
        // 1. Get form parameters
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String department = request.getParameter("department");
        String designation = request.getParameter("designation");
       

        //2.Employee Model(DTO)
        EmployeeRegModel emp = new EmployeeRegModel();
        emp.setFirstname(firstname);
        emp.setLastname(lastname);
        emp.setEmail(email);
        emp.setPhone(phone);
        emp.setPassword(password);
        emp.setDepartment(department);
        emp.setDesignation(designation);
        System.out.println("hello DTO");
        
        //DAO(JDBC)
        EmployeeRegDAO er = new EmployeeRegDAO();
		String status = er.registerEmployee(emp);
		System.out.println(status);
		
		System.out.println("hello DAO");
        
		//For Navigating from page to page
		if(status.equals("SUCCESS")) {
			request.setAttribute("message", "Successfully registered! Please login.");
		    RequestDispatcher rd = request.getRequestDispatcher("employeeLogin.jsp");			
		    rd.forward(request, response);
		}
		else {
			request.setAttribute("error", "Registration failed. Try again.");
		    RequestDispatcher rd = request.getRequestDispatcher("employeeRegister.jsp");			
		    rd.forward(request, response);
		}
    }
}

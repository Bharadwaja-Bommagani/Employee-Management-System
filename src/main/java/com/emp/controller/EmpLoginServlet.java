package com.emp.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.emp.dao.EmployeeRegDAO;
import com.emp.model.EmpLoginModel;
import com.emp.model.EmployeeRegModel;


@WebServlet("/EmpLoginServlet")
public class EmpLoginServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;
       
    
    public EmpLoginServlet() {
     }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println("Gettt");
		
		EmpLoginModel l = new EmpLoginModel();
		l.setEmail(email);
		l.setPassword(password);
		System.out.println("Sett");
		
		EmployeeRegDAO er = new EmployeeRegDAO();
		EmployeeRegModel emp = er.selectEmployee(email,password);
		System.out.println("Gooo");
		
		if (emp != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("emp", emp); // storing whole object

	        RequestDispatcher rd = request.getRequestDispatcher("employeeDashboard.jsp");
	        rd.forward(request, response);
	    } else {
	        request.setAttribute("error", "Invalid email or password. Please try again.");
	        RequestDispatcher rd = request.getRequestDispatcher("employeeLogin.jsp");
	        rd.forward(request, response);
	    }
	
	}

}

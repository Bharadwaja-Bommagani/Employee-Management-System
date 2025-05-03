package com.emp.controller;

import java.io.IOException;

import com.emp.dao.AdminRegDAO;
import com.emp.model.AdminLoginModel;
import com.emp.model.AdminRegModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;
       
    
    public AdminLoginServlet() {
     }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println("Gettt");
		
		AdminLoginModel al = new AdminLoginModel();
		al.setEmail(email);
		al.setPassword(password);
		System.out.println("Sett");
		
		AdminRegDAO ar = new AdminRegDAO();
		AdminRegModel admin = ar.loginAdmin(email,password);
		System.out.println("Gooo");
		
		if (admin != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("admin", admin); //storing whole object

	        RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
	        rd.forward(request, response);
	    } else {
	        request.setAttribute("error", "Invalid email or password. Please try again.");
	        RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
	        rd.forward(request, response);
	    }
	
	}

}

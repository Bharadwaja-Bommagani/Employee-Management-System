package com.emp.controller;

import java.io.IOException;

import com.emp.dao.AdminRegDAO;
import com.emp.model.AdminRegModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminRegisterServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read form data
        String adminName = request.getParameter("adminName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        System.out.println("Getttt");

        // Create Admin object
        AdminRegModel admin = new AdminRegModel();
        admin.setAdminName(adminName);
        admin.setEmail(email);
        admin.setPhone(phone);
        admin.setPassword(password);
        System.out.println("Settttt");
        
        // Save admin to database
        AdminRegDAO adminDAO = new AdminRegDAO();
        String status = adminDAO.registerAdmin(admin);
        System.out.println(status + " Gooo!" );

        if (status.equals("SUCCESS")) {
            request.setAttribute("message", "Registration successful! Please login.");
            RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("error", "Registration failed! Email might already exist.");
            RequestDispatcher rd = request.getRequestDispatcher("adminRegister.jsp");
            rd.forward(request, response);
        }
    }
}

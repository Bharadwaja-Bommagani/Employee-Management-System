package com.emp.controller;

import com.emp.dao.EmployeeRegDAO;
import com.emp.model.EmployeeRegModel;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/ChangePasswordServlet")
public class ChangePswdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	HttpSession session = request.getSession(false);
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        System.out.println("Passwords Gettt");
        
        if (session == null || session.getAttribute("emp") == null) {
            response.sendRedirect("employeeLogin.jsp");
            System.out.println("null");
            return;
        }

        EmployeeRegModel emp = (EmployeeRegModel) session.getAttribute("emp");
        String email = emp.getEmail();
        System.out.println("email gett");
        
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("msg", "New passwords do not match!");
            RequestDispatcher rd = request.getRequestDispatcher("changePassword.jsp");
            rd.forward(request, response);
            return;
        }
        
        EmployeeRegDAO edao = new EmployeeRegDAO();
        boolean success = edao.updatePassword(email, oldPassword, newPassword);
        System.out.println("Seettt " + success);
        
        if (success) {
            session.setAttribute("successMsg", "Password updated successfully.");
            RequestDispatcher rd = request.getRequestDispatcher("employeeDashboard.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("msg", "Old password is incorrect.");
            RequestDispatcher rd = request.getRequestDispatcher("changePassword.jsp");
            rd.forward(request, response);
        }

        
    }
}

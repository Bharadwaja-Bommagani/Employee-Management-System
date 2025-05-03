package com.emp.controller;

import com.emp.dao.EmployeeRegDAO;
import com.emp.model.EmployeeRegModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/EmpUpdateServlet")
public class EmpUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get the session and existing employee object
		HttpSession session = request.getSession();
		EmployeeRegModel emp = (EmployeeRegModel) session.getAttribute("emp");

		if (emp == null) {
			// Session expired or not logged in
			request.setAttribute("error", "Session expired. Please login again.");
			RequestDispatcher rd = request.getRequestDispatcher("employeeLogin.jsp");
			rd.forward(request, response);
			return;
		}

		// Update only the fields that can be changed
		emp.setFirstname(request.getParameter("firstName"));
		emp.setLastname(request.getParameter("lastName"));
		emp.setPhone(request.getParameter("phone"));
		emp.setDepartment(request.getParameter("department"));
		emp.setDesignation(request.getParameter("designation"));
		// email and empid are already in the object, no need to reset

		// Call DAO method to update
		EmployeeRegDAO erd = new EmployeeRegDAO();
		boolean isUpdated = erd.updateEmployee(emp);

		System.out.println("EMP ID after update: " + emp.getId());

		if (isUpdated) {
			session.setAttribute("emp", emp); // Refresh updated emp in session
			request.setAttribute("message", "Profile Updated Successfully.");
			RequestDispatcher rd = request.getRequestDispatcher("employeeDashboard.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("error", "Update failed. Try again.");
			RequestDispatcher rd = request.getRequestDispatcher("employeeUpdate.jsp");
			rd.forward(request, response);
		}
	}
}

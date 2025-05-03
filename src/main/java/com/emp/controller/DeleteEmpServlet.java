package com.emp.controller;

import java.io.IOException;
import java.util.List;

import com.emp.dao.EmployeeRegDAO;
import com.emp.model.EmployeeRegModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = "";
        try {
            int empId = Integer.parseInt(request.getParameter("empId"));

            EmployeeRegDAO dao = new EmployeeRegDAO();
            boolean result = dao.deleteEmployeeById(empId);

            if (result) {
                message = "Employee with ID " + empId + " deleted successfully.";
            } else {
                message = "No employee found with ID " + empId + ".";
            }

            //Set attribute using correct key used in JSP
            List<EmployeeRegModel> empList = dao.getAllEmployees();
            request.setAttribute("empList", empList);
            request.setAttribute("message", message);

            RequestDispatcher rd = request.getRequestDispatcher("viewEmployees.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred while deleting employee.");
            RequestDispatcher rd = request.getRequestDispatcher("viewEmployees.jsp");
            rd.forward(request, response);
        }
    }
}

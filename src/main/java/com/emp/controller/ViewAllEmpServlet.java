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

@WebServlet("/ViewEmployeesServlet")
public class ViewAllEmpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EmployeeRegDAO dao = new EmployeeRegDAO();
        List<EmployeeRegModel> empList = dao.getAllEmployees();

        //Set attribute using same key used in JSP
        request.setAttribute("empList", empList);
        RequestDispatcher rd = request.getRequestDispatcher("viewEmployees.jsp");
        rd.forward(request, response);
    }
}

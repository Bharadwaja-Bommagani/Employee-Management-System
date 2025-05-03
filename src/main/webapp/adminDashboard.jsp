<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.emp.model.AdminRegModel" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #e3f2fd, #ffffff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard-container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        .dashboard-header {
            border-bottom: 2px solid #dee2e6;
            margin-bottom: 30px;
            padding-bottom: 10px;
        }

        .section-title {
            color: #0d6efd;
            font-weight: 700;
        }

        .info-label {
            color: #495057;
            font-size: 1.1rem;
        }

        .info-value {
            color: #212529;
            font-weight: 500;
        }

        .btn-custom {
            padding: 10px;
            border-radius: 10px;
            font-weight: 500;
            font-size: 1rem;
        }

        .logout-btn {
            float: right;
        }

        .bordered-section {
            border: 2px solid black;
            border-radius: 12px;
            padding: 20px;
            background-color: #f9f9f9;
            margin-bottom: 30px;
        }

        @media (max-width: 768px) {
            .logout-btn {
                float: none;
                display: block;
                width: 100%;
                margin-top: 15px;
            }
        }
    </style>
</head>
<body>

<%
    HttpSession sessionObj = request.getSession(false);
    AdminRegModel admin = (sessionObj != null) ? (AdminRegModel) sessionObj.getAttribute("admin") : null;

    if (admin == null) {
%>
    <div class="container mt-5 text-center">
        <h4 class="text-danger">Session expired or unauthorized access.</h4>
        <a href="adminLogin.jsp" class="btn btn-primary mt-3">Go to Login</a>
    </div>
<%
    } else {
%>

<div class="container dashboard-container">
    <div class="dashboard-header d-flex justify-content-between align-items-center">
        <h2 class="section-title">Admin DashBoard</h2>
        <a href="logout.jsp" class="btn btn-danger btn-custom logout-btn">Logout</a>
    </div>

    <div class="bordered-section">
        <h5 class="mb-3 text-primary">Admin Info:</h5>
        <p class="info-label">Welcome, <span class="info-value"><%= admin.getAdminName() %></span></p>
        <p class="info-label">Email: <span class="info-value"><%= admin.getEmail() %></span></p>
        <p class="info-label">Phone: <span class="info-value"><%= admin.getPhone() %></span></p>
    </div>

    <div class="bordered-section text-center">
        <h5 class="text-primary mb-4">Employee Management</h5>
        <a href="ViewEmployeesServlet" class="btn btn-outline-primary w-100 mb-3 btn-custom">View All Employees</a>
        <a href="employeeRegister.jsp" class="btn btn-outline-success w-100 btn-custom">Add New Employee</a>
    </div>
</div>

<% } %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

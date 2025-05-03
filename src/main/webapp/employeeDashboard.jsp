<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.model.EmployeeRegModel" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #eef2f7;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .dashboard-container {
            max-width: 1100px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .section-title {
            color: #0d6efd;
            font-weight: bold;
        }
        .card {
            border-radius: 15px;
            border: none;
            box-shadow: 0 0 8px rgba(0,0,0,0.05);
        }
        .bordered-section {
            border: 2px solid #000000;
            border-radius: 12px;
            background-color: #fafafa;
        }
        .list-group-item {
            background-color: #f8f9fa;
        }
        .btn-outline-primary, .btn-outline-warning {
            border-radius: 30px;
        }
        .alert {
            border-radius: 10px;
        }
        .resources ul {
            padding-left: 20px;
        }
        .resources li::marker {
            content: "✅ ";
        }
    </style>
</head>
<body>

<%
    EmployeeRegModel emp = (EmployeeRegModel) session.getAttribute("emp");
    if (emp == null) {
%>
    <div class="container mt-5 text-center">
        <h4 class="text-danger">Session expired. Please login again.</h4>
        <a href="employeeLogin.jsp" class="btn btn-primary mt-3">Go to Login</a>
    </div>
<%
    } else {
        String successMsg = (String) session.getAttribute("successMsg");
        if (successMsg != null) {
            request.setAttribute("message", successMsg);
            session.removeAttribute("successMsg");
        }

        String msg = (String) request.getAttribute("message");
        String err = (String) request.getAttribute("error");
%>

<div class="container dashboard-container">
    <h2 class="section-title mb-3">Welcome, <%= emp.getFirstname() %> <%= emp.getLastname() %>!</h2>
    <p class="text-muted mb-4">Logged in as: <strong><%= emp.getEmail() %></strong></p>

    <!-- Alert Messages -->
    <div class="mb-3">
        <% if (msg != null) { %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= msg %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } else if (err != null) { %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%= err %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>
    </div>

    <div class="row mb-4">
        <!-- Profile Summary -->
        <div class="col-md-6">
            <div class="card p-4 bordered-section">
                <h5 class="text-primary fw-bold">Profile Information</h5>
                <ul class="list-group list-group-flush mt-3">
                    <li class="list-group-item"><strong>Employee ID:</strong> <%= emp.getId() %></li>
                    <li class="list-group-item"><strong>First Name:</strong> <%= emp.getFirstname() %></li>
                    <li class="list-group-item"><strong>Last Name:</strong> <%= emp.getLastname() %></li>
                    <li class="list-group-item"><strong>Email:</strong> <%= emp.getEmail() %></li>
                    <li class="list-group-item"><strong>Phone:</strong> <%= emp.getPhone() %></li>
                    <li class="list-group-item"><strong>Department:</strong> <%= emp.getDepartment() %></li>
                    <li class="list-group-item"><strong>Designation:</strong> <%= emp.getDesignation() %></li>
                </ul>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="col-md-6">
            <div class="card p-4 bordered-section">
                <h5 class="text-primary fw-bold">Quick Actions</h5>
                <div class="d-grid gap-3 mt-3">
                    <a href="employeeUpdate.jsp" class="btn btn-outline-primary">Update Profile</a>
                    <a href="changePassword.jsp" class="btn btn-outline-warning">Change Password</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Resources Section -->
    <div class="card p-4 bordered-section resources">
        <h5 class="text-primary fw-bold mb-3">Employee Engagement & Resources</h5>
        <ul>
            <li>Explore professional development programs through our learning portal.</li>
            <li>Join employee interest groups to network and collaborate across departments.</li>
            <li>Utilize wellness resources including mental health support and fitness challenges.</li>
            <li>Access internal knowledge base for policies, tools, and guides.</li>
            <li>Stay updated via the company intranet and participate in forums.</li>
        </ul>
    </div>

    <!-- Logout -->
    <div class="text-end mt-4">
        <a href="logout.jsp" class="btn btn-danger">Logout</a>
    </div>
</div>

<% } %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

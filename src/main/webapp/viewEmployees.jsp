<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.emp.model.EmployeeRegModel" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Employees</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Employee List</h2>

    <!-- Display success or error message -->
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <%= message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <%
        }
    %>

    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>Emp-ID</th>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Email Id</th>
            <th>Phone</th>
            <th>Department</th>
            <th>Designation</th>
            <th>Action</th> <!-- Column for Delete Button -->
        </tr>
        </thead>
        <tbody>
        <%
            List<EmployeeRegModel> empList = (List<EmployeeRegModel>) request.getAttribute("empList"); //updated key
            if (empList != null && !empList.isEmpty()) {
                for (EmployeeRegModel emp : empList) {
        %>
        <tr>
            <td><%= emp.getId() %></td>
            <td><%= emp.getFirstname() %></td>
            <td><%= emp.getLastname() %></td>
            <td><%= emp.getEmail() %></td>
            <td><%= emp.getPhone() %></td>
            <td><%= emp.getDepartment() %></td>
            <td><%= emp.getDesignation() %></td>
            <td>
                <form action="DeleteEmployeeServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this employee?');">
                    <input type="hidden" name="empId" value="<%= emp.getId() %>">
                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="8" class="text-center">No employee data available</td></tr>
        <% } %>
        </tbody>
    </table>
    <a href="adminDashboard.jsp" class="btn btn-primary">← Back to Dashboard</a>
</div>

<!-- Bootstrap JS for dismissible alert -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

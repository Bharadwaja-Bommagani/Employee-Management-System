<%@ page import="com.emp.model.EmployeeRegModel" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h3 {
            color: #0d6efd;
        }
    </style>
</head>
<body>

<%
    EmployeeRegModel emp = (EmployeeRegModel) session.getAttribute("emp");

    if (emp == null) {
%>
    <div class="container text-center mt-5">
        <h4 class="text-danger">Session expired. Please login again.</h4>
        <a href="employeeLogin.jsp" class="btn btn-primary mt-3">Go to Login</a>
    </div>
<%
    } else {
%>

<div class="form-container">
    <h3 class="mb-4 text-center">Update Profile</h3>
    <form action="EmpUpdateServlet" method="post">
        <div class="mb-3">
            <label for="firstName" class="form-label">First Name</label>
            <input type="text" class="form-control" name="firstName" value="<%= emp.getFirstname() %>" required>
        </div>
        <div class="mb-3">
            <label for="lastName" class="form-label">Last Name</label>
            <input type="text" class="form-control" name="lastName" value="<%= emp.getLastname() %>" required>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone</label>
            <input type="text" class="form-control" name="phone" value="<%= emp.getPhone() %>" required>
        </div>
        <div class="mb-3">
            <label for="department" class="form-label">Department</label>
            <input type="text" class="form-control" name="department" value="<%= emp.getDepartment() %>" required>
        </div>
        <div class="mb-3">
            <label for="designation" class="form-label">Designation</label>
            <input type="text" class="form-control" name="designation" value="<%= emp.getDesignation() %>" required>
        </div>

        <input type="hidden" name="email" value="<%= emp.getEmail() %>">

        <div class="text-center">
            <button type="submit" class="btn btn-success">Update Profile</button>
            <a href="employeeDashboard.jsp" class="btn btn-secondary ms-2">Cancel</a>
        </div>
    </form>
</div>

<% } %>

</body>
</html>

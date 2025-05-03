<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-box {
            border: 2px solid black;
            padding: 25px;
            border-radius: 10px;
            background-color: white;
        }
    </style>
</head>
<body style="background-color: #f8f9fa;">
    <div class="container mt-5" style="max-width: 500px;">
        <h3 class="text-center text-primary mb-4">Change Password</h3>

        <%-- Show error/info message if set --%>
        <% String msg = (String) request.getAttribute("msg"); %>
        <% if (msg != null) { %>
            <div class="alert alert-danger text-center">
                <%= msg %>
            </div>
        <% } %>

        <div class="form-box">
            <form action="ChangePasswordServlet" method="post">
                <div class="mb-3">
                    <label for="oldPassword" class="form-label">Old Password</label>
                    <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
                </div>
                <div class="mb-3">
                    <label for="newPassword" class="form-label">New Password</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm New Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                </div>
                <div class="text-center mt-3">
				    <button type="submit" class="btn btn-sm btn-outline-primary me-2 px-4">Update Password</button>
				    <a href="employeeDashboard.jsp" class="btn btn-sm btn-outline-dark px-4">Cancel</a>
				</div>

            </form>
        </div>
    </div>
</body>
</html>

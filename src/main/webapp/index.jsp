<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #9face6);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .welcome-box {
            background: white;
            padding: 50px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            max-width: 600px;
            width: 100%;
            animation: fadeIn 1s ease-in-out;
        }
        .welcome-box h2 {
            color: #0d6efd;
            margin-bottom: 20px;
            font-weight: 600;
        }
        .welcome-box p {
            color: #444;
            font-size: 1.1rem;
            margin-bottom: 30px;
        }
        .btn-custom {
            width: 100%;
            margin: 10px 0;
            padding: 12px;
            font-size: 1rem;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease-in-out;
        }
        .btn-employee {
            background-color: #198754;
            color: #fff;
        }
        .btn-employee:hover {
            background-color: #157347;
        }
        .btn-register {
            background-color: #0d6efd;
            color: #fff;
        }
        .btn-register:hover {
            background-color: #0b5ed7;
        }
        .btn-admin {
            background-color: #fd7e14;
            color: #fff;
        }
        .btn-admin:hover {
            background-color: #e96b0f;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="welcome-box">
    <h2>Welcome to Employee Management System</h2>
    <p>Please choose your portal below to proceed:</p>
    <a href="employeeLogin.jsp" class="btn btn-custom btn-employee">Employee Login</a>
    <a href="employeeRegister.jsp" class="btn btn-custom btn-register">Employee Registration</a>
    <a href="adminRegister.jsp" class="btn btn-custom btn-admin">Admin Register</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fce4ec;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background-color: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.15);
            width: 350px;
        }
        h2 {
            margin-bottom: 25px;
            color: #d81b60;
            text-align: center;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #d81b60;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #ad1457;
        }
        .back-link {
            margin-top: 15px;
            display: block;
            text-align: center;
            color: #555;
            text-decoration: none;
        }
        .error-msg {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="login-box">
<h2 class="text-center mb-4 text-primary">Admin Login</h2>
    <% String err = (String) request.getAttribute("error");
       String msg = (String) request.getAttribute("message");   %>
    <% if (err != null) { %>
    <p style="color: red;"><%= err %></p>
    <% } 
    else if (msg != null) { %>
    <p style="color: green;"><%= msg %></p>
    <% } %>

    <form action="AdminLoginServlet" method="post">
        <input type="email" name="email" placeholder="Admin Email" required>
        <input type="password" name="password" placeholder="Password" required>
        <input type="submit" value="Login">
    </form>

    <a href="index.jsp" class="back-link">← Back to Home</a>
</div>

</body>
</html>

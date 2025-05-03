<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Login</title>

    <!-- ✅ Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background: #e3f2fd;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }
        .login-box {
            background-color: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 400px;
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
    <h2 class="text-center text-primary mb-4">Employee Login</h2>

    <% String err = (String) request.getAttribute("error");
       String msg = (String) request.getAttribute("message");   %>
	 	<% if (err != null) { %>
    	<p style="color: red;"><%= err %></p>
		<% } 
		else if (msg != null) { %>
    	<p style="color: green;"><%= msg %></p>
		<% } %>

    <form action="EmpLoginServlet" method="post">
        <div class="mb-3">
            <input type="email" class="form-control" name="email" placeholder="Email" required>
        </div>
        <div class="mb-3">
            <input type="password" class="form-control" name="password" placeholder="Password" required>
        </div>
        <div class="d-grid">
            <input type="submit" class="btn btn-primary" value="Login">
        </div>
    </form>

    <a href="index.jsp" class="back-link">← Back to Home</a>
</div>

</body>
</html>

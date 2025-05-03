<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .register-container {
            max-width: 500px;
            margin: 60px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }
    </style>
</head>
<body>

<div class="container register-container">
    <h2 class="text-center mb-4 text-primary">Admin Registration</h2>
    
    <% String err = (String) request.getAttribute("error"); %>
	 	<% if (err != null) { %>
    	<p style="color: red;"><%= err %></p>
		<% } %>
    
    <form action="AdminRegisterServlet" method="post" id="myForm">
        <div class="mb-3">
            <label for="adminName" class="form-label">Admin Name</label>
            <input type="text" class="form-control" id="adminName" name="adminName" required>
        </div>
        
        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>
        
        <div class="mb-3">
            <label for="phone" class="form-label">Phone Number</label>
            <input type="text" class="form-control" id="phone" name="phone" required pattern="[0-9]{10}" title="Enter a valid 10-digit phone number">
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required minlength="6">
        </div>
        
        <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirm password" name="confirmPassword" required minlength="6">
        </div>
		<p id="psdInfo"></p>
        <button type="submit" class="btn btn-primary w-100">Register</button>

        <div class="text-center mt-3">
            Already registered? <a href="adminLogin.jsp">Login here</a>
        </div>
    </form>
</div>

<script type="text/javascript">

//For valiadations
	document.getElementById("adminName").addEventListener("keypress", onlyChars);
	function onlyChars(eventt){
        var ch = eventt.which;
        if(!( (ch >= 65 && ch <= 90) || (ch >= 97 && ch <=122) || (ch == 32) || (ch == 8) || (ch == 0) )){
            eventt.preventDefault();//cancel the currently pressed characters
        }
	}
	
	document.getElementById("phone").addEventListener("keypress", onlyNumbers);
	function onlyNumbers(eventt){
        var num = eventt.which;
        if(!((num >= 48 && num <= 57) || (num == 32) || (num == 8) || (num == 0))){
            eventt.preventDefault();
        }
    }

//For matching passwords
	document.getElementById("password").addEventListener("blur", verifyPswd);
    document.getElementById("confirm password").addEventListener("blur", verifyPswd);
	
    function verifyPswd(){
        let pwd = document.getElementById("password").value;
        let cpwd = document.getElementById("confirm password").value;
    
        if(pwd == "" || cpwd == ""){
            document.getElementById("psdInfo").innerHTML="Both Password and Confirm Password fields are required.";
            document.getElementById("psdInfo").style.color = "red";
            return false;
        }
        else if(pwd == cpwd){
            document.getElementById("psdInfo").innerHTML="Success! Both password fields are identical.";
            document.getElementById("psdInfo").style.color = "green";
            return true;
        }
        else{
            document.getElementById("psdInfo").innerHTML="Password and Confirm Password do not match.";
            document.getElementById("psdInfo").style.color = "red";
            return false;
        }
    }

//Stops submission if passwords are not matching
    document.getElementById("myForm").addEventListener("submit", function(event) {
        if (!verifyPswd()) {
            event.preventDefault(); // Stop form submission
            alert("Please fix the password mismatch before submitting.");
        }
    });
    
//To upperCase:
	document.getElementById("adminName").addEventListener("blur", toUpper);

         function toUpper(){
			let adminName = document.getElementById("adminName").value;
			document.getElementById("adminName").value = adminName.toUpperCase();
         }


</script>

</body>
</html>

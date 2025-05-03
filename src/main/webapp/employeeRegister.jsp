<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #e3f2fd;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-box {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.15);
            width: 400px;
        }
        h2 {
            margin-bottom: 25px;
            color: #1976d2;
            text-align: center;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #1976d2;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #125ea9;
        }
        .back-link {
            margin-top: 15px;
            display: block;
            text-align: center;
            color: #555;
            text-decoration: none;
        }
        .success-msg {
            color: green;
            text-align: center;
            margin-bottom: 10px;
        }
        .error-msg {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="register-box">
    <h2>Employee Registration</h2>

      <% String err = (String) request.getAttribute("error"); %>
	 	<% if (err != null) { %>
    	<p style="color: red;"><%= err %></p>
		<% } %>



    <form action="EmployeeRegisterServlet" method="post" id="myForm">
        <input type="text" name="firstname" id="firstname" placeholder="FirstName" required>
        <input type="text" name="lastname" id="lastname" placeholder="LastName" required>
        <input type="email" name="email" id="email" placeholder="Email" required>
        <input type="tel" name="phone" id="phone" placeholder="Phone Number" required>
        <input type="password" name="password" id="password" placeholder="Password" required>
		<input type="password" name="confirm password" id="confirm password" placeholder="Confirm Password" required>
        <p id="psdInfo"></p>
        <input type="text" name="department" id="department" placeholder="Department" required>
		<input type="text" name="designation" id="designation" placeholder="Designation" required>
        <input type="submit" value="Register">
    </form>

    <a href="index.jsp" class="back-link">← Back to Home</a>
</div>

	<script type="text/javascript">

//For Validations 	
	document.getElementById("firstname").addEventListener("keypress", onlyChars);
	document.getElementById("lastname").addEventListener("keypress", onlyChars);
	document.getElementById("department").addEventListener("keypress", onlyChars);
	document.getElementById("designation").addEventListener("keypress", onlyChars);
	
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
	
//For matching passwords:
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

//Converting to UpperCase:
	document.getElementById("firstname").addEventListener("blur", toUpper);
	document.getElementById("lastname").addEventListener("blur", toUpper);

         function toUpper(){
			let firstname = document.getElementById("firstname").value;
			document.getElementById("firstname").value = firstname.toUpperCase();
			
			let lastname = document.getElementById("lastname").value;
			document.getElementById("lastname").value = lastname.toUpperCase();
			
         }
    
    

    </script>

</body>
</html>

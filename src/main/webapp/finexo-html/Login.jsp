<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            margin-top: 8px;
        }
        center{
        color: Black;
        font-family: Arial, sans-serif;
        
        }
    </style>
</head>
<body>

<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<form id="signInForm" action="Login" method="post">



     <center><b>SIGNIN FORM</b></center><br>
     
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button onclick="validateForm()" id="signInForm">Sign In</button>

        <p class="error-message" id="errorMessage"></p>
        <h4> Doesn't have an account? &nbsp; &nbsp;<a href="Registration.jsp">SignUp</a></h4>
    </form>

    <script>
    		
        function validateForm() {
        	
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;
            
            var errorMessage = document.getElementById('errorMessage');


            // Simple validation
            if (username === '' || password === '') {
                errorMessage.textContent = 'Username and password are required.';
                return;
            }

            // If validation passes, you can submit the form or perform other actions
            // For now, let's just clear the error message and show an alert
            errorMessage.textContent = '';
            
            // alert('Login successful!');
        }
    </script>
    
     
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	
	<script type="text/javascript">
	var status=document.getElementById("status").value;
	if(status=="failed"){
		swal("Sorry","Wrong Username and Password","error");
	}
	
	</script>
</body>
</html>
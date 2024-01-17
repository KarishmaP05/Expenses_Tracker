<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>

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

<form id="signupForm" action="Register" method="post">

    <center>SIGNUP FORM</center><br>
        
        
        <label for="username">UserName:</label>
        <input type="text" id="username" name="username" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword"  name="confirmPassword" required>

       
      
        <button onClick="validateForm()" id="signupbtn">SignUp</button>
        
        <h4> Already have an account? &nbsp; &nbsp;<a href="Login.jsp">LogIn</a></h4>
        
        
         
        <p class="error-message" id="errorMessage"></p> 
    </form>

    <script>
    
          window.onload = function() {
    	  validateForm();
    	};
        function validateForm() {
           
            
            var errorMessage = document.getElementById('errorMessage');

            window.setInterval(function(){
            	var password = document.getElementById('password').value;
                var confirmPassword = document.getElementById('confirmPassword').value;
                
            	  // call your function here
            	   if (password !== confirmPassword) {
                		errorMessage.textContent = 'Passwords do not match.';
                		document.getElementById("signupbtn").disabled = true;
                		
            		}else{
            			
            			if(password===""){
            			errorMessage.textContent = ' ';	
            			}else{
            			errorMessage.textContent = 'Password match.';
            			document.getElementById("signupbtn").disabled = false;
            			}
            		}
            	}, 1000);
           
            errorMessage.textContent = '';
        
        }
        
    </script>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	
	<script type="text/javascript">
	var status=document.getElementById("status").value;
	if(status=="success"){
		swal("congrats","Account created successfully","success");
	}
	</script>

</body>
</html>
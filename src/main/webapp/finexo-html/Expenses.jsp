<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title> Expenses_Tracker</title>
    <link rel="stylesheet" href="css/expense.css">
    <style>
        /* Style for the close button */
        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
        }
    </style>
    <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
 <%-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  --%> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="">



  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
  
   <link rel="stylesheet" href="css/dashboard.css">  <%--CSS --%>
    
</head>


<!-- <body> -->
    <!-- <h1>Income Tracker</h1> -->
    <body class="sub_page">

  <div class="hero_area">

    <div class="hero_bg_box">
      <div class="bg_img_box">
        <img src="images/hero-bg.png" alt="">
      </div>
    </div>

    <!-- header section strats -->
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="Index.jsp">
            <span>
              Expenses_Tracker Application
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  ">
              <li class="nav-item ">
                <a class="nav-link" href="Index.jsp">Home </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Income.jsp"> Income </a>
              </li>
              
              <li class="nav-item active">
                <a class="nav-link" href="Expenses.jsp"> Expenses </a>
              </li>
             
              <li class="nav-item bg-danger">
                <a class="nav-link" href="Logout"><i class="fa fa-user" aria-hidden="true"></i><%=session.getAttribute("name")%></a>
              </li>
              
                <li class="nav-item">
                <a class="nav-link" href="Profile.jsp">Profile</a>
              </li>
              
          
              
            </ul>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>


    

    <!-- Add Income Button -->
	 <button id="addIncomeButton" onclick="showIncomeForm()">Add Income</button>

    <!-- Income Entry Form (Initially Hidden) -->
    <div id="incomeForm" style="display: none; position: absolute;">
        <!-- Close Button -->
        <span class="close-button" onclick="closeIncomeForm()">&#10006;</span>

        <h2>Add Income Details</h2>
        <form id="incomeDetailsForm">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>

            <label for="category">Category:</label>
            <input type="text" id="category" name="category" required><br>

            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required><br>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required><br>

            <label for="note">Note:</label>
            <textarea id="note" name="note" rows="4"></textarea><br>

            <input type="button" value="Add" onclick="addIncomeEntry()">
        </form>
    </div>

    <!-- Display Income Entries in a Table -->
    <h2>Income Entries</h2>
    <table id="incomeTable" border="1">
        <tr>
            <th>Name</th>
            <th>Category</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Note</th>
        </tr>
    </table>

    <script>
        function showIncomeForm() {
            var incomeForm = document.getElementById("incomeForm");
            incomeForm.style.display = "block";
        }

        function closeIncomeForm() {
            var incomeForm = document.getElementById("incomeForm");
            incomeForm.style.display = "none";
        }

        function addIncomeEntry() {
            var name = document.getElementById("name").value;
            var category = document.getElementById("category").value;
            var amount = document.getElementById("amount").value;
            var date = document.getElementById("date").value;
            var note = document.getElementById("note").value;

            var incomeTable = document.getElementById("incomeTable");

            var newRow = incomeTable.insertRow(-1);
            var cell1 = newRow.insertCell(0);
            var cell2 = newRow.insertCell(1);
            var cell3 = newRow.insertCell(2);
            var cell4 = newRow.insertCell(3);
            var cell5 = newRow.insertCell(4);

            cell1.innerHTML = name;
            cell2.innerHTML = category;
            cell3.innerHTML = amount;
            cell4.innerHTML = date;
            cell5.innerHTML = note;

            // Clear the form
            document.getElementById("incomeDetailsForm").reset();

            // Close the form after submission
            closeIncomeForm();
        }
    </script>
</body>
</html>

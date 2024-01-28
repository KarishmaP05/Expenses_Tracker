<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>

<head>
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

  <title> Expenses_Tracker  </title>

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
              
              <li class="nav-item">
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



    <main class="container">
        <div class="left-chart">
            <div class="chart-container">
                <canvas id="chart1"></canvas>
            </div>
            <div class="chart-container">
                <canvas id="chart2"></canvas>
            </div>
        </div>
        <div class="right-chart">


            <div class="chart-container">
                <canvas id="chart3"></canvas>
            </div>

            <div class="feilds">
                <button class="income">Income</button>
                <button class="expense">Expense</button>
                <p class="balance">Balance </p>
            </div>

        </div>
    </main>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Dummy data for the first chart (bar chart)
            const labels1 = ["January", "February", "March", "April", "May"];
            const data1 = [65, 59, 80, 81, 56];

            // Dummy data for the second chart (line chart)
            const labels2 = ["June", "July", "August", "September", "October"];
            const data2 = [45, 70, 42, 60, 75];

            // Dummy data for the third chart (donut chart)
            const labels3 = ["Red", "Blue", "Yellow"];
            const data3 = [30, 45, 25];
            const colors3 = ["#FF6384", "#36A2EB", "#FFCE56"];

            // Create the first Chart.js chart (bar chart)
            const ctx1 = document.getElementById("chart1").getContext("2d");
            const chart1 = new Chart(ctx1, {
                type: "bar",
                data: {
                    labels: labels1,
                    datasets: [{
                        label: "Data 1",
                        data: data1,
                        backgroundColor: "rgba(75, 192, 192, 0.2)",
                        borderColor: "rgba(75, 192, 192, 1)",
                        borderWidth: 1,
                    }, ],
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                        },
                    },
                },
            });

            // Create the second Chart.js chart (line chart)
            const ctx2 = document.getElementById("chart2").getContext("2d");
            const chart2 = new Chart(ctx2, {
                type: "line",
                data: {
                    labels: labels2,
                    datasets: [{
                        label: "Data 2",
                        data: data2,
                        borderColor: "rgba(255, 99, 132, 1)",
                        borderWidth: 2,
                        fill: false,
                    }, ],
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                        },
                    },
                },
            });

            // Create the third Chart.js chart (donut chart)
            const ctx3 = document.getElementById("chart3").getContext("2d");
            const chart3 = new Chart(ctx3, {
                type: "doughnut",
                data: {
                    labels: labels3,
                    datasets: [{
                        data: data3,
                        backgroundColor: colors3,
                    }, ],
                },
            });
        });
    </script>
</body>


</html>
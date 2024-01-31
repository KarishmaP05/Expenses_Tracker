<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.Connection , java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    
    <title>My Profile</title>
    
    <link rel="stylesheet" href="css/profile.css">
    
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
                <a class="nav-link" href="DashBoard.jsp">Home </a>
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


<body>

    <div class="container">

        
        
        
        
        
        <h2 id="setting-text" >My Profile</h2>

        <div class="btm">
        <div class="left-container">
            <div class="profile-photo">
                <img src="images/dark-gradient.jpg" alt="Profile Photo">
            </div>
            
            
            
             <!-- For Balance -->
            <%! float Balance=0;%>
            
            <% 
        try{
        	Class.forName("com.mysql.jdbc.Driver"); 
			 
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Expenses?useSSL=false","root","admin"); 
			
		      
	        PreparedStatement ps=con.prepareStatement("select * from Accounts where User_id="+session.getAttribute("id")); 
	        
	        ResultSet rs=ps.executeQuery(); 
	        
	        while(rs.next()){
	        	  Balance = rs.getFloat("balance"); 
	        	 
	        	
	        	 
	        	
	        	 %>
	        
	       
	        
          
	       <%  }
	        
	        
        	
        }catch(Exception e){
			
			System.out.println(e);
		}
        %>
        
          <H2>Account Balance: </H2>
	        
            <input type="text" readonly class="accbal" value="<%= Balance %>">
        </div>
        
        
        
        
        
        <!-- For Profile Details -->
        
        <% 
        try{
        	Class.forName("com.mysql.jdbc.Driver"); 
			 
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Expenses?useSSL=false","root","admin"); 
			
		      
	        PreparedStatement ps=con.prepareStatement("select * from Users where id="+session.getAttribute("id")); 
	        
	        ResultSet rs=ps.executeQuery(); 
	        
	        while(rs.next()){
	        	
	        	
	        	
	        	 String FirstName = rs.getString("first_name"); 
	        	 String LastName = rs.getString("last_name");
	        	 String Email = rs.getString("email");
	        	 String PhoneNo = rs.getString("phone_no");
	        	 String Password = rs.getString("password"); 
	        	 %>
	        	
	      	<form action="UpdateProfile" method="post">
        	<input type="text" class="input-field" name="firstname" value="<%= FirstName %>"  placeholder="<%= FirstName %>" >
        	
            <input type="text" class="input-field" name="lastname" value="<%= LastName %>"  placeholder="<%= LastName %>" >
            
            <input type="email" class="input-field" name="email"  value="<%= Email %>"  placeholder="<%= Email %>" >
            
            <input type="text" class="input-field" name="phoneno"   value="<%= PhoneNo %>" placeholder="<%= PhoneNo %>" >
            
            <input type="password" class="input-field" name="password" value="<%= Password %>"  placeholder="<%= Password %>">
            
            <button type="submit" class="submit-button">Save Changes</button>
        </form>
	        	
	       <%  }
	        
        	
        }catch(Exception e){
			
			System.out.println(e);
		}
        %>
        
        
        </div>
        </div>
   
</body>
</html>


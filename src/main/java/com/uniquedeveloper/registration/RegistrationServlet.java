package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import java.sql.CallableStatement;




@SuppressWarnings("serial")
@WebServlet("/finexo-html/Register")
public class RegistrationServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String FirstName=request.getParameter("firstname");
		String LastName=request.getParameter("lastname");
		String Email=request.getParameter("email");
		String PhoneNo=request.getParameter("phoneno");
		String Password=request.getParameter("password");
	
		RequestDispatcher dispatcher=null;
		
		Connection con=null;
		try{ 
			
			Class.forName("com.mysql.jdbc.Driver"); 
			 
			
		    
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Expenses?useSSL=false","root","admin"); 
			
					
			String query="INSERT INTO Users (first_name, last_name, email, phone_no, Password) VALUES (?,?,?,?,?)";

			Statement st=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
			
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1,FirstName);
			ps.setString(2,LastName);
			ps.setString(3,Email);
			ps.setString(4,PhoneNo);
			ps.setString(5,Password);
			
			
			ps.execute();
			
		    ResultSet rs2 =st.executeQuery("SELECT LAST_INSERT_ID();");
		    int id=1;
		    
			if(rs2.last()) {
				
			id=rs2.getInt("LAST_INSERT_ID()");
			
			
			
			}
		
			
		
			dispatcher=request.getRequestDispatcher("Registration.jsp");
			
			if(id>0) {
				
				String query1="INSERT INTO Accounts(User_id) VALUES (?)";
				PreparedStatement ps1 = con.prepareStatement(query1);
				
				ps1.setInt(1,id );
				
				ps1.execute();
				
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}  
			dispatcher.forward(request, response);
			

			
			
			}catch(Exception e){
				e.printStackTrace();
				
				System.out.println(e);
			}  finally{
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
	}

}

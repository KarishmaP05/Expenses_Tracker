package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
@WebServlet("/finexo-html/Register")
public class RegistrationServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String Name=request.getParameter("username");
		String Email=request.getParameter("email");
		int Password=Integer.parseInt(request.getParameter("password"));
		
		System.out.println("hellos");
		
		RequestDispatcher dispatcher=null;
		
		Connection con=null;
		try{ 
			
			Class.forName("com.mysql.jdbc.Driver"); 
			 
			
		    
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Expenses?useSSL=false","root","admin"); 
			
			
			PreparedStatement ps=con.prepareStatement("insert into SignUp values(?,?,?)"); 
			
			ps.setString(1,Name);  
			ps.setString(2,Email);  
			ps.setInt(3,Password); 
			
			
			int rowCount=ps.executeUpdate();
			
			System.out.println(rowCount);
			
			
			dispatcher=request.getRequestDispatcher("Registration.jsp");
			
			if(rowCount>0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}  
			dispatcher.forward(request, response);
			
//			System.out.println(ps.executeUpdate());
			
			
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

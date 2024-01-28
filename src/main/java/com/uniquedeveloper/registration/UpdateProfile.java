package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/finexo-html/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String FirstName=request.getParameter("firstname");
		String LastName=request.getParameter("lastname");
		String Email=request.getParameter("email");
		String PhoneNo=request.getParameter("phoneno");
		String Password=request.getParameter("password");
		
		RequestDispatcher dispatcher=null;
		
		HttpSession session=request.getSession();
	
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			 
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Expenses?useSSL=false","root","admin"); 
			
		
			PreparedStatement ps=con.prepareStatement("Update Users SET first_name = '"+FirstName+"', last_name = '"+LastName+"', email = '"+Email+"',phone_no = '"+PhoneNo+"',password = '"+Password+"' where Id="+session.getAttribute("id"));  
			 
			ps.executeUpdate();
			
			dispatcher=request.getRequestDispatcher("Profile.jsp");
			dispatcher.forward(request, response);
			

		}catch(Exception e){
			
			System.out.println(e);
		}
		
		
		
	}

}

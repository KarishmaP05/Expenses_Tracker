package com.uniquedeveloper.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@SuppressWarnings("serial")
@WebServlet("/finexo-html/Login")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Email=request.getParameter("email");
		int Password=Integer.parseInt(request.getParameter("password"));
		
		HttpSession session=request.getSession();
		RequestDispatcher dispatcher=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			 
			
		    
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Expenses?useSSL=false","root","admin"); 
			
            
           PreparedStatement ps=con.prepareStatement("select * from SignUp where Email=? and Password=?");  
 
           ps.setString(1,Email);  
           ps.setInt(2,Password);  
             
           ResultSet rs=ps.executeQuery(); 
           
           if(rs.next()) {
        	   session.setAttribute("name",rs.getString("Name"));
        	   dispatcher=request.getRequestDispatcher("DashBoard.jsp");
        	 
           }else {
        	   request.setAttribute("status", "failed");
        	   dispatcher=request.getRequestDispatcher("Login.jsp");
        	   
           }
       	dispatcher.forward(request, response);
            
			
			
			

		}catch(Exception e){
			
			System.out.println(e);
		}
		
	}

}

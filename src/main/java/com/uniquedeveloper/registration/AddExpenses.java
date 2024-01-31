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
import javax.servlet.http.HttpSession;


@WebServlet("/finexo-html/Addexpenses")
public class AddExpenses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String Name=request.getParameter("name");
		String Category=request.getParameter("category");
		Float Amount=Float.parseFloat(request.getParameter("amount"));
		String Date=request.getParameter("date");
		String Note=request.getParameter("note");
		
		RequestDispatcher dispatcher=null;
		
		Connection con=null;
		
		HttpSession session=request.getSession();
		
		try{ 
			
			Class.forName("com.mysql.jdbc.Driver"); 
			 
			
		    
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Expenses?useSSL=false","root","admin"); 
			
		
			
			String query="INSERT INTO Expenses (user_id,name, category, amount, date, note) VALUES (?,?,?,?,?,?)";

			
			PreparedStatement ps = con.prepareStatement(query);
			
			int userId = Integer.parseInt((String) session.getAttribute("id"));

			
	        
			ps.setInt(1,userId);
			ps.setString(2,Name);
			ps.setString(3,Category);
			ps.setFloat(4,Amount);
			ps.setString(5,Date);
			ps.setString(6,Note);
			
				
		   
			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				
				 String query1="update Accounts set balance=balance-? where user_id="+session.getAttribute("id") ;
				 PreparedStatement ps1 = con.prepareStatement(query1);
				 ps1.setFloat(1,Amount);
				 ps1.executeUpdate();
				
				
				dispatcher = request.getRequestDispatcher("Expenses.jsp");
				
			} else {
			    // Insertion failed
			}
			dispatcher.forward(request, response);
			
			}catch(Exception e){
				e.printStackTrace();
				
				System.out.println(e);
			} 
		
		
		
		
		
		
		
	}

}

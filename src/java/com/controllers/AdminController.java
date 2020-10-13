package com.controllers;
import com.daos.AdminDaos;
import com.beans.Stud;
import com.jdbc.ConnectionPool;
import com.utility.FileUploader;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.io.File;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringEscapeUtils;




 
public class AdminController extends HttpServlet {

       
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
        {
        PrintWriter out = response.getWriter();
         response.setContentType("text/html");
        String op = request.getParameter("op");
        
       
      
    
    
        }

        
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
          
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String op = request.getParameter("op");

 
           
            if(op.equalsIgnoreCase("login"))
       {
                String un=request.getParameter("userid");
		String pw=request.getParameter("password");
             //   String encodedPassword = Base64.getEncoder().encodeToString(pw.getBytes("UTF-8"));
		try 
                {
			 ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
                
		PreparedStatement ps = con.prepareStatement("select * from admin where userid=? and password=?");
		ps.setString(1, un);
		ps.setString(2, pw);
 
		ResultSet rs = ps.executeQuery();
 
		if(rs.next()) 
                {
                  String remember = request.getParameter("remember");
                    if(remember!=null && remember.equalsIgnoreCase("remember"))
                  {
                      Cookie c  = new Cookie("userid", un);
                      Cookie c1 = new Cookie("password", pw);
                      
                      c.setMaxAge(60);
                      c1.setMaxAge(60);
                      response.addCookie(c1);
                      response.addCookie(c);
                  }
                 // response.sendRedirect("userHome.jsp?name="+rs.getString("name"));
                         response.sendRedirect("Subjects");
                   
               }
               else 
                   response.sendRedirect("loginjsp.jsp?msg=Invalid Userid or password");
            }
       
      
                    
		
		
                catch (SQLException e)
                {
			if(e.getMessage().contains("Duplicate entry")) {
               out.println("<font color='red'>The userid has been already registred!!!</font><hr/>");
               RequestDispatcher rd = request.getRequestDispatcher("add.jsp");
               rd.include(request, response);
           }
           System.out.println("Error "+ e.getMessage());
        
                }

        }
        
      
        
        
    }
             
             
             
  
    
        @Override
    public String getServletInfo() {
        return "Short description";
}

}
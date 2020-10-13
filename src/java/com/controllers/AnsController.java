
package com.controllers;

import com.beans.Answers;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.beans.Subjects;

import com.beans.Tests;
import com.daos.SubjectDaos;
import com.daos.AdminDaos;
import com.daos.AnsDaos;
import com.daos.TestDaos;

import javax.servlet.http.HttpSession;
public class AnsController extends HttpServlet {

    private Subjects Subjects;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
         PrintWriter out = response.getWriter();
        response.setContentType("text/html");
         
        
        
    }

     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
      {
          
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String op = request.getParameter("op");
 if(op!=null && op.equalsIgnoreCase("add")){
     System.out.println("1");
            HttpSession session = request.getSession();
            Answers answers = (Answers)session.getAttribute("answers");
          AnsDaos ad = new AnsDaos();
          if(ad.add(answers)){
               
                out.println("ANSWERS added Successfully !!");
               
                response.sendRedirect("Student/viewans.jsp");
            }
        }

    }
        
   

        @Override
    public String getServletInfo() {
        return "Short description";
}

}
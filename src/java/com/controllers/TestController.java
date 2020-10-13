package com.controllers;
import com.beans.Subjects;
import com.beans.Teacher;
import com.daos.TestDaos;
import com.beans.Tests;

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

import org.apache.commons.lang.StringEscapeUtils;




 
public class TestController extends HttpServlet {

       
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
        {
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
            Tests tests = (Tests)session.getAttribute("tests");
            //Subjects subjects = (Subjects)session.getAttribute("subjects");
            int subid = Integer.parseInt(request.getParameter("subid"));
            int tchrid = Integer.parseInt(request.getParameter("tchrid"));
            //int subid= (Integer) session.getAttribute("subid");
           System.out.println("2");
            TestDaos td = new TestDaos();
            tests.setSubid(subid);
            tests.setTchrid(tchrid);
          System.out.println(tests.getSubid());
     System.out.println(tests.getTchrid());         
            if(td.add(tests)){
               
                out.println("Tests added Successfully !!");
               
                Tests t = td.getAllTests().get(td.getAllTests().size()-1);
                session.setAttribute("tests", t);
                System.out.println("Test Saved with ID : "+ t.getTestid());
                response.sendRedirect("Teacher/AddQues.jsp");
            }
        }

    }
        
    
    
        @Override
    public String getServletInfo() {
        return "Short description";
}

}
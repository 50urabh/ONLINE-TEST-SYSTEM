package com.controllers;
import com.beans.Questions;
import com.beans.Subjects;
import com.beans.Teacher;
import com.daos.TestDaos;
import com.daos.QuesDaos;
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




 
public class QuesController extends HttpServlet {

       
 
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
            Questions questions = (Questions)session.getAttribute("questions"); //ye null aa raha hai 
            //Subjects subjects = (Subjects)session.getAttribute("subjects");
        
            int testid =((Tests) session.getAttribute("tests")).getTestid();
            
            //int subid= (Integer) session.getAttribute("subid");
           System.out.println("2");
          System.out.println("test id " + testid);
            QuesDaos qd = new QuesDaos();
            questions.setTestid(testid);
                System.out.println("tEST id : " + questions.getTestid());

            if(qd.add(questions)){
               
                out.println("Question added Successfully !!");
                response.sendRedirect("Teacher/AddQues.jsp");
            }
        }

    }
        
    
    
        @Override
    public String getServletInfo() {
        return "Short description";
}

}
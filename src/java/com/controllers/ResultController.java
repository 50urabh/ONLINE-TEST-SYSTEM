package com.controllers;
import com.beans.*;

import com.daos.*;


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




 
public class ResultController extends HttpServlet {

       
 
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
    
            HttpSession session = request.getSession();
            Result result = (Result)session.getAttribute("result");
             int studid = Integer.parseInt(request.getParameter("studid"));
            int subid = Integer.parseInt(request.getParameter("subid"));
            int testid = Integer.parseInt(request.getParameter("testid"));
            ResultDaos rd = new ResultDaos();
                result.setStudid(studid);      
                result.setSubid(subid);
                result.setTestid(testid);
            if(rd.add(result)){
               
                out.println("Result added Successfully !!");
               
          
            }
        }

    }
        
    
    
        @Override
    public String getServletInfo() {
        return "Short description";
}

}
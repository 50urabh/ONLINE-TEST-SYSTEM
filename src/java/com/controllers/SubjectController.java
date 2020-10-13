/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controllers;

import com.beans.Admin;
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

import javax.servlet.http.HttpSession;
public class SubjectController extends HttpServlet {

    private Subjects Subjects;

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
         PrintWriter out = response.getWriter();
        response.setContentType("text/html");
         
           String op = request.getParameter("op");
        
       if(op!=null && op.equalsIgnoreCase("delete"))
            {
               int subid = Integer.parseInt(request.getParameter("subid"));
               SubjectDaos sd = new SubjectDaos();
                     if(sd.removeById(subid)) 
                           response.sendRedirect("ManageSubject.jsp");
                        
            }
        
    }

     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        String op = request.getParameter("op");
       
    if(op!=null && op.equalsIgnoreCase("add")){
        
          System.out.println("1");
          
               HttpSession session = request.getSession();
            
           Subjects subjects = (Subjects)session.getAttribute("subjects");
             String adminid = request.getParameter("adminid");
           System.out.println("2");
            SubjectDaos sd = new SubjectDaos();
            
                   subjects.setAdminid(adminid);
                   System.out.println(subjects.getAdminid());
                   System.out.println(subjects.getSubname());

            if(sd.add(Subjects)){
              
                out.println("Subject added Successfully !!");
            }
        }
        
        
    
        
    }

   

}

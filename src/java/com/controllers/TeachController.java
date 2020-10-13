package com.controllers;
import com.daos.TeachDaos;
import com.beans.Teacher;
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




 
public class TeachController extends HttpServlet {

       
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
        {
        PrintWriter out = response.getWriter();
         response.setContentType("text/html");
        String op = request.getParameter("op");
        
       if(op!=null && op.equalsIgnoreCase("delete"))
            {
               int id = Integer.parseInt(request.getParameter("id"));
               TeachDaos td = new TeachDaos();
                     if(td.removeById(id)) 
                           response.sendRedirect("Sturegshow.jsp");
                        
            }
       if(op!=null && op.equalsIgnoreCase("check_userid"))
       {
           String userid= request.getParameter("userid");
           TeachDaos td=new TeachDaos();
           if(userid==null || userid.equals(""))
           {
               out.println("<font size='4'> Please provide userid </font>");
           }
          else if(td.isUseridExist(userid))
               out.println("<font color='red' size='4'> Sorry this user id already exists </font>");
           else 
               out.println("<font color='blue size='4'> Congrats! this user id available </font>");
       }
    
    
        }

        
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
          
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String op = request.getParameter("op");

        if (op != null && op.equalsIgnoreCase("add")) {
            System.out.println("Request Foundss......");
           
             try {
                //check the enctype of the incomming request -
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
               
                String photo = "", imagePath = "";
                if (isMultipart)  
                    imagePath = FileUploader.getUploadedPath(getServletContext(), "Media/Teacher", request);
//JDBC Code 
                   TeachDaos td = new TeachDaos();
                    HttpSession session = request.getSession();
                    Teacher teacher = (Teacher) session.getAttribute("teacher");
                    teacher.setImage(imagePath);

                  

                    if (td.add(teacher)) {
                        
                        response.sendRedirect("loginjsp.jsp");
                    }

           
            
             }
            
            
            catch (Exception e) {
                System.out.println("Error : " + e.getMessage());
            }

        }

    }
        
    
    
        @Override
    public String getServletInfo() {
        return "Short description";
}

}
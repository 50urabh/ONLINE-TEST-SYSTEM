package com.utility;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet to handle File upload request from Client
 * @author Javin Paul
 */
public class Upload extends HttpServlet {
    
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
     //public static String getUploadedPath(ServletContext context,String parentDirectory,HttpServletRequest request){
       out.println("Current path : "+ getServletContext().getRealPath("/"));
                   }
                   



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
     //public static String getUploadedPath(ServletContext context,String parentDirectory,HttpServletRequest request){
       String imagePath=  FileUploader.getUploadedPath(getServletContext(),"Media/Teacher/Resumes",request);
       if(imagePath!="")
           out.println("file uploaded");
                   }
                   
}
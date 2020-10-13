package com.controllers;
import com.daos.StudDaos;
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




 
public class StudController extends HttpServlet {

       
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
        {
        PrintWriter out = response.getWriter();
         response.setContentType("text/html");
        String op = request.getParameter("op");
        
       
       if(op!=null && op.equalsIgnoreCase("check_userid"))
       {
           String userid= request.getParameter("userid");
           StudDaos sd=new StudDaos();
              
           if(userid==null || userid.equals(""))
           {
               out.println("<font size='4'> Please provide userid </font>");
           }
          else if(sd.isUseridExist(userid))
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

        if (op != null && op.equalsIgnoreCase("add")) 
        {
           
            PreparedStatement smt = null;

            try {
                     
                String userid = "";
             
                String name = "";
                String fname = "";
                String dob = "";
                String gender = "";
                String email = "";
                String phone = "";
                String image = "";
                String address = "";
              
                String city = "";
                String zipcode = "";
                String instname = "";
                String password = "";
                String imagePath="";
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                if (!isMultipart) {
                    //name=request.getParameter("name");
                    //...
                } else {
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List items = null;
                    try {
                        items = upload.parseRequest(request);
                        Iterator form = items.iterator();

                        while (form.hasNext()) {
                            FileItem item = (FileItem) form.next();
                            if(item.isFormField()){
                                if(item.getFieldName().equals("userid"))
                                    userid = item.getString();
                               
                                else if (item.getFieldName().equals("name"))
                                    name= item.getString();
                                else if(item.getFieldName().equals("fname"))
                                    fname = item.getString();
                                else if(item.getFieldName().equals("dob"))
                                    dob= item.getString();
                                else if(item.getFieldName().equals("gender"))
                                    gender = item.getString();
                                else if(item.getFieldName().equals("email"))
                                    email = item.getString();
                                else if(item.getFieldName().equals("phone"))
                                   phone = item.getString();
                           
                                else if(item.getFieldName().equals("address"))
                                    address = item.getString();
                               
                                else if(item.getFieldName().equals("city"))
                                    city= item.getString();
                                else if(item.getFieldName().equals("zipcode"))
                                    zipcode = item.getString();
                                else if(item.getFieldName().equals("instname"))
                                    instname = item.getString();
                                else if(item.getFieldName().equals("password"))
                                    password=item.getString();
                               
                            }
                            else{
                                try{
                                image = item.getName();
                                imagePath = "Media/Stud/"+image;
                                File savedFile = new File(getServletContext().getRealPath("/")+ "\\" +  imagePath);
                                item.write(savedFile);
                                }catch(Exception e){
                                    System.out.println("Saving Error : "+ e.getMessage());
                                }
                            }

                        }
                       
                        
                 ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
                
                if(con!=null){
               // String encodedPassword = Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));
                String sql = "insert into Stud (userid,zipcode,name,fname,dob,gender,email,phone,image,address,city,instname,password) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";

            //create prepared Statment -
             smt = con.prepareStatement(sql);
            smt.setString(1,userid);
         
            smt.setString(2,zipcode);
            smt.setString(3,name);
            smt.setString(4,fname);
            smt.setString(5,dob);
            smt.setString(6,gender);
            smt.setString(7,email);
            smt.setString(8,phone);
            smt.setString(9,imagePath);
            smt.setString(10,address);
          
            smt.setString(11,city);
            smt.setString(12,instname);
            smt.setString(13,password);
               int n = smt.executeUpdate(); //insert,updatet,delete -> executeUpdate(), select-> executeQuery()
                
               if (n>0)
               
                  response.sendRedirect("Student/dashboards.jsp");
                cp.putConnection(con);
                smt.close();
                
            }
                        
                    } catch (FileUploadException e) {
                        System.out.println("gist Error : " + e.getMessage());
                    }

                }

            } catch (Exception e) 
            {
                System.out.println("mnit  Error : " + e.getMessage());
            }
      
      
            
            
           
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
                
		PreparedStatement ps = con.prepareStatement("select * from Stud where userid=? and password=?");
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
             
             
             
             
        }

      
    
    
        @Override
    public String getServletInfo() {
        return "Short description";
}

}
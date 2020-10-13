package com.daos;
import com.beans.Stud;
import com.jdbc.*;
import com.beans.Teacher;
import java.sql.*;
import java.util.ArrayList;
import sun.net.smtp.SmtpClient;


import com.jdbc.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class TeachDaos {
      public boolean add(Teacher teacher) {
        boolean status = false;
     
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if(con!=null)
     
      
              try {
                String sql = "insert into teacher(userid,name,fname,dob,gender,image,email,phone,address,city,zipcode,password,status) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
                
            //create prepared Statment -
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, teacher.getUserid());         
            smt.setString(2, teacher.getName());
            smt.setString(3, teacher.getFname());
            smt.setString(4, teacher.getDob());
            smt.setString(5, teacher.getGender());
            smt.setString(6, teacher.getImage());
        
            smt.setString(7, teacher.getEmail());
            smt.setString(8, teacher.getPhone());
            smt.setString(9, teacher.getAddress());
            smt.setString(10, teacher.getCity());
            smt.setInt(11, teacher.getZipcode());
            smt.setString(12, teacher.getPassword());
            smt.setString(13,teacher.getStatus());
           
                if (smt.executeUpdate() > 0) {
                    status = true;
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Database Error :" + e.getMessage());
            }
        
        return status;
    }
      
      
    
    
     public boolean isUseridExist(String userid){
          boolean status= false;
             try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "select * from teacher where userid=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, userid );
                ResultSet rs = smt.executeQuery();
                if(rs.next()){
            {
                 status= true;
            }
            cp.putConnection(con);

           smt.close();
            }
            }
             }
          catch (Exception e)
          {
            System.out.println("Error " + e.getMessage());
          }
        
        return status;
         
        
    }
   
        public boolean removeById(int id){
        boolean status = false;
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "Delete from teacher where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id );
                
                int n = smt.executeUpdate();
                if (n>0){
                   status=true;
                   System.out.println("Record Removed !!");
                }
                   
                cp.putConnection(con);
                smt.close();
                
            }
            
            
        }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
        
        
        return status;
    }
     
     
     
      public Teacher getById(int id) {
        Teacher teacher = null;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from teacher where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    teacher = new Teacher();
            teacher.setId(rs.getInt("id")); 
            teacher.setUserid(rs.getString("userid"));   
            teacher.setZipcode(rs.getInt("zipcode")); 
            teacher.setName(rs.getString("name")); 
            teacher.setFname(rs.getString("fname"));
            teacher.setDob(rs.getString("dob"));;
            teacher.setGender(rs.getString("gender"));
            teacher.setEmail(rs.getString("email"));
            teacher.setPhone(rs.getString("phone"));
            teacher.setImage(rs.getString("image"));
            teacher.setAddress(rs.getString("address"));
            teacher.setCity(rs.getString("city"));
            teacher.setPassword(rs.getString("password"));
          
               }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return teacher;
    }

    public int isValid(String userid, String password) {
        int status = -1;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from teacher where userid=? and password=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, userid);
                smt.setString(2, password);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    status = rs.getInt("id");
                }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("DBError :" + e.getMessage());
            }
        }

        return status;
    }
    
    
      public Teacher getDetailsByLogin(String userid, String password) {
        Teacher teacher= null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from admin where userid=? and password=?";
                PreparedStatement smt = con.prepareStatement(sql);
               smt.setString(1, userid);
               smt.setString(2,password);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    teacher= new Teacher();
                   
                 teacher.setUserid(rs.getString("userid"));
                teacher.setPassword(rs.getString("password"));
                }
             
                smt.close();
                cp.putConnection(con);
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return teacher;
    }
      
  public ArrayList<Teacher> getAllteachers()
    {
        ArrayList<Teacher> TeacherList= new  ArrayList<Teacher>();
        try
        {
           ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
               if (con != null) {
                String sql = "select * from teacher";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                   Teacher teachers = new Teacher();
                    teachers.setId(rs.getInt("id"));
                    teachers.setUserid(rs.getString("userid"));
                    teachers.setName(rs.getString("name"));
                    teachers.setEmail(rs.getString("email"));
                    teachers.setAddress(rs.getString("address"));
                    teachers.setPhone(rs.getString("phone"));
                     teachers.setImage(rs.getString("image"));
                    teachers.setCity(rs.getString("city"));
                    teachers.setStatus(rs.getString("status"));
                    TeacherList.add(teachers);
                }
                cp.putConnection(con);
                smt.close();
               }
        }
        catch(Exception e)
            { e.printStackTrace();}
        
        
        return  TeacherList;
    
    }
     public int getRecordCount() {
         int total= 0;
         try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if(con!=null)
            {
            String sql = "select count(*) from teacher";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs = smt.executeQuery();
            if(rs.next()) {
                total= rs.getInt(1);
                   System.out.println("Record Inserted !!");
                }
                   
                cp.putConnection(con);
                smt.close();
                
            }
            
            
        }catch(Exception e){
            System.out.println("Error " + e.getMessage());
       
     
     }
         return total;
}
     
          public boolean updateTchrStatus(int id, String status){
    boolean sts = false;
    ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        System.out.println("cp:"+cp);
        if (con != null) {
           try {
                String sql = "update teacher set status=? where id = ?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, status);
         
                smt.setInt(2, id);
                smt.executeUpdate();
                
                sts = true;
                smt.close();
             cp.putConnection(con);
             //   System.out.println("status:"+sts);
            } catch (Exception e) {
                
              System.out.println("Error " + e.getMessage());
            }
       }
     return sts;
}
     
     public ArrayList<Teacher> getRowsByLimit(int start,int end){
     ArrayList<Teacher> teachers=new ArrayList();
    
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "select * from teacher limit ?,?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, start);
                smt.setInt(2, end);
                
                ResultSet rs = smt.executeQuery();
            while(rs.next()){
               
                Teacher t = new Teacher();
                t =new Teacher();
                t.setId(rs.getInt("id"));
                t.setUserid(rs.getString("userid"));
                t.setName(rs.getString("name"));
                t.setEmail(rs.getString("email"));
                t.setAddress(rs.getString("address"));
                t.setPhone(rs.getString("phone"));
                 t.setImage(rs.getString("image"));
                t.setCity(rs.getString("city"));
                  t.setStatus(rs.getString("status"));
                
                teachers.add(t);
             
              }
               cp.putConnection(con);
               smt.close();
              }
         }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
 
    return teachers; 
     }
}
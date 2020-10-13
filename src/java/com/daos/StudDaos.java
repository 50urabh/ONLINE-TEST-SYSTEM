package com.daos;
import com.jdbc.*;
import com.beans.Stud;
import com.beans.Subjects;
import java.sql.*;
import java.util.ArrayList;
import sun.net.smtp.SmtpClient;



public class StudDaos {

 
    public boolean add(Stud stud) {
        boolean status = false;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if(con!=null)
            {
              String sql = "insert into Stud (userid,age,zipcode,name,fname,dob,gender,email,phone,image,address,city,instname,password) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            //create prepared Statment -
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, stud.getUserid());         
            smt.setInt(2, stud.getZipcode());
            smt.setString(3, stud.getName());
            smt.setString(4, stud.getFname());
            smt.setString(5, stud.getDob());
            smt.setString(6, stud.getGender());
            smt.setString(7, stud.getEmail());
            smt.setString(8, stud.getPhone());
            smt.setString(9, stud.getImage());
            smt.setString(10, stud.getAddress());
            smt.setString(11, stud.getCity());
            smt.setString(12, stud.getInstname());
            smt.setString(13, stud.getPassword());
            
           
          int n = smt.executeUpdate();
                if (n>0){
                   status=true;
                   System.out.println("Record Inserted !!");
                }
                   
                cp.putConnection(con);
                smt.close();
                
            }
            
            
        }catch(Exception e){
            System.out.println("Error " + e.getMessage());
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
                String sql = "select * from stud where userid=?";
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
   
     
      public Stud getById(int id) {
        Stud stud = null;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from stud where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    stud = new Stud();
                    stud.setId(rs.getInt("id"));
            stud.setUserid(rs.getString("userid"));   
            stud.setZipcode(rs.getInt("zipcode")); 
            stud.setName(rs.getString("name")); 
            stud.setFname(rs.getString("fname"));
            stud.setDob(rs.getString("dob"));;
            stud.setGender(rs.getString("gender"));
            stud.setEmail(rs.getString("email"));
            stud.setPhone(rs.getString("phone"));
            stud.setImage(rs.getString("image"));
            stud.setAddress(rs.getString("address"));
            stud.setCity(rs.getString("city"));
            stud.setInstname(rs.getString("instname"));
            stud.setPassword(rs.getString("password"));
           
               }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return stud;
    }

    public int isValid(String userid, String password) {
        int status = -1;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from stud where userid=? and password=?";
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

   
    public ArrayList<Stud> getAllStudents()
    {
        ArrayList<Stud> StudentList= new  ArrayList<Stud>();
        try
        {
           ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
               if (con != null) {
                String sql = "select * from stud";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                   Stud students = new Stud();
                    students.setId(rs.getInt("id"));
                    students.setUserid(rs.getString("userid"));
                    students.setName(rs.getString("name"));
                    students.setEmail(rs.getString("email"));
                    students.setAddress(rs.getString("address"));
                    students.setPhone(rs.getString("phone"));
                     students.setImage(rs.getString("image"));
                    students.setInstname(rs.getString("instname"));
                    StudentList.add(students);
                }
                cp.putConnection(con);
                smt.close();
               }
        }
        catch(Exception e)
            { e.printStackTrace();}
        
        
        return  StudentList;
    
    }
     public int getRecordCount() {
         int total= 0;
         try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if(con!=null)
            {
            String sql = "select count(*) from stud";
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
     public ArrayList<Stud> getRowsByLimit(int start,int end){
     ArrayList<Stud> students=new ArrayList();
    
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "select * from stud limit ?,?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, start);
                smt.setInt(2, end);
                
                ResultSet rs = smt.executeQuery();
            while(rs.next()){
               
                Stud s = new Stud();
                s =new Stud();
                s.setId(rs.getInt("id"));
                s.setUserid(rs.getString("userid"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setAddress(rs.getString("address"));
                s.setPhone(rs.getString("phone"));
                s.setImage(rs.getString("image"));
                s.setInstname(rs.getString("instname"));
                
                students.add(s);
             
              }
               cp.putConnection(con);
               smt.close();
              }
         }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
 
    return students; 
     }
}

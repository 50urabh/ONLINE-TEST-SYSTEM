package com.daos;
import com.controllers.*;
import com.beans.*;
import com.jdbc.ConnectionPool;
import java.sql.*;
import java.util.ArrayList;

public class SubjectDaos{


    
    
    public boolean add(Subjects subjects) {
        boolean status = false;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if(con!=null)
            {
            String sql = "insert into Subjects(subname,adminid) values (?,?)";

            //create prepared Statment -
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, subjects.getSubname());
            smt.setString(2, subjects.getAdminid());
          
          int n = smt.executeUpdate();
                if (n>0){
                   status=true;
                   System.out.println("Record Inserted !!");
                }
                   
                cp.putConnection(con);
                smt.close();
                
            }
            
            
        }catch(Exception e){
            System.out.println("Error at daos " + e.getMessage());
        }
       return status;
    }
           
    
       public boolean removeById(int subid){
        boolean status = false;
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "Delete from subjects where subid=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, subid );
                
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
    
        public boolean remove(Subjects subjects){
        boolean status=false;
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "Delete from subjects where subid=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, subjects.getSubid());
                
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
       
    public ArrayList<Subjects> getAllSubjects()
    {
        ArrayList<Subjects> SubjectList= new  ArrayList<Subjects>();
        try
        {
           ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
               if (con != null) {
                String sql = "select * from subjects";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                   Subjects subjects = new Subjects();
                    subjects.setSubid(rs.getInt("subid"));
                    subjects.setSubname(rs.getString("subname"));
                    SubjectList.add(subjects);
                }
                cp.putConnection(con);
                smt.close();
               }
        }
        catch(Exception e)
            { e.printStackTrace();}
        
        
        return  SubjectList;
    }
    
    
         public int getRecordCount() {
         int total= 0;
         try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if(con!=null)
            {
            String sql = "select count(*) from Subjects";
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
     public ArrayList<Subjects> getRowsByLimit(int start,int end){
     ArrayList<Subjects> subjects=new ArrayList();
    
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "select * from subjects limit ?,?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, start);
                smt.setInt(2, end);
                
                ResultSet rs = smt.executeQuery();
            while(rs.next()){
               
                Subjects s = new Subjects();
                s =new Subjects();
                s.setSubid(rs.getInt("subid"));
                s.setSubname(rs.getString("subname"));
            
                subjects.add(s);
             
              }
               cp.putConnection(con);
               smt.close();
              }
         }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
 
    return subjects; 
}
    
      
           public Subjects getById(String adminid) {
        Subjects subjects = null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from subjects where adminid=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(3, adminid);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    subjects = new Subjects();
                    subjects.setAdminid(rs.getString("adminid"));
                     subjects.setSubid(rs.getInt("subid"));
                    subjects.setSubname(rs.getString("subnamename"));
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return subjects;
    }

           
           
           public Subjects getById(int subid) {
        Subjects subjects = null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from subjects where subid=?";
                PreparedStatement smt = con.prepareStatement(sql);
               smt.setInt(1, subid);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    subjects = new Subjects();
                    subjects.setAdminid(rs.getString("adminid"));
                     subjects.setSubid(rs.getInt("subid"));
                    subjects.setSubname(rs.getString("subname"));
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return subjects;
    }
     
    public static void main(String[] args) {
        System.out.println("hello");
    }
}

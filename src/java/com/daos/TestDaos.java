package com.daos;
import com.jdbc.*;
import com.beans.*;


import java.sql.*;
import java.util.ArrayList;


import sun.net.smtp.SmtpClient;


import com.jdbc.ConnectionPool;

public class TestDaos
{

    public boolean add(Tests tests)
{
        boolean status = false;
         try {
       ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
           if(con!=null)
            {
            
                String sql = "insert into tests(testname,subid,tchrid,status) values(?,?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, tests.getTestname());
                smt.setInt(2, tests.getSubid());
                smt.setInt(3, tests.getTchrid());
             
                smt.setString(4, tests.getStatus());
                
          
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
            

     public Tests getById(int testid) {
        Tests tests = null;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from tests where testid=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, testid);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    tests = new Tests();
         
           tests.setTestname(rs.getString("testname")); 
            tests.setSubid(rs.getInt("subid"));
           tests.setTchrid(rs.getInt("tchrid"));
            tests.setStatus(rs.getString("status"));
          tests.setTestid(rs.getInt("testid"));
           
               }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error at daos of tests :" + e.getMessage());
            }
        }

        return tests;
    }

     public boolean updateTestStatus(int testid, String status){
    boolean sts = false;
    ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        System.out.println("cp:"+cp);
        if (con != null) {
           try {
                String sql = "update tests set status=? where id = ?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, status);
         
                smt.setInt(2, testid);
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
     public ArrayList<Tests> getAllTests() {
        ArrayList<Tests> testList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from tests";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    Tests tests = new Tests();
                    tests.setTestid(rs.getInt("testid"));
                    tests.setTestname(rs.getString("testname"));
                    tests.setTchrid(rs.getInt("tchrid"));
                    tests.setSubid(rs.getInt("subid"));
       
                    tests.setStatus(rs.getString("status"));
                   
                    testList.add(tests);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return testList;
    }

    
    
    public ArrayList<Tests> getAllTests(String status) {
        ArrayList<Tests> AllTests = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from tests where status=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1,status);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    Tests tests = new Tests();
                    tests.setTestid(rs.getInt("testid"));
                    tests.setTestname(rs.getString("testname"));
                      tests.setSubid(rs.getInt("subid"));
                    tests.setTchrid(rs.getInt("tchrid"));
                    tests.setStatus(rs.getString("status"));
                   

                    AllTests.add(tests);
                }
                 cp.putConnection(con);
                smt.close();;
            }
        } catch (Exception e) {
            System.out.println("Error : " + e.getMessage());
        }

        return AllTests;
    }
    
    
    
    
    public ArrayList<Tests> getTestBySubId(int subid) {
        ArrayList<Tests> testList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from tests where subid=?";
                PreparedStatement smt = con.prepareStatement(sql);
                 smt.setInt(1, subid);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    Tests tests = new Tests();
                    tests.setTestid(rs.getInt("testid"));
                    tests.setTestname(rs.getString("testname"));
                    tests.setTchrid(rs.getInt("tchrid"));
                    tests.setSubid(rs.getInt("subid"));
       
                    tests.setStatus(rs.getString("status"));
                   
                    testList.add(tests);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return testList;
    }

    
    
    
    public static void main(String[] args) 
   {
        System.out.println("hello");
    }
}
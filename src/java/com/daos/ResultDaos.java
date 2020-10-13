package com.daos;
import com.jdbc.*;
import com.beans.*;


import java.sql.*;
import java.util.ArrayList;


import sun.net.smtp.SmtpClient;


import com.jdbc.ConnectionPool;

public class ResultDaos
{

    public boolean add(Result result)
{
        boolean status = false;
         try {
       ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
           if(con!=null)
            {
            
                String sql = "insert into result(studid,subid,testid,attempt,correct,wrong,score,result) values(?,?,?,?,?,?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, result.getStudid());
                smt.setInt(2, result.getSubid());
                smt.setInt(3, result.getTestid());
                 smt.setInt(4, result.getAttempt());
                 smt.setInt(5, result.getCorrect());
              smt.setInt(6, result.getWrong());
              smt.setInt(7, result.getScore());
              smt.setString(8, result.getResult());
             
               
          
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
            

 
    
    
    public ArrayList<Result> getResultByStudId(int studid) {
        ArrayList<Result> resultList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from result where studid=?";
                PreparedStatement smt = con.prepareStatement(sql);
                 smt.setInt(1, studid);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    Result result = new Result();
                    
                result.setStudid(rs.getInt("studid"));
                result.setSubid(rs.getInt("subid"));
               result.setTestid(rs.getInt("Testid"));
               result.setAttempt(rs.getInt("attempt"));
              result.setCorrect(rs.getInt("correct"));
               result.setWrong(rs.getInt("wrong"));
           result.setScore(rs.getInt("score"));
           result.setResult(rs.getString("result"));
                resultList.add(result);
          
                    
                
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return resultList;
    }

    
    
     public ArrayList<Result> getAllResult() {
        ArrayList<Result> resultList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from result";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    Result result = new Result();
                    result.setId(rs.getInt("id"));
                    result.setStudid(rs.getInt("studid"));
                    result.setSubid(rs.getInt("subid"));
                    result.setTestid(rs.getInt("testid"));
                    result.setAttempt(rs.getInt("attempt"));
                    result.setCorrect(rs.getInt("correct"));
                    result.setWrong(rs.getInt("wrong"));
                    result.setScore(rs.getInt("score"));
                    result.setResult(rs.getString("result"));
                                       
                    resultList.add(result);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return resultList;
    }

       
     
     
    
    public static void main(String[] args) 
   {
        System.out.println("hello");
    }
}
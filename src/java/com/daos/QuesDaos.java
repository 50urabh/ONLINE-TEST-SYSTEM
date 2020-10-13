package com.daos;
import com.jdbc.*;
import com.beans.*;


import java.sql.*;
import java.util.ArrayList;


import sun.net.smtp.SmtpClient;


import com.jdbc.ConnectionPool;

public class QuesDaos
{

    public boolean add(Questions questions)
{
        boolean status = false;
         try {
       ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
           if(con!=null)
            {
            
                String sql = "insert into questions(testid,ques,op1,op2,op3,op4,correctop) values(?,?,?,?,?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, questions.getTestid());
                smt.setString(2, questions.getQues());
                smt.setString(3, questions.getOp1());
                smt.setString(4, questions.getOp2());
                smt.setString(5, questions.getOp3());
                smt.setString(6, questions.getOp4());
                smt.setString(7, questions.getCorrectop());
             
             
               
          
                       int n = smt.executeUpdate();
                if (n>0){
                   status=true;
                   System.out.println("Record Inserted !!");
                }
               
                cp.putConnection(con);
                smt.close();
                
            }
            
            
        }catch(Exception e){
            System.out.println("Error at daos of ques " + e.getMessage());
        }

       return status;
    }
            
     public ArrayList<Questions> getById(int testid) {
       ArrayList<Questions> questions = new ArrayList<Questions>();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from questions where testid=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, testid);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    Questions question = new Questions();
                   question.setQid(rs.getInt("qid"));
                    question.setTestid(rs.getInt("testid"));
                    question.setQues(rs.getString("ques"));
                    question.setOp1(rs.getString("op1"));
                    question.setOp2(rs.getString("op2"));
                   question.setOp3(rs.getString("op3"));
                    question.setOp4(rs.getString("op4"));
                question.setCorrectop(rs.getString("correctop"));
                
                questions.add(question);
             }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return questions;
    }

    public ArrayList<Questions> getAllQuestions()
    {
        ArrayList<Questions> QuesList= new  ArrayList<Questions>();
        try
        {
           ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
               if (con != null) {
                String sql = "select * from questions";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                   Questions questions = new Questions();
                    questions.setQues(rs.getString("ques"));
                    questions.setOp1(rs.getString("Op1"));
                     questions.setOp2(rs.getString("Op2"));
                       questions.setOp3(rs.getString("Op3"));
                         questions.setOp4(rs.getString("Op4"));
                           questions.setCorrectop(rs.getString("correctop"));
                       
                }
                cp.putConnection(con);
                smt.close();
               }
        }
        catch(Exception e)
            { e.printStackTrace();}
        
        
        return  QuesList;
    }
    
    
         public int getRecordCount() {
         int total= 0;
         try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if(con!=null)
            {
            String sql = "select count(*) from Questions";
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
     public ArrayList<Questions> getRowsByLimit(int start,int end){
     ArrayList<Questions> questions=new ArrayList();
    
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "select * from questions limit ?,?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, start);
                smt.setInt(2, end);
                
                ResultSet rs = smt.executeQuery();
            while(rs.next()){
               
               Questions q = new Questions();
                q =new Questions();
                q.setQues(rs.getString("ques"));
                q.setOp1(rs.getString("op1"));
               q.setOp2(rs.getString("op2"));
                  q.setOp3(rs.getString("op3"));
                     q.setOp4(rs.getString("op4"));
                        q.setCorrectop(rs.getString("correctop"));
                questions.add(q);
             
              }
               cp.putConnection(con);
               smt.close();
              }
         }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
 
    return questions; 
}
     
     
    
    public static void main(String[] args) 
   {
        System.out.println("hello");
    }
}
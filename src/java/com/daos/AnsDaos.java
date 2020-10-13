package com.daos;
import com.jdbc.*;
import com.beans.*;


import java.sql.*;
import java.util.ArrayList;


import sun.net.smtp.SmtpClient;


import com.jdbc.ConnectionPool;

public class AnsDaos
{

    public boolean add(Answers answers)
{
        boolean status = false;
         try {
       ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
           if(con!=null)
            {
            
                String sql = "insert into answers(studid,testid,quesid,ques,correctop,submitans) values(?,?,?,?,?,?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, answers.getStudid());
                smt.setInt(2, answers.getTestid());
                smt.setInt(3, answers.getQuesid());
                smt.setString(4, answers.getQues());
                 smt.setString(5, answers.getCorrectop());
                 smt.setString(6, answers.getSubmitans());
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
            

    
    public ArrayList<Answers> getAnswers()
    {
        ArrayList<Answers> AnsList= new  ArrayList<Answers>();
        try
        {
           ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
               if (con != null) {
                String sql = "select * from answers";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                   Answers answers = new Answers();
                     answers.setStudid(rs.getString("studid"));
                     answers.setTestid(rs.getInt("testid"));
                     answers.setQuesid(rs.getInt("quesid"));
                     answers.setQues(rs.getString("ques"));
                     answers.setCorrectop(rs.getString("correctop"));
                     answers.setSubmitans(rs.getString("submitans"));
                       
                }
                cp.putConnection(con);
                smt.close();
               }
        }
        catch(Exception e)
            { e.printStackTrace();}
        
        
        return  AnsList;
    }
    
     
    
    
    
    public static void main(String[] args) 
   {
        System.out.println("hello");
    }
}
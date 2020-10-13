package com.daos;
import com.jdbc.*;
import com.beans.Admin;
import java.sql.*;
import java.util.ArrayList;
import sun.net.smtp.SmtpClient;


import com.jdbc.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class AdminDaos {
    
      public int isValid(String userid, String password) {
        int status = -1;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from admin where userid=? and password=?";
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
  
      
      
       public Admin getById(int id) {
        Admin admin = null;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();
        if (con != null) {
            try {
                String sql = "select * from admin where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    admin = new Admin();
            admin.setUserid(rs.getString("userid"));   
            admin.setZipcode(rs.getInt("zipcode")); 
            admin.setName(rs.getString("name")); 
           
            admin.setDob(rs.getString("dob"));;
           admin.setGender(rs.getString("gender"));
            admin.setEmail(rs.getString("email"));
            admin.setPhone(rs.getString("phone"));
            admin.setImage(rs.getString("image"));
            admin.setAddress(rs.getString("address"));
           admin.setCity(rs.getString("city"));
            admin.setPassword(rs.getString("password"));
           
               }
                smt.close();
                cp.putConnection(con);
            } catch (Exception e) {
                System.out.println("Error :" + e.getMessage());
            }
        }

        return admin;
    }

     

}
   
    
    
    

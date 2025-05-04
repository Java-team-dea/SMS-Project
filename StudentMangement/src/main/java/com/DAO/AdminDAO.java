/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.Admin;
import com.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author dilshan
 */
public class AdminDAO {
    
    
public boolean validateAdmin(Admin admin) throws SQLException, Exception {
    String sql = "SELECT * FROM Admin WHERE email = ? AND password = ?";
    
    try (Connection connection = Database.getConnection();
         PreparedStatement statement = connection.prepareStatement(sql)) {
         
        // Set parameters (plain text comparison)
        statement.setString(1, admin.getEmail());
        statement.setString(2, admin.getPassword());
        
        try (ResultSet resultSet = statement.executeQuery()) {
            return resultSet.next(); // Returns true if a matching record exists
        }
    } catch (SQLException e) {
        // Log the error properly
        throw new RuntimeException("Database error during validation", e);
    }
}

public ArrayList<Admin> getAllStudent(){

  
    
    try{
        
             ArrayList<Admin> studentList =new  ArrayList<Admin>();
             
             String query ="select name,email,phone from students";
             
             Statement statement= Database.getConnection().createStatement();
             ResultSet rs=statement.executeQuery(query);
             
             while(rs.next()){
                 Admin admin=new Admin();
                 admin.setName(rs.getString("name"));
                 admin.setEmail(rs.getString("email"));
                 admin.setPhone("phone");     
                 studentList.add(admin);
                 
             }

             
            return studentList;
             
             
    } catch(Exception e){
        e.printStackTrace();
        
    }


return null;

    
}  
}

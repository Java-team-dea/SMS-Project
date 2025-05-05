/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.Admin;
import com.model.Student;
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

public ArrayList<Student> getAllStudent(){

  
    
    try{
        
             ArrayList<Student> studentList =new  ArrayList<Student>();
             
             String query ="select id,name,email,phone from students";
             
             Statement statement= Database.getConnection().createStatement();
             ResultSet rs=statement.executeQuery(query);
             
             while(rs.next()){
                 Student student=new Student();
                 
                 student.setName(rs.getString("name"));
                 student.setEmail(rs.getString("email"));
                 student.setPhone(rs.getString("phone"));     
                 studentList.add(student);
                 
             }

             
            return studentList;
             
             
    } catch(Exception e){
        e.printStackTrace();
        
    }


return null;

    
}


    public int countAllStudents() throws SQLException, Exception {
        String sql = "SELECT COUNT(id) AS total FROM students";
        
        try (Connection connection = Database.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            if (resultSet.next()) {
                return resultSet.getInt("total");
            }
            return 0;
        }
    }


}

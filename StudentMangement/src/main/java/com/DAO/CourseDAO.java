/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.Courses;
import com.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author dilshan
 */
public class CourseDAO {
    
    public void addCourses(Courses courses) throws SQLException, Exception {
    String sql = "INSERT INTO Courses(Name, Description, Credits,Duration,DepartmentID) VALUES (?, ?, ?,?,?)";
    
    try (Connection connection = Database.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
        
        // Set parameters
        preparedStatement.setString(1, courses.getName());
        preparedStatement.setString(2, courses.getDescription());
        preparedStatement.setInt(3, courses.getCredits());
        preparedStatement.setInt(4, courses.getDuration());
        preparedStatement.setInt(5, courses.getDepartmentID());

        
        
        // Execute update
        preparedStatement.executeUpdate();
    }
}
    
    
    
    
}

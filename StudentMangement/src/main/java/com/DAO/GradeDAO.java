/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;


import com.model.Courses;
import com.model.Grade;
import com.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author dilshan
 */
public class GradeDAO {
 
//     public void addGrade(Grade grade) throws SQLException, Exception {
//    String sql = "INSERT INTO Grade( studentid,moduleid,grade  VALUES (?, ?, ?)";
//    
//    try (Connection connection = Database.getConnection();
//         PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
//        
//       
//        preparedStatement.setInt(1, grade.getStudentid());
//        preparedStatement.setString(2, grade.getModuleid());
//        preparedStatement.setString(3, grade.getGrade());
//
//
//        
//        
//        // Execute update
//        preparedStatement.executeUpdate();
//    }
//}
     
     
         public void addGrade(Grade grade) throws SQLException, Exception {
        String sql = "INSERT INTO Grade(studentid, moduleid, grade) VALUES (?, ?, ?)";
        
        try (Connection connection = Database.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
            preparedStatement.setInt(1, grade.getStudentid());
            preparedStatement.setString(2, grade.getModuleid());
            preparedStatement.setString(3, grade.getGrade());
            
            preparedStatement.executeUpdate();
        }
    }
    

    
    public ArrayList<Grade> getAllGrade() throws Exception{
        
        try{
            
            ArrayList<Grade> listGrade = new ArrayList<Grade>();
            
            String query = "select gradeid,studentid,moduleid,grade from Grade";
            
            Statement statement =Database.getConnection().createStatement();
            ResultSet rs = statement.executeQuery(query);
            
            while(rs.next()){
                Grade grade=new Grade();
                grade.setId(rs.getInt("gradeid"));
                grade.setStudentid(rs.getInt("studentid"));
                grade.setModuleid(rs.getString("moduleid"));
                grade.setGrade(rs.getString("grade"));
//               
                listGrade.add(grade);

            }
          
           return listGrade; 
            
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
        
    }
    
    
}

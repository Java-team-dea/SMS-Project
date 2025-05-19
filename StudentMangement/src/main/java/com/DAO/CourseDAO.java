/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.Courses;
import com.model.Student;
import com.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author dilshan
 */
public class CourseDAO {
    
    /**
     * Add a new course to the database
     * @param courses The course to add
     * @throws SQLException If a database access error occurs
     * @throws Exception If any other error occurs
     */
    public void addCourses(Courses courses) throws SQLException, Exception {
        String sql = "INSERT INTO Courses(Name, Description, Credits, Duration, DepartmentID) VALUES (?, ?, ?, ?, ?)";
        
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
    
    /**
     * Get all courses from the database
     * @return ArrayList of all courses or null if error occurs
     * @throws Exception If any error occurs
     */
    public ArrayList<Courses> getAllCourses() throws Exception {
        try {
            ArrayList<Courses> listCourses = new ArrayList<Courses>();
            
            String query = "SELECT CourseID, Name, Description, Credits, Duration, DepartmentID FROM Courses";
            
            Statement statement = Database.getConnection().createStatement();
            ResultSet rs = statement.executeQuery(query);
            
            while(rs.next()) {
                Courses courses = new Courses();
                courses.setCourseID(rs.getInt("CourseID"));
                courses.setName(rs.getString("Name"));
                courses.setDescription(rs.getString("Description"));
                courses.setCredits(rs.getInt("Credits"));
                courses.setDuration(rs.getInt("Duration"));
                courses.setDepartmentID(rs.getInt("DepartmentID"));
                listCourses.add(courses);
            }
            
            return listCourses;
            
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    /**
     * Update an existing course in the database
     * @param course The course with updated information
     * @return boolean indicating if the update was successful
     * @throws SQLException If a database access error occurs
     * @throws Exception If any other error occurs
     */
    public boolean updateCourse(Courses course) throws SQLException, Exception {
        String sql = "UPDATE Courses SET Name=?, Description=?, Credits=?, Duration=?, DepartmentID=? WHERE CourseID=?";
        
        try (Connection connection = Database.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
            preparedStatement.setString(1, course.getName());
            preparedStatement.setString(2, course.getDescription());
            preparedStatement.setInt(3, course.getCredits());
            preparedStatement.setInt(4, course.getDuration());
            preparedStatement.setInt(5, course.getDepartmentID());
            preparedStatement.setInt(6, course.getCourseID());
            
            int rowsAffected = preparedStatement.executeUpdate();
            System.out.println("Rows affected: " + rowsAffected);
            
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("SQL Error in updateCourse: " + e.getMessage());
            throw e;
        }
    }
    
    /**
     * Get a course by its ID
     * @param courseId the ID of the course to retrieve
     * @return the Courses object or null if not found
     * @throws SQLException If a database access error occurs
     * @throws Exception If any other error occurs
     */
    public Courses getCourseById(int courseId) throws SQLException, Exception {
        String sql = "SELECT * FROM Courses WHERE CourseID=?";
        Courses course = null;
        
        try (Connection connection = Database.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
            preparedStatement.setInt(1, courseId);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                course = new Courses();
                course.setCourseID(rs.getInt("CourseID"));
                course.setName(rs.getString("Name"));
                course.setDescription(rs.getString("Description"));
                course.setCredits(rs.getInt("Credits"));
                course.setDuration(rs.getInt("Duration"));
                course.setDepartmentID(rs.getInt("DepartmentID"));
            }
        }
        return course;
    }

    /**
     * Delete a course by its ID
     * @param conn The database connection
     * @param courseId The ID of the course to delete
     * @return boolean indicating if the deletion was successful
     * @throws SQLException If a database access error occurs
     */
    public boolean deleteCourse(Connection conn, int courseId) throws SQLException {
        String sql = "DELETE FROM courses WHERE CourseID = ?";
        try (PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, courseId);
            return preparedStatement.executeUpdate() > 0;
        }
    }
    
    /**
     * Get a course by its ID (String version)
     * @param courseID the ID of the course to retrieve as String
     * @return the Courses object or null if not found
     */
    public Courses getCourseByIdString(String courseID) {
        String query = "SELECT * FROM Courses WHERE CourseID = ?";
        Courses course = null;
        
        try (Connection connection = Database.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            
            pstmt.setString(1, courseID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    course = new Courses();
                    course.setCourseID(rs.getInt("CourseID"));
                    course.setName(rs.getString("Name"));
                    course.setDescription(rs.getString("Description"));
                    course.setCredits(rs.getInt("Credits"));
                    course.setDuration(rs.getInt("Duration"));
                    course.setDepartmentID(rs.getInt("DepartmentID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return course;
    }
    
    /**
     * Get the department name by its ID
     * @param departmentID the ID of the department
     * @return the department name or "Unknown Department" if not found
     */
    public String getDepartmentNameById(String departmentID) {
        String query = "SELECT DepartmentName FROM Department WHERE DepartmentID = ?";
        String departmentName = "Unknown Department";
        
        try (Connection connection = Database.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {
            
            pstmt.setString(1, departmentID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    departmentName = rs.getString("DepartmentName");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return departmentName;
    }
    
    /**
     * Get the department name by its ID (integer version)
     * @param departmentID the ID of the department as integer
     * @return the department name or "Unknown Department" if not found
     */
    public String getDepartmentNameById(int departmentID) {
        return getDepartmentNameById(String.valueOf(departmentID));
    }
    // Add this method to your CourseDAO class
public Courses getCourseByStudentId(int studentId) throws SQLException, Exception {
    // First get the student to find their course ID
    StudentDAO studentDAO = new StudentDAO();
    Student student = studentDAO.getStudentById(studentId);
    
    if (student == null || student.getCourseID() == 0) {
        return null;
    }
    
    // Then get the course
    return getCourseById(student.getCourseID());
}
public List<Courses> getStudentCourses(int studentId) throws SQLException, Exception {
    List<Courses> coursesList = new ArrayList<>();
    
    // This query assumes you have a student_courses table that links students to courses
    String sql = "SELECT c.* FROM courses c " +
                 "JOIN student_courses sc ON c.CourseID = sc.CourseID " +
                 "WHERE sc.StudentID = ?";
    
    
    
    try (Connection conn = Database.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setInt(1, studentId);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            Courses course = new Courses();
            course.setCourseID(rs.getInt("CourseID"));
            course.setName(rs.getString("Name"));
            course.setDescription(rs.getString("Description"));
            course.setCredits(rs.getInt("Credits"));
            course.setDuration(rs.getInt("Duration"));
            course.setDepartmentID(rs.getInt("DepartmentID"));
            coursesList.add(course);
        }
    }
    return coursesList;


    
    }
    
}

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

        try (Connection connection = Database.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

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

//    public ArrayList<Student> getAllStudent() {
//
//        try {
//
//            ArrayList<Student> studentList = new ArrayList<Student>();
//
//            String query = "select id,name,gender,nic,email,phone from Student";
//
//            Statement statement = Database.getConnection().createStatement();
//            ResultSet rs = statement.executeQuery(query);
//
//            while (rs.next()) {
//                Student student = new Student();
//                student.setId(rs.getInt("id"));
//                student.setName(rs.getString("name"));
//                student.setEmail(rs.getString("email"));
//                student.setPhone(rs.getString("phone"));
//                studentList.add(student);
//
//            }
//
//            return studentList;
//
//        } catch (Exception e) {
//            e.printStackTrace();
//
//        }
//
//        return null;
//
//    }
    
    
//    public ArrayList<Student> getAllStudent() throws Exception {
//    ArrayList<Student> studentList = new ArrayList<>();
//    
//    try {
//        String query = "SELECT id, name, dob, gender, nic, email, phone, address, enrollmentDate, "
//                     + "FacultyID, departmentID, CourseID, RegistrationDate FROM Student";
//        
//        Connection connection = Database.getConnection();
//        Statement statement = connection.createStatement();
//        ResultSet rs = statement.executeQuery(query);
//
//        while (rs.next()) {
//            Student student = new Student();
//            student.setId(rs.getInt("id"));
//            student.setName(rs.getString("name"));
//            student.setDob(rs.getDate("dob"));
//            student.setGender(rs.getString("gender"));
//            student.setNic(rs.getString("nic"));
//            student.setEmail(rs.getString("email"));
//            student.setPhone(rs.getString("phone"));
//            student.setAddress(rs.getString("address"));
//            student.setEnrollmentDate(rs.getDate("enrollmentDate"));
//            student.setFacultyID(rs.getInt("FacultyID"));
////            student.setFacultyName(rs.getString("facultyName"));
//            student.setDepartmentID(rs.getInt("departmentID"));
//            student.setCourseID(rs.getInt("CourseID"));
//            student.setRegistrationDate(rs.getTimestamp("RegistrationDate"));
//            
//            studentList.add(student);
//        }
//        
//        // Close resources
//        rs.close();
//        statement.close();
//        connection.close();
//        
//        return studentList;
//    } catch (SQLException e) {
//        e.printStackTrace();
//        return null;
//    }
//}
    public ArrayList<Student> getAllStudent() throws Exception {
    ArrayList<Student> studentList = new ArrayList<>();
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;
    
    try {
        String query = "SELECT id, name, dob, gender, nic, email, phone, address, enrollmentDate, "
                     + "FacultyID, departmentID, CourseID, password, RegistrationDate FROM Student";
        
        connection = Database.getConnection();
        statement = connection.createStatement();
        rs = statement.executeQuery(query);

        while (rs.next()) {
            Student student = new Student();
            student.setId(rs.getInt("id"));
            student.setName(rs.getString("name"));
            student.setDob(rs.getDate("dob"));
            student.setGender(rs.getString("gender"));
            student.setNic(rs.getString("nic"));
            student.setEmail(rs.getString("email"));
            student.setPhone(rs.getString("phone"));
            student.setAddress(rs.getString("address"));
            student.setEnrollmentDate(rs.getDate("enrollmentDate"));
            student.setFacultyID(rs.getInt("FacultyID"));
            student.setDepartmentID(rs.getInt("departmentID"));
            student.setCourseID(rs.getInt("CourseID"));
            student.setPassword(rs.getString("password")); // Added password field
            student.setRegistrationDate(rs.getTimestamp("RegistrationDate"));
            
            studentList.add(student);
        }
        
        return studentList;
    } catch (SQLException e) {
        e.printStackTrace();
        throw new Exception("Error retrieving student list: " + e.getMessage());
    } finally {
        // Close resources in finally block
        try {
            if (rs != null) rs.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
    

    public int countAllStudents() throws SQLException, Exception {
        String sql = "SELECT COUNT(id) AS total FROM Student";

        try (Connection connection = Database.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt("total");
            }
            return 0;
        }
    }

    public int countAllFaculty() throws SQLException, Exception {
        String sql = "SELECT COUNT(FacultyID) AS totalF FROM Faculty";

        try (Connection connection = Database.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt("totalF");
            }
            return 0;
        }
    }

    public int countAllCourse() throws SQLException, Exception {
        String sql = "SELECT COUNT(CourseID) AS totalcourse FROM Courses";

        try (Connection connection = Database.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt("totalcourse");
            }
            return 0;
        }
    }
//    public boolean updateStudent(Student student) throws SQLException, Exception {
//    System.out.println("Executing update for student ID: " + student.getId());
//    
//    String sql = "UPDATE Student SET name=?, dob=?, gender=?, nic=?, email=?, phone=?, "
//               + "address=?, enrollmentDate=?, FacultyID=?, departmentID=? WHERE id=?";
//    
//    try (Connection conn = Database.getConnection();
//         PreparedStatement stmt = conn.prepareStatement(sql)) {
//        
//        // Set parameters
//        stmt.setString(1, student.getName());
//        stmt.setDate(2, new java.sql.Date(student.getDob().getTime()));
//        stmt.setString(3, student.getGender());
//        stmt.setString(4, student.getNic());
//        stmt.setString(5, student.getEmail());
//        stmt.setString(6, student.getPhone());
//        stmt.setString(7, student.getAddress());
//        stmt.setDate(8, new java.sql.Date(student.getEnrollmentDate().getTime()));
////        stmt.setString(9, student.getFacultyName());
//        stmt.setInt(9, student.getDepartmentID());
//        stmt.setInt(10, student.getId());
//        
//        System.out.println("Executing SQL: " + stmt.toString());
//        
//        int rowsAffected = stmt.executeUpdate();
//        System.out.println("Rows affected: " + rowsAffected);
//        
//        return rowsAffected > 0;
//    }
//}
    
       public boolean updateStudent(Student student) throws SQLException, Exception {
    String sql = "UPDATE Student SET name=?, dob=?, gender=?, nic=?, email=?, phone=?, " +
                 "address=?, enrollmentDate=?, FacultyID=?, departmentID=?, CourseID=?, password=? WHERE id=?";

    try (Connection connection = Database.getConnection();
         PreparedStatement ps = connection.prepareStatement(sql)) {

        ps.setString(1, student.getName());
        ps.setDate(2, new java.sql.Date(student.getDob().getTime()));
        ps.setString(3, student.getGender());
        ps.setString(4, student.getNic());
        ps.setString(5, student.getEmail());
        ps.setString(6, student.getPhone());
        ps.setString(7, student.getAddress());
        ps.setDate(8, new java.sql.Date(student.getEnrollmentDate().getTime()));
        ps.setInt(9, student.getFacultyID());  // Corrected FacultyID
        ps.setInt(10, student.getDepartmentID());
        ps.setInt(11, student.getCourseID());  // Added CourseID
        ps.setString(12, student.getPassword()); // Added password
        ps.setInt(13, student.getId());

        return ps.executeUpdate() > 0;
    }
}
    
    
}



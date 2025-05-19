/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.Student;
import com.util.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Data Access Object for Student entity with improved error handling and logging
 * Updated to match the database schema
 */
public class StudentDAO {
    private static final Logger LOGGER = Logger.getLogger(StudentDAO.class.getName());
    
    /**
     * Authenticates a student based on email and password
     *
     * @param email Student email
     * @param password Student password
     * @return Student object if authentication successful, null otherwise
     */
    public Student authenticate(String email, String password) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Student student = null;
        
        try {
            // Get database connection
            try {
                conn = Database.getConnection();
                if (conn == null) {
                    LOGGER.severe("Failed to obtain database connection");
                    return null;
                }
            } catch (Exception ex) {
                LOGGER.log(Level.SEVERE, "Database connection error", ex);
                return null;
            }
            
            // Using a JOIN to get faculty name along with student data - table name changed to lowercase
            String sql = "SELECT s.*, f.Name AS FacultyName, d.Name AS DepartmentName, c.Name AS CourseName " +
                        "FROM student s " +
                        "LEFT JOIN Faculty f ON s.FacultyID = f.FacultyID " +
                        "LEFT JOIN Department d ON s.departmentID = d.DepartmentID " +
                        "LEFT JOIN Courses c ON s.CourseID = c.CourseID " +
                        "WHERE s.email = ? AND s.password = ?";
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password); // Note: In production, use hashed passwords
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                // If student found, create a Student object with basic details
                student = new Student();
                
                // Set core student properties - using the column name "id" instead of "StudentID"
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                
                try {
                    // These fields match the database column names
                    student.setDob(rs.getDate("dob"));
                    student.setGender(rs.getString("gender"));
                    student.setNic(rs.getString("nic"));
                    student.setPhone(rs.getString("phone"));
                    student.setAddress(rs.getString("address"));
                    student.setEnrollmentDate(rs.getDate("enrollmentDate"));
                    student.setFacultyID(rs.getInt("FacultyID"));
                    student.setDepartmentID(rs.getInt("departmentID"));
                    student.setCourseID(rs.getInt("CourseID"));
                    student.setRegistrationDate(rs.getDate("RegistrationDate"));
                    
                    // Set faculty, department, and course names
                    student.setFacultyName(rs.getString("FacultyName"));
                    student.setDepartmentName(rs.getString("DepartmentName"));
                    student.setCourseName(rs.getString("CourseName"));
                } catch (SQLException e) {
                    // Log the exception but continue - these fields are not critical for login
                    LOGGER.log(Level.WARNING, "Some student fields could not be loaded: {0}", e.getMessage());
                }
                
                // Now that we have the student ID, get additional dashboard information separately
                setDashboardInfo(student, conn);
            } else {
                LOGGER.log(Level.INFO, "Authentication failed for email: {0}", email);
            }
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL error during authentication", e);
        } finally {
            // Close resources
            closeResources(rs, stmt, conn);
        }
        
        return student;
    }
    
    /**
     * Sets dashboard information for a student
     * 
     * @param student The Student object to update
     * @param conn Database connection
     */
    private void setDashboardInfo(Student student, Connection conn) {
        if (student == null || conn == null) return;
        
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // Get course count - using student_id to match database column
            try {
                String coursesCountSql = "SELECT COUNT(*) AS courses_count FROM student_courses WHERE student_id = ?";
                stmt = conn.prepareStatement(coursesCountSql);
                stmt.setInt(1, student.getId());
                rs = stmt.executeQuery();
                
                if (rs.next()) {
                    student.setCoursesCount(rs.getInt("courses_count"));
                } else {
                    student.setCoursesCount(0);
                }
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "Error fetching courses count: {0}", e.getMessage());
                student.setCoursesCount(0);
            } finally {
                closeResources(rs, stmt, null);
            }
            
            // Get GPA
            try {
                String gpaSql = "SELECT AVG(grade_point) AS gpa FROM student_grades WHERE student_id = ?";
                stmt = conn.prepareStatement(gpaSql);
                stmt.setInt(1, student.getId());
                rs = stmt.executeQuery();
                
                if (rs.next()) {
                    student.setGpa(rs.getDouble("gpa"));
                } else {
                    student.setGpa(0.0);
                }
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "Error fetching GPA: {0}", e.getMessage());
                student.setGpa(0.0);
            } finally {
                closeResources(rs, stmt, null);
            }
            
            // Get outstanding fees
            try {
                String feesSql = "SELECT SUM(amount) AS outstanding_fees FROM student_fees WHERE student_id = ? AND payment_status = 'unpaid'";
                stmt = conn.prepareStatement(feesSql);
                stmt.setInt(1, student.getId());
                rs = stmt.executeQuery();
                
                if (rs.next()) {
                    double fees = rs.getDouble("outstanding_fees");
                    if (rs.wasNull()) {
                        fees = 0.0;
                    }
                    student.setOutstandingFees("$" + String.format("%.2f", fees));
                } else {
                    student.setOutstandingFees("$0.00");
                }
            } catch (SQLException e) {
                LOGGER.log(Level.WARNING, "Error fetching fees: {0}", e.getMessage());
                student.setOutstandingFees("$0.00");
            } finally {
                closeResources(rs, stmt, null);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error setting dashboard info", e);
        }
    }
    
    /**
     * Retrieves a student by ID with dashboard information
     * 
     * @param studentID The student ID
     * @return Student object if found, null otherwise
     */
    public Student getStudentById(int studentID) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Student student = null;
        
        try {
            try {
                conn = Database.getConnection();
                if (conn == null) {
                    LOGGER.severe("Failed to obtain database connection");
                    return null;
                }
            } catch (Exception ex) {
                LOGGER.log(Level.SEVERE, "Database connection error", ex);
                return null;
            }
            
            // Updated table names and column names
            String sql = "SELECT s.*, f.Name AS FacultyName, d.Name AS DepartmentName, c.Name AS CourseName " +
                        "FROM student s " +
                        "LEFT JOIN Faculty f ON s.FacultyID = f.FacultyID " +
                        "LEFT JOIN Department d ON s.departmentID = d.DepartmentID " +
                        "LEFT JOIN Courses c ON s.CourseID = c.CourseID " +
                        "WHERE s.id = ?";
            
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentID);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                student = new Student();
                
                // Set core student properties using the database column names
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                
                try {
                    student.setDob(rs.getDate("dob"));
                    student.setGender(rs.getString("gender"));
                    student.setNic(rs.getString("nic"));
                    student.setPhone(rs.getString("phone"));
                    student.setAddress(rs.getString("address"));
                    student.setEnrollmentDate(rs.getDate("enrollmentDate"));
                    student.setFacultyID(rs.getInt("FacultyID"));
                    student.setDepartmentID(rs.getInt("departmentID"));
                    student.setCourseID(rs.getInt("CourseID"));
                    student.setRegistrationDate(rs.getDate("RegistrationDate"));
                    
                    // Set faculty, department, and course names
                    student.setFacultyName(rs.getString("FacultyName"));
                    student.setDepartmentName(rs.getString("DepartmentName"));
                    student.setCourseName(rs.getString("CourseName"));
                } catch (SQLException e) {
                    LOGGER.log(Level.WARNING, "Some student fields could not be loaded: {0}", e.getMessage());
                }
                
                // Set dashboard information
                setDashboardInfo(student, conn);
            }
            
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL error retrieving student by ID", e);
        } finally {
            closeResources(rs, stmt, conn);
        }
        
        return student;
    }
    
    /**
     * Updates student profile information
     * 
     * @param student Student object with updated information
     * @return true if update successful, false otherwise
     */
    public boolean updateProfile(Student student) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = Database.getConnection();
            if (conn == null) {
                LOGGER.severe("Failed to obtain database connection");
                return false;
            }
            
            // Updated table name and column names
            String sql = "UPDATE student SET name = ?, dob = ?, phone = ? WHERE id = ?";
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, student.getName());
            stmt.setDate(2, new java.sql.Date(student.getDob().getTime()));
            stmt.setString(3, student.getPhone());
            stmt.setInt(4, student.getId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating student profile", e);
            return false;
        } finally {
            closeResources(null, stmt, conn);
        }
    }
    
    /**
     * Utility method to close database resources
     */
    private void closeResources(ResultSet rs, PreparedStatement stmt, Connection conn) {
        try {
            if (rs != null) rs.close();
        } catch (SQLException e) {
            LOGGER.log(Level.WARNING, "Error closing ResultSet", e);
        }
        
        try {
            if (stmt != null) stmt.close();
        } catch (SQLException e) {
            LOGGER.log(Level.WARNING, "Error closing PreparedStatement", e);
        }
        
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            LOGGER.log(Level.WARNING, "Error closing Connection", e);
        }
    }
    
    /**
     * Checks if an email already exists in the database
     * 
     * @param email The email to check
     * @return true if email exists, false otherwise
     */
    public boolean isEmailExists(String email) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = Database.getConnection();
            // Updated table name and column name
            String sql = "SELECT COUNT(*) FROM student WHERE email = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking email existence", e);
        } finally {
            closeResources(rs, stmt, conn);
        }
        
        return false;
    }

    /**
     * Checks if a NIC already exists in the database
     * 
     * @param nic The NIC to check
     * @return true if NIC exists, false otherwise
     */
    public boolean isNicExists(String nic) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = Database.getConnection();
            // Updated table name and column name
            String sql = "SELECT COUNT(*) FROM student WHERE nic = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, nic);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking NIC existence", e);
        } finally {
            closeResources(rs, stmt, conn);
        }
        
        return false;
    }

    /**
     * Adds a new student to the database
     * 
     * @param student The Student object to add
     * @return true if student added successfully, false otherwise
     */
    public boolean addStudent(Student student) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = Database.getConnection();
            // Updated column names to match database schema
            String sql = "INSERT INTO student (name, dob, gender, nic, email, phone, address, " +
                         "enrollmentDate, FacultyID, departmentID, CourseID, password) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, student.getName());
            stmt.setDate(2, new java.sql.Date(student.getDob().getTime()));
            stmt.setString(3, student.getGender());
            stmt.setString(4, student.getNic());
            stmt.setString(5, student.getEmail());
            stmt.setString(6, student.getPhone());
            stmt.setString(7, student.getAddress());
            stmt.setDate(8, new java.sql.Date(student.getEnrollmentDate().getTime()));
            stmt.setInt(9, student.getFacultyID());
            stmt.setInt(10, student.getDepartmentID());
            stmt.setInt(11, student.getCourseID());
            stmt.setString(12, student.getPassword());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error adding student", e);
        } finally {
            closeResources(null, stmt, conn);
        }
        
        return false;
    }

    /**
     * Updates a student's profile with all available fields
     * 
     * @param student The Student object with updated information
     * @return true if update successful, false otherwise
     */
    public boolean updateStudentProfile(Student student) {
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = Database.getConnection();
            if (conn == null) {
                LOGGER.severe("Failed to obtain database connection");
                return false;
            }
            
            // Updated table name and column names
            String sql = "UPDATE student SET name = ?, dob = ?, gender = ?, " +
                         "nic = ?, email = ?, phone = ?, address = ?, " +
                         "FacultyID = ?, departmentID = ?, CourseID = ? " +
                         "WHERE id = ?";
            
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, student.getName());
            stmt.setDate(2, new java.sql.Date(student.getDob().getTime()));
            stmt.setString(3, student.getGender());
            stmt.setString(4, student.getNic());
            stmt.setString(5, student.getEmail());
            stmt.setString(6, student.getPhone());
            stmt.setString(7, student.getAddress());
            stmt.setInt(8, student.getFacultyID());
            stmt.setInt(9, student.getDepartmentID());
            stmt.setInt(10, student.getCourseID());
            stmt.setInt(11, student.getId());
            
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating student profile", e);
            return false;
        } finally {
            closeResources(null, stmt, conn);
        }
    }

    public boolean updateStudent(Student student) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<Student> getAllStudents() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
//conflict must be resolved
package com.DAO;
import com.model.Student;
import com.util.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StudentDAO {

    private static final Logger LOGGER = Logger.getLogger(StudentDAO.class.getName());

    // Default constructor
    public StudentDAO() {
        // No setup needed if using Database.getConnection() directly
    }

    // Optional constructor if you want to pass a Connection (not used in current methods)
    public StudentDAO(Connection conn) {
        // Could be used if you plan to inject the connection
    }

    // Check if email already exists
    public boolean checkEmailExists(String email) {
        boolean exists = false;
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT id FROM students WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            exists = rs.next();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking email existence", e);
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exists;
    }

    // Check if name already exists
    public boolean isNameExists(String name) {
        boolean exists = false;
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT id FROM students WHERE name = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            exists = rs.next();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking name existence", e);
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exists;
    }

    // Check if NIC already exists
    public boolean isNicExists(String nic) {
        boolean exists = false;
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT id FROM students WHERE nic = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, nic);
            ResultSet rs = ps.executeQuery();
            exists = rs.next();
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking NIC existence", e);
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exists;
    }

    // Register new student
    public boolean registerStudent(Student student) {
        boolean success = false;
        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO students (name, dob, gender, nic, email, phone, address, enrollmentDate, facultyName, departmentID, password, status) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, student.getName());
            stmt.setDate(2, student.getDob());
            stmt.setString(3, student.getGender());
            stmt.setString(4, student.getNic());
            stmt.setString(5, student.getEmail());
            stmt.setString(6, student.getPhone());
            stmt.setString(7, student.getAddress());
            stmt.setDate(8, student.getEnrollmentDate());
            stmt.setString(9, student.getFacultyName());
            stmt.setInt(10, student.getDepartmentID());
            stmt.setString(11, student.getPassword());
            stmt.setString(12, student.getStatus());

            success = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error registering student", e);
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return success;
    }

    // Update basic student profile
    public void updateStudentProfile(Student student) {
        try (Connection conn = Database.getConnection()) {
            String sql = "UPDATE students SET name = ?, email = ?, phone = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, student.getName());
            stmt.setString(2, student.getEmail());
            stmt.setString(3, student.getPhone());
            stmt.setInt(4, student.getId());

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                LOGGER.info("Student profile updated successfully.");
            } else {
                LOGGER.log(Level.WARNING, "No student found with ID {0}", student.getId());
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating student profile", e);
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Update full student record
    public boolean updateStudent(Student student) {
        boolean success = false;
        try (Connection conn = Database.getConnection()) {
            String sql = "UPDATE students SET name = ?, dob = ?, gender = ?, nic = ?, email = ?, phone = ?, address = ?, enrollmentDate = ?, facultyName = ?, departmentID = ?, password = ?, status = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, student.getName());
            stmt.setDate(2, student.getDob());
            stmt.setString(3, student.getGender());
            stmt.setString(4, student.getNic());
            stmt.setString(5, student.getEmail());
            stmt.setString(6, student.getPhone());
            stmt.setString(7, student.getAddress());
            stmt.setDate(8, student.getEnrollmentDate());
            stmt.setString(9, student.getFacultyName());
            stmt.setInt(10, student.getDepartmentID());
            stmt.setString(11, student.getPassword());
            stmt.setString(12, student.getStatus());
            stmt.setInt(13, student.getId());

            success = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating student", e);
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return success;
    }

    // Get student by ID
    public Student getStudentById(int studentID) {
        Student student = null;
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT * FROM students WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setDob(rs.getDate("dob"));
                student.setGender(rs.getString("gender"));
                student.setNic(rs.getString("nic"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setAddress(rs.getString("address"));
                student.setEnrollmentDate(rs.getDate("enrollmentDate"));
                student.setFacultyName(rs.getString("facultyName"));
                student.setDepartmentID(rs.getInt("departmentID"));
                student.setPassword(rs.getString("password"));
                student.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error fetching student by ID", e);
        } catch (Exception ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return student;
    }
}

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
import java.util.logging.Level;
import java.util.logging.Logger;

public class StudentDAO {

    private static final Logger LOGGER = Logger.getLogger(StudentDAO.class.getName());

    public StudentDAO(Connection conn) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public StudentDAO() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    // Check if email already exists
    public boolean checkEmailExists(String email) {
        boolean exists = false;
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT id FROM students WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            // Check if a row is returned
            if (rs.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking email existence", e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error", e);
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

            // Check if a row is returned
            if (rs.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking name existence", e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error", e);
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

            // Check if a row is returned
            if (rs.next()) {
                exists = true;
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error checking NIC existence", e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error", e);
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

            // Set parameters for the insert
            stmt.setString(1, student.getName());
            stmt.setDate(2, student.getDob()); // java.sql.Date
            stmt.setString(3, student.getGender());
            stmt.setString(4, student.getNic());
            stmt.setString(5, student.getEmail());
            stmt.setString(6, student.getPhone());
            stmt.setString(7, student.getAddress());
            stmt.setDate(8, student.getEnrollmentDate()); // java.sql.Date
            stmt.setString(9, student.getFacultyName());
            stmt.setInt(10, student.getDepartmentID());
            stmt.setString(11, student.getPassword());
            stmt.setString(12, student.getStatus());

            success = stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error registering student", e);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error", e);
        }

        return success;
    }

    // Update student profile
    public void updateStudentProfile(Student student) {
        try (Connection conn = Database.getConnection()) {
            String sql = "UPDATE students SET name = ?, email = ?, phone = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);

            // Set the parameters for the update
            stmt.setString(1, student.getName());
            stmt.setString(2, student.getEmail());
            stmt.setString(3, student.getPhone());
            stmt.setInt(4, student.getId());

            // Execute the update
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                LOGGER.info("Student profile updated successfully.");
            } else {
                LOGGER.warning("No student found with ID " + student.getId());
            }

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error updating student profile", e);
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Unexpected error", ex);
        }
    }

    public boolean updateStudent(Student student) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Student getStudentById(int studentID) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

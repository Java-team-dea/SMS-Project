/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.Student;
import com.util.Database;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class StudentDAO {

    private static final Logger LOGGER = Logger.getLogger(StudentDAO.class.getName());

    // Check if email already exists
    public boolean checkEmailExists(String email) {
        String sql = "SELECT id FROM students WHERE email = ?";
        try (Connection conn = Database.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            return ps.executeQuery().next();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking email", e);
            return false;
        }
    }

    // Other check methods
    public boolean isNameExists(String name) {
        return checkExistence("name", name);
    }

    public boolean isNicExists(String nic) {
        return checkExistence("nic", nic);
    }

    private boolean checkExistence(String field, String value) {
        String sql = "SELECT id FROM students WHERE " + field + " = ?";
        try (Connection conn = Database.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, value);
            return ps.executeQuery().next();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking " + field, e);
            return false;
        }
    }

    // Register new student
    public boolean registerStudent(Student student) {
        String sql = "INSERT INTO students (name, dob, gender, nic, email, phone, address, enrollmentDate, facultyName, departmentID, password, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

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

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error registering student", e);
            return false;
        }
    }

    // Full update
    public boolean updateStudent(Student student) {
        String sql = "UPDATE students SET name=?, dob=?, gender=?, nic=?, email=?, phone=?, address=?, enrollmentDate=?, facultyName=?, departmentID=?, password=?, status=? WHERE id=?";
        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

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

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating student", e);
            return false;
        }
    }

    // Partial update for profile (only name, email, and phone)
    public boolean updateStudentProfile(Student student) {
        String sql = "UPDATE students SET name = ?, email = ?, phone = ? WHERE id = ?";
        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, student.getName());
            stmt.setString(2, student.getEmail());
            stmt.setString(3, student.getPhone());
            stmt.setInt(4, student.getId());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating student profile", e);
            return false;
        }
    }

    // Get student by ID
    public Student getStudentById(int id) {
        String sql = "SELECT * FROM students WHERE id=?";
        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setDob(rs.getDate("dob"));
                s.setGender(rs.getString("gender"));
                s.setNic(rs.getString("nic"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setAddress(rs.getString("address"));
                s.setEnrollmentDate(rs.getDate("enrollmentDate"));
                s.setFacultyName(rs.getString("facultyName"));
                s.setDepartmentID(rs.getInt("departmentID"));
                s.setPassword(rs.getString("password"));
                s.setStatus(rs.getString("status"));
                return s;
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving student by ID", e);
        }
        return null;
    }

    // ✅ Check if name is taken by another student
    public boolean isNameTakenByOthers(String name, int studentId) {
        String sql = "SELECT id FROM students WHERE name = ? AND id != ?";
        try (Connection conn = Database.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, name);
            ps.setInt(2, studentId);
            return ps.executeQuery().next();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking duplicate name", e);
            return false;
        }
    }

    // ✅ Check if phone is taken by another student
    public boolean isPhoneTakenByOthers(String phone, int studentId) {
        String sql = "SELECT id FROM students WHERE phone = ? AND id != ?";
        try (Connection conn = Database.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, phone);
            ps.setInt(2, studentId);
            return ps.executeQuery().next();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking duplicate phone", e);
            return false;
        }
    }

    // ✅ Check if email is taken by another student
    public boolean isEmailTakenByOthers(String email, int studentId) {
        String sql = "SELECT id FROM students WHERE email = ? AND id != ?";
        try (Connection conn = Database.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setInt(2, studentId);
            return ps.executeQuery().next();
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error checking duplicate email", e);
            return false;
        }
    }
}

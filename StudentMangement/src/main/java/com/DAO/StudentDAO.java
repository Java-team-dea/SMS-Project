/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.model.Student;
import com.util.Database;

public class StudentDAO {

    // Check if email already exists
    public boolean checkEmailExists(String email) {
        boolean exists = false;
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT id FROM students WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            exists = rs.next();
        } catch (Exception e) {
            e.printStackTrace();
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
        } catch (Exception e) {
            e.printStackTrace();
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }

    // Register new student
    public boolean registerStudent(Student student) {
        boolean success = false;

        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO students (name, dob, gender, nic, email, phone, address, enrollmentDate, facultyName, departmentID, password, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, student.getName());
            stmt.setString(2, student.getDob());
            stmt.setString(3, student.getGender());
            stmt.setString(4, student.getNic());
            stmt.setString(5, student.getEmail());
            stmt.setString(6, student.getPhone());
            stmt.setString(7, student.getAddress());
            stmt.setString(8, student.getEnrollmentDate());
            stmt.setString(9, student.getFacultyName());
            stmt.setInt(10, student.getDepartmentID());
            stmt.setString(11, student.getPassword());
            stmt.setString(12, student.getStatus());

            success = stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}

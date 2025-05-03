/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.Student;
import com.util.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class StudentDAO {
    public boolean registerStudent(Student student) {
        boolean result = false;
        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO students (name, dob, gender, nic, email, phone, address, " +
                         "enrollmentDate, facultyName, departmentID, password, status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, student.getName());
            ps.setDate(2, new java.sql.Date(student.getDob().getTime()));
            ps.setString(3, student.getGender());
            ps.setString(4, student.getNic());
            ps.setString(5, student.getEmail());
            ps.setString(6, student.getPhone());
            ps.setString(7, student.getAddress());
            ps.setDate(8, new java.sql.Date(student.getEnrollmentDate().getTime()));
            ps.setString(9, student.getFacultyName());
            ps.setInt(10, student.getDepartmentID());
            ps.setString(11, student.getPassword());

            // Set status to "inactive" by default
            ps.setString(12, "inactive");

            result = ps.executeUpdate() > 0;
        } catch (Exception e) {
            // Good practice: log errors during development
            
        }
        return result;
    }
}

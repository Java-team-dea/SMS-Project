/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.Attendance;
import com.util.Database;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author oshee
 */
public class AttendanceDAO {

    public ArrayList<Attendance> AttendanceList() {
        System.out.println("attendance list");
        try {

            ArrayList<Attendance> list = new ArrayList<>();
            String sql = "select id, CourseID, status, date from attendance";
            Statement statement = Database.getConnection().createStatement();

            //Connection conn = Database.getConnection();
            //PreparedStatement stmt = statement
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()) {
                Attendance a = new Attendance();
                a.setStudentId(rs.getInt("id"));
                a.setCourseId(rs.getInt("CourseID"));
                a.setAttendanceStatus(rs.getString("status"));
                a.setDate(rs.getString("date"));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean markAttendance(Attendance attendance) {
        boolean success = false;

        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO attendance (id, CourseID , status) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, attendance.getStudentId());
            stmt.setInt(2, attendance.getCourseId());
            stmt.setString(3, attendance.getAttendanceStatus());

            int rows = stmt.executeUpdate();
            success = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

}

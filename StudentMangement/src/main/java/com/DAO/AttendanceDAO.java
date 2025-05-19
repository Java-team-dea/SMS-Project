/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.model.Attendance;
import com.util.Database;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Data Access Object for Attendance records
 */
public class AttendanceDAO {
    
    /**
     * Marks attendance for a student
     * @param attendance The attendance record to add
     * @return true if successful, false otherwise
     */
    public boolean markAttendance(Attendance attendance) {
        boolean success = false;

        try (Connection conn = Database.getConnection()) {
            String sql = "INSERT INTO attendance (id, moduleid, status) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, attendance.getStudentId());
            stmt.setString(2, attendance.getModuleid());
            stmt.setString(3, attendance.getAttendanceStatus());

            int rows = stmt.executeUpdate();
            success = rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return success;
    }
    
    /**
     * Gets all attendance records
     * @return ArrayList of all attendance records
     */
    public ArrayList<Attendance> getAllAttendanceRecords() {
        ArrayList<Attendance> list = new ArrayList<>();
        
        try (Connection conn = Database.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT attendance_id, id, moduleid, status, date FROM attendance")) {
            
            while (rs.next()) {
                Attendance a = new Attendance();
                a.setAttendanceId(rs.getInt("attendance_id"));
                a.setStudentId(rs.getInt("id"));
                a.setModuleid(rs.getString("moduleid"));
                a.setAttendanceStatus(rs.getString("status"));
                a.setDate(rs.getTimestamp("date"));
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    /**
     * Gets attendance records for a specific student
     * @param studentId The student's ID
     * @return List of attendance records for the student
     */
    public List<Attendance> getAttendanceByStudentId(int studentId) {
        List<Attendance> list = new ArrayList<>();
        
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT attendance_id, id, moduleid, status, date FROM attendance WHERE id = ? ORDER BY date DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Attendance a = new Attendance();
                    a.setAttendanceId(rs.getInt("attendance_id"));
                    a.setStudentId(rs.getInt("id"));
                    a.setModuleid(rs.getString("moduleid"));
                    a.setAttendanceStatus(rs.getString("status"));
                    a.setDate(rs.getTimestamp("date"));
                    list.add(a);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    /**
     * Gets filtered attendance records for a student
     * @param studentId The student's ID
     * @param searchQuery Search term for module or date
     * @param statusFilter Filter for attendance status
     * @param page The page number for pagination
     * @param recordsPerPage Number of records per page
     * @return List of filtered attendance records
     */
    public List<Attendance> getFilteredAttendance(int studentId, String searchQuery, String statusFilter, int page, int recordsPerPage) {
        List<Attendance> list = new ArrayList<>();
        int offset = (page - 1) * recordsPerPage;
        
        try (Connection conn = Database.getConnection()) {
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT attendance_id, id, moduleid, status, date FROM attendance WHERE id = ?");
            
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                sqlBuilder.append(" AND (moduleid LIKE ? OR DATE_FORMAT(date, '%Y-%m-%d') LIKE ?)");
            }
            
            if (statusFilter != null && !statusFilter.trim().isEmpty()) {
                sqlBuilder.append(" AND status = ?");
            }
            
            sqlBuilder.append(" ORDER BY date DESC LIMIT ? OFFSET ?");
            
            PreparedStatement stmt = conn.prepareStatement(sqlBuilder.toString());
            int paramIndex = 1;
            
            stmt.setInt(paramIndex++, studentId);
            
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                String searchParam = "%" + searchQuery.trim() + "%";
                stmt.setString(paramIndex++, searchParam);
                stmt.setString(paramIndex++, searchParam);
            }
            
            if (statusFilter != null && !statusFilter.trim().isEmpty()) {
                stmt.setString(paramIndex++, statusFilter);
            }
            
            stmt.setInt(paramIndex++, recordsPerPage);
            stmt.setInt(paramIndex, offset);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Attendance a = new Attendance();
                    a.setAttendanceId(rs.getInt("attendance_id"));
                    a.setStudentId(rs.getInt("id"));
                    a.setModuleid(rs.getString("moduleid"));
                    a.setAttendanceStatus(rs.getString("status"));
                    a.setDate(rs.getTimestamp("date"));
                    list.add(a);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    /**
     * Counts total filtered attendance records for pagination
     * @param studentId The student's ID
     * @param searchQuery Search term for module or date
     * @param statusFilter Filter for attendance status
     * @return Total count of filtered records
     */
    public int countFilteredAttendance(int studentId, String searchQuery, String statusFilter) {
        int count = 0;
        
        try (Connection conn = Database.getConnection()) {
            StringBuilder sqlBuilder = new StringBuilder();
            sqlBuilder.append("SELECT COUNT(*) FROM attendance WHERE id = ?");
            
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                sqlBuilder.append(" AND (moduleid LIKE ? OR DATE_FORMAT(date, '%Y-%m-%d') LIKE ?)");
            }
            
            if (statusFilter != null && !statusFilter.trim().isEmpty()) {
                sqlBuilder.append(" AND status = ?");
            }
            
            PreparedStatement stmt = conn.prepareStatement(sqlBuilder.toString());
            int paramIndex = 1;
            
            stmt.setInt(paramIndex++, studentId);
            
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                String searchParam = "%" + searchQuery.trim() + "%";
                stmt.setString(paramIndex++, searchParam);
                stmt.setString(paramIndex++, searchParam);
            }
            
            if (statusFilter != null && !statusFilter.trim().isEmpty()) {
                stmt.setString(paramIndex, statusFilter);
            }
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return count;
    }
    
    /**
     * Counts attendance by status for a student
     * @param studentId The student's ID
     * @param status The attendance status to count
     * @return Count of records with specified status
     */
    public int countAttendanceByStatus(int studentId, String status) {
        int count = 0;
        
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT COUNT(*) FROM attendance WHERE id = ? AND status = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentId);
            stmt.setString(2, status);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return count;
    }
    
    /**
     * Gets total attendance records for a student
     * @param studentId The student's ID
     * @return Total count of attendance records
     */
    public int getTotalAttendanceCount(int studentId) {
        int count = 0;
        
        try (Connection conn = Database.getConnection()) {
            String sql = "SELECT COUNT(*) FROM attendance WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return count;
    }
    
    /**
     * Deletes an attendance record
     * @param studentId The student's ID
     * @param moduleid The module ID
     * @param dateStr The date string
     * @return true if successful, false otherwise
     */
    public boolean deleteAttendance(int studentId, String moduleid, String dateStr) {
        boolean success = false;
        
        try (Connection conn = Database.getConnection()) {
            String sql = "DELETE FROM attendance WHERE id = ? AND moduleid = ? AND DATE_FORMAT(date, '%Y-%m-%d %H:%i') = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, studentId);
            stmt.setString(2, moduleid);
            stmt.setString(3, dateStr);
            
            int rows = stmt.executeUpdate();
            success = rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return success;
    }
    
    /**
     * Updates an attendance record
     * @param attendanceId The attendance ID
     * @param status The new status
     * @return true if successful, false otherwise
     */
    public boolean updateAttendanceStatus(int attendanceId, String status) {
        boolean success = false;
        
        try (Connection conn = Database.getConnection()) {
            String sql = "UPDATE attendance SET status = ? WHERE attendance_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, status);
            stmt.setInt(2, attendanceId);
            
            int rows = stmt.executeUpdate();
            success = rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return success;
    }

    /**
     * Gets all attendance records for display in list format
     * @return ArrayList of all attendance records
     */
    public ArrayList<Attendance> AttendanceList() {
        ArrayList<Attendance> list = new ArrayList<>();
        
        try (Connection conn = Database.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT attendance_id, id, moduleid, status, date FROM attendance ORDER BY date DESC")) {
            
            while (rs.next()) {
                Attendance a = new Attendance();
                a.setAttendanceId(rs.getInt("attendance_id"));
                a.setStudentId(rs.getInt("id"));
                a.setModuleid(rs.getString("moduleid"));
                a.setAttendanceStatus(rs.getString("status"));
                a.setDate(rs.getTimestamp("date"));
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(AttendanceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
}
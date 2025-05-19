/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * Model class representing student attendance records
 */
public class Attendance {
    private int attendanceId;
    private int studentId;
    private String moduleid;
    private String attendanceStatus;
    private Timestamp date;
    
    // Default constructor
    public Attendance() {
    }
    
    // Parameterized constructor
    public Attendance(int studentId, String moduleid, String attendanceStatus) {
        this.studentId = studentId;
        this.moduleid = moduleid;
        this.attendanceStatus = attendanceStatus;
    }
    
    // Full constructor
    public Attendance(int attendanceId, int studentId, String moduleid, String attendanceStatus, Timestamp date) {
        this.attendanceId = attendanceId;
        this.studentId = studentId;
        this.moduleid = moduleid;
        this.attendanceStatus = attendanceStatus;
        this.date = date;
    }
    
    // Getters and Setters
    public int getAttendanceId() {
        return attendanceId;
    }
    
    public void setAttendanceId(int attendanceId) {
        this.attendanceId = attendanceId;
    }
    
    public int getStudentId() {
        return studentId;
    }
    
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }
    
    public String getModuleid() {
        return moduleid;
    }
    
    public void setModuleid(String moduleid) {
        this.moduleid = moduleid;
    }
    
    public String getAttendanceStatus() {
        return attendanceStatus;
    }
    
    public void setAttendanceStatus(String attendanceStatus) {
        this.attendanceStatus = attendanceStatus;
    }
    
    public Timestamp getDate() {
        return date;
    }
    
    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    // Helper method to get formatted date string
    public String getFormattedDate() {
        if (date == null) {
            return "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return sdf.format(date);
    }
    
    @Override
    public String toString() {
        return "Attendance{" +
                "attendanceId=" + attendanceId +
                ", studentId=" + studentId +
                ", moduleid='" + moduleid + '\'' +
                ", attendanceStatus='" + attendanceStatus + '\'' +
                ", date=" + date +
                '}';
    }
    
    // Fixed implementations of these methods to avoid UnsupportedOperationException
    public void setStatus(String status) {
        this.attendanceStatus = status;
    }
    
    public String getStatus() {
        return this.attendanceStatus;
    }
}
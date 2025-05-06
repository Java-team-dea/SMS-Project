/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

import java.sql.Date;

public class Student {
    private int id;
    private String name;
    private Date dob;
    private String gender;
    private String nic;
    private String email;
    private String phone;
    private String address;
    private Date enrollmentDate;
    private String facultyName;
    private int departmentID;
    private String password;
    private String status; // 'active' or 'inactive'

    private double gpa;
    private int coursesCount;
    private double outstandingFees;

    // Getters and Setters

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() { 
        return name; 
    }
    public void setName(String name) { 
        this.name = name; 
    }

    public Date getDob() { 
        return dob; 
    }
    public void setDob(Date dob) { 
        this.dob = dob; 
    }

    public String getGender() { 
        return gender; 
    }
    public void setGender(String gender) { 
        this.gender = gender; 
    }

    public String getNic() { 
        return nic; 
    }
    public void setNic(String nic) { 
        this.nic = nic; 
    }

    public String getEmail() { 
        return email; 
    }
    public void setEmail(String email) { 
        this.email = email; 
    }

    public String getPhone() { 
        return phone; 
    }
    public void setPhone(String phone) { 
        this.phone = phone; 
    }

    public String getAddress() { 
        return address; 
    }
    public void setAddress(String address) { 
        this.address = address; 
    }

    public Date getEnrollmentDate() { 
        return enrollmentDate; 
    }
    public void setEnrollmentDate(Date enrollmentDate) { 
        this.enrollmentDate = enrollmentDate; 
    }

    public String getFacultyName() { 
        return facultyName; 
    }
    public void setFacultyName(String facultyName) { 
        this.facultyName = facultyName; 
    }

    public int getDepartmentID() { 
        return departmentID; 
    }
    public void setDepartmentID(int departmentID) { 
        this.departmentID = departmentID; 
    }

    public String getPassword() { 
        return password; 
    }
    public void setPassword(String password) { 
        this.password = password; 
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        if (status == null || status.isEmpty()) {
            this.status = "inactive";
        } else {
            this.status = status;
        }
    }

    public double getGpa() {
        return gpa;
    }
    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    public int getCoursesCount() {
        return coursesCount;
    }
    public void setCoursesCount(int coursesCount) {
        this.coursesCount = coursesCount;
    }

    public double getOutstandingFees() {
        return outstandingFees;
    }
    public void setOutstandingFees(double outstandingFees) {
        this.outstandingFees = outstandingFees;
    }

    public void setDepartmentID(String departmentID) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void setEnrollmentDate(String enrollmentDate) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void setDob(String dob) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void setStudentID(int studentID) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

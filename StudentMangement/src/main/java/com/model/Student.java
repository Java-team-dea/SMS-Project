/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

import java.util.Date;

/**
 * Student model class representing the Student table in the database
 * with additional properties for dashboard display
 */
public class Student {
    // Core database properties
    private int id;  // Changed from studentID to id to match DB
    private String name;
    private Date dob;  // Changed from dateOfBirth to dob to match DB
    private String gender;
    private String nic;
    private String email;
    private String phone;
    private String address;
    private Date enrollmentDate;
    private int facultyID;
    private int departmentID;
    private int courseID;
    private String password;
    private Date registrationDate;
    
    // Additional properties for dashboard display
    private int coursesCount;    // Number of courses enrolled
    private double gpa;          // Current GPA
    private String outstandingFees; // Outstanding fees (formatted as currency)
    
    // Additional display properties
    private String facultyName;  // Faculty name for display purposes
    private String departmentName; // Department name for display purposes
    private String courseName;   // Course name for display purposes

    // Default constructor
    public Student() {
    }

    // Parameterized constructor
    public Student(String name, Date dob, String gender, String nic, String email, String phone,
                  String address, Date enrollmentDate, int facultyID, int departmentID, int courseID, String password) {
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.nic = nic;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.enrollmentDate = enrollmentDate;
        this.facultyID = facultyID;
        this.departmentID = departmentID;
        this.courseID = courseID;
        this.password = password;
    }

    // Getters and Setters for core properties
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

    public int getFacultyID() {
        return facultyID;
    }

    public void setFacultyID(int facultyID) {
        this.facultyID = facultyID;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    // Getters and Setters for dashboard display properties
    public int getCoursesCount() {
        return coursesCount;
    }

    public void setCoursesCount(int coursesCount) {
        this.coursesCount = coursesCount;
    }

    public double getGpa() {
        return gpa;
    }

    public void setGpa(double gpa) {
        this.gpa = gpa;
    }

    public String getOutstandingFees() {
        return outstandingFees;
    }

    public void setOutstandingFees(String outstandingFees) {
        this.outstandingFees = outstandingFees;
    }
    
    // Getters and setters for display properties
    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", enrollmentDate=" + enrollmentDate +
                ", facultyID=" + facultyID +
                ", facultyName='" + facultyName + '\'' +
                ", departmentID=" + departmentID +
                ", departmentName='" + departmentName + '\'' +
                ", courseID=" + courseID +
                ", courseName='" + courseName + '\'' +
                ", coursesCount=" + coursesCount +
                ", gpa=" + gpa +
                ", outstandingFees='" + outstandingFees + '\'' +
                '}';
    }
    
    // For backward compatibility
    public int getStudentID() {
        return id;
    }

    public void setStudentID(int studentID) {
        this.id = studentID;
    }
    
    public Date getDateOfBirth() {
        return dob;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dob = dateOfBirth;
    }
 
public boolean hasCourse() {
    return this.courseID > 0;
}
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 * Model class representing a Course in the system
 */
public class Courses {
    private String name;
    private String description;
    private int credits;
    private int courseID;
    private int duration;
    private int departmentID;
    private String departmentName;  // New field for department name

    // Default constructor
    public Courses() {
    }

    // Parameterized constructor
    public Courses(String name, String description, int credits, int duration, 
                  int departmentID, String departmentName) {
        this.name = name;
        this.description = description;
        this.credits = credits;
        this.duration = duration;
        this.departmentID = departmentID;
        this.departmentName = departmentName;
    }

    // Getters and Setters

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCredits() {
        return credits;
    }

    public void setCredits(int credits) {
        this.credits = credits;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    @Override
    public String toString() {
        return "Courses{" +
                "name='" + name + '\'' +
                ", courseID=" + courseID +
                ", departmentID=" + departmentID +
                ", departmentName='" + departmentName + '\'' +
                '}';
    }
}


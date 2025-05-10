/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author dilshan
 */
public class Courses {
    
    private String Name;
    private String Description;
    private int Credits;
    private int CourseID;
    private int Duration;
    private int departmentID;
;

    /**
     * @return the Name
     */
    public String getName() {
        return Name;
    }

    /**
     * @param Name the Name to set
     */
    public void setName(String Name) {
        this.Name = Name;
    }

    /**
     * @return the Description
     */
    public String getDescription() {
        return Description;
    }

    /**
     * @param Description the Description to set
     */
    public void setDescription(String Description) {
        this.Description = Description;
    }

    /**
     * @return the Credits
     */
    public int getCredits() {
        return Credits;
    }

    /**
     * @param Credits the Credits to set
     */
    public void setCredits(int Credits) {
        this.Credits = Credits;
    }

    /**
     * @return the Duration
     */
    public int getDuration() {
        return Duration;
    }

    /**
     * @param Duration the Duration to set
     */
    public void setDuration(int Duration) {
        this.Duration = Duration;
    }

    /**
     * @return the departmentID
     */
    public int getDepartmentID() {
        return departmentID;
    }

    /**
     * @param departmentID the departmentID to set
     */
    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    /**
     * @return the CourseID
     */
    public int getCourseID() {
        return CourseID;
    }

    /**
     * @param CourseID the CourseID to set
     */
    public void setCourseID(int CourseID) {
        this.CourseID = CourseID;
    }

    
    
}

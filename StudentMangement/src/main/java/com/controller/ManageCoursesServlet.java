/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.CourseDAO;
import com.model.Courses;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ManageCoursesServlet extends HttpServlet {

   


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
           
        String courseName = request.getParameter("courseName");
        int department = Integer.parseInt(request.getParameter("department"));
        int credits = Integer.parseInt(request.getParameter("credits"));
        String description = request.getParameter("description");
        int duration = Integer.parseInt(request.getParameter("duration"));
        
        
        
        Courses course = new Courses();
            
            course.setName(courseName);
            course.setDepartmentID(department);
            course.setCredits(credits);
            course.setDescription(description);
            course.setDuration(duration);
        
        CourseDAO coursedao= new CourseDAO();
        try {
            coursedao.addCourses(course);
            
             request.setAttribute("successMessage", "Course added successfully!");
        
            
            
             RequestDispatcher dispacher=request.getRequestDispatcher("courseList.jsp");
         dispacher.forward(request, response);
            
            
        } catch (Exception ex) {
           
            
            
             request.setAttribute("errorMessage", "Error adding course: " + ex.getMessage());
        RequestDispatcher dispacher = request.getRequestDispatcher("courseList.jsp");
        dispacher.forward(request, response);
        }
        
    }

}

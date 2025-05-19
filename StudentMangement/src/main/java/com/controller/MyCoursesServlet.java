/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.CourseDAO;
import com.model.Courses;
import com.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/MyCoursesServlet")
public class MyCoursesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        
        // Check if student is logged in
        if (student == null) {
            response.sendRedirect("studentLogin.jsp");
            return;
        }
        
        try {
            // Debug student information
            System.out.println("DEBUG: Student ID: " + student.getId());
            System.out.println("DEBUG: Student CourseID: " + student.getCourseID());
            
            // Get the student's enrolled course with department info
            CourseDAO courseDAO = new CourseDAO();
            Courses enrolledCourse = courseDAO.getCourseById(student.getCourseID());
            
            if (enrolledCourse == null) {
                System.out.println("DEBUG: No course found for CourseID: " + student.getCourseID());
                request.setAttribute("enrolledCourse", null);
                request.getRequestDispatcher("myCourses.jsp").forward(request, response);
                return;
            }
            
            System.out.println("DEBUG: Found course: " + enrolledCourse.getName());
            
            // Set attributes for JSP
            request.setAttribute("enrolledCourse", enrolledCourse);
            
            // Debug final values being sent to JSP
            System.out.println("DEBUG: Sending to JSP - Course: " + enrolledCourse.getName());
            System.out.println("DEBUG: Sending to JSP - Department: " + enrolledCourse.getDepartmentName());
            
            // Forward to myCourses.jsp
            request.getRequestDispatcher("myCourses.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("ERROR in MyCoursesServlet:");
            e.printStackTrace();
            
            // Set error message
            request.setAttribute("errorMessage", "Error retrieving course information: " + e.getMessage());
            
            // Forward to error page
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
package com.controller;

import com.DAO.CourseDAO;
import com.model.Courses;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateCourseServlet", urlPatterns = {"/UpdateCourseServlet"})
public class UpdateCourseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // Parse parameters
            int courseId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("courseName");
            String description = request.getParameter("description");
            int credits = Integer.parseInt(request.getParameter("credits"));
            int duration = Integer.parseInt(request.getParameter("duration"));
            int departmentId = Integer.parseInt(request.getParameter("departmentID"));
            
            // Create and populate course object
            Courses course = new Courses();
            course.setCourseID(courseId);
            course.setName(name);
            course.setDescription(description);
            course.setCredits(credits);
            course.setDuration(duration);
            course.setDepartmentID(departmentId);
            
            // Update in database
            CourseDAO courseDAO = new CourseDAO();
            boolean success = courseDAO.updateCourse(course);
            
            if (success) {
                response.sendRedirect("CourseViewServlet?success=Course+updated+successfully");
            } else {
                response.sendRedirect("EditCourseServlet1?id=" + courseId + "&error=Update+failed");
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("CourseViewServlet?error=Error:" + ex.getMessage().replace(" ", "+"));
        }
    }
}
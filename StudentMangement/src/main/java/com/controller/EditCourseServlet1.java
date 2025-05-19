package com.controller;

import com.DAO.CourseDAO;
import com.model.Courses;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EditCourseServlet1", urlPatterns = {"/EditCourseServlet1"})
public class EditCourseServlet1 extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int courseId = Integer.parseInt(request.getParameter("id"));
            CourseDAO courseDAO = new CourseDAO();
            Courses course = courseDAO.getCourseById(courseId);
            
            if (course != null) {
                request.setAttribute("course", course);
                RequestDispatcher dispatcher = request.getRequestDispatcher("editCourse.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("CourseViewServlet?error=Course+not+found");
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("CourseViewServlet?error=Error+loading+course");
        }
    }
}
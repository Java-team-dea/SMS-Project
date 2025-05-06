/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.StudentDAO;
import com.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect the user to profile.jsp to view their current profile data
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        
        // Ensure a student is logged in
        if (student != null) {
            // Forward the request to the JSP page to display the profile
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            // If no student session exists, redirect to login page
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the logged-in student's session
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");

        // Retrieve the updated data from the form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        if (student != null) {
            // Update the student's details in the session object
            student.setName(name);
            student.setEmail(email);
            student.setPhone(phone);

            // Update the student's profile in the database
            StudentDAO studentDAO = new StudentDAO();
            studentDAO.updateStudentProfile(student);

            // Update the session with the latest student data
            session.setAttribute("student", student);

            // Redirect back to the profile page to show updated details
            response.sendRedirect("profile.jsp");
        } else {
            // If no student session exists, redirect to login page
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Profile servlet for updating student information";
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.StudentDAO;
import com.model.Student;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Handles student profile updates
 * Updated to be compatible with the StudentDAO implementation
 */
@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/UpdateProfileServlet"})
public class UpdateProfileServlet extends HttpServlet {
    
    private static final Logger LOGGER = Logger.getLogger(UpdateProfileServlet.class.getName());

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Student sessionStudent = (Student) session.getAttribute("student");
        
        // Security check - only allow updates if user is logged in
        if (sessionStudent == null) {
            LOGGER.log(Level.WARNING, "Update attempt without active session");
            response.sendRedirect("studentLogin.jsp");
            return;
        }
        
        try {
            // Get the student ID from the form
            String idParam = request.getParameter("id");
            int studentId = 0;
            
            try {
                if (idParam != null && !idParam.isEmpty()) {
                    studentId = Integer.parseInt(idParam);
                }
            } catch (NumberFormatException e) {
                LOGGER.log(Level.WARNING, "Invalid student ID format", e);
                session.setAttribute("errorMessage", "Invalid student ID");
                response.sendRedirect("profile.jsp");
                return;
            }
            
            // Another security check - ensure the student can only update their own profile
            // Using getId() instead of getStudentID() to match DAO implementation
            if (studentId != sessionStudent.getId()) {
                LOGGER.log(Level.WARNING, "Attempt to update different student ID. Session ID: {0}, Requested ID: {1}", 
                        new Object[]{sessionStudent.getId(), studentId});
                session.setAttribute("errorMessage", "Unauthorized operation");
                response.sendRedirect("profile.jsp");
                return;
            }
            
            // Get form parameters
            String name = request.getParameter("name");
            String dobStr = request.getParameter("dob");
            String phone = request.getParameter("phone");
            
            // Validate input data
            if (name == null || name.trim().isEmpty() || 
                dobStr == null || dobStr.trim().isEmpty() || 
                phone == null || phone.trim().isEmpty()) {
                
                session.setAttribute("errorMessage", "All fields are required");
                response.sendRedirect("profile.jsp");
                return;
            }
            
            // Parse date of birth
            Date dob = null;
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                dob = sdf.parse(dobStr);
            } catch (ParseException e) {
                LOGGER.log(Level.WARNING, "Invalid date format", e);
                session.setAttribute("errorMessage", "Invalid date format");
                response.sendRedirect("profile.jsp");
                return;
            }
            
            // Create a student object with the updated information
            // Using the property names from the DAO implementation
            Student updatedStudent = new Student();
            updatedStudent.setId(studentId); // Using setId() instead of setStudentID()
            updatedStudent.setName(name);
            updatedStudent.setDob(dob); // Using setDob() instead of setDateOfBirth()
            updatedStudent.setPhone(phone);
            
            // For logging purposes
            LOGGER.log(Level.INFO, "Attempting to update profile for student ID: {0}", studentId);
            
            // Update the student profile in the database
            StudentDAO studentDAO = new StudentDAO();
            boolean updateSuccess = studentDAO.updateProfile(updatedStudent);
            
            if (updateSuccess) {
                // Update session data with new values - using correct getter/setter names
                sessionStudent.setName(name);
                sessionStudent.setDob(dob); // Using setDob() instead of setDateOfBirth()
                sessionStudent.setPhone(phone);
                
                session.setAttribute("student", sessionStudent);
                session.setAttribute("successMessage", "Profile updated successfully");
                LOGGER.log(Level.INFO, "Profile successfully updated for student ID: {0}", studentId);
            } else {
                session.setAttribute("errorMessage", "Failed to update profile");
                LOGGER.log(Level.WARNING, "Failed to update profile for student ID: {0}", studentId);
            }
            
            response.sendRedirect("profile.jsp");
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating profile", e);
            session.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            response.sendRedirect("profile.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Handles student profile updates";
    }
}
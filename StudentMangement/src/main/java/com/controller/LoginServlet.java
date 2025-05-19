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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet to handle student login
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(LoginServlet.class.getName());
    
    public LoginServlet() {
        super();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get or create a session
        HttpSession session = request.getSession();
        
        try {
            // Clear any previous error messages
            session.removeAttribute("loginError");
            
            // Get form parameters and trim whitespace
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            LOGGER.log(Level.INFO, "Login attempt for email: {0}", email);
            
            // Validate inputs
            if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                session.setAttribute("loginError", "Email and password are required!");
                response.sendRedirect("studentLogin.jsp");
                return;
            }
            
            // Create StudentDAO instance
            StudentDAO studentDAO = new StudentDAO();
            
            // Authenticate student
            Student student = studentDAO.authenticate(email.trim(), password.trim());
            
            if (student != null) {
                // Login successful
                LOGGER.log(Level.INFO, "Login successful for student ID: {0}", student.getId());
                
                // Store the student object in the session with the key "student"
                session.setAttribute("student", student);
                
                // Redirect to dashboard
                response.sendRedirect("studentDashboard.jsp");
            } else {
                // Login failed
                LOGGER.log(Level.WARNING, "Login failed for email: {0}", email);
                session.setAttribute("loginError", "Invalid email or password!");
                response.sendRedirect("studentLogin.jsp");
            }
            
        } catch (Exception e) {
            // Log the exception
            LOGGER.log(Level.SEVERE, "Exception during login process", e);
            
            // General error
            session.setAttribute("loginError", "An error occurred: " + e.getMessage());
            response.sendRedirect("studentLogin.jsp");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect GET requests to the login page
        response.sendRedirect("studentLogin.jsp");
    }
}
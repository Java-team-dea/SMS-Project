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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet to handle student registration
 */
@WebServlet("/StudentRegistrationServlet")
public class StudentRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public StudentRegistrationServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Create a session
        HttpSession session = request.getSession();
        
        try {
            // Get form parameters
            String name = request.getParameter("Name");
            String dobString = request.getParameter("DateOfBirth");
            String gender = request.getParameter("Gender");
            String nic = request.getParameter("NIC");
            String email = request.getParameter("Email");
            String phone = request.getParameter("Phone");
            String address = request.getParameter("Address");
            String enrollmentDateString = request.getParameter("EnrollmentDate");
            String facultyIDString = request.getParameter("FacultyID");
            String departmentIDString = request.getParameter("DepartmentID");
            String courseIDString = request.getParameter("CourseID");
            String password = request.getParameter("Password");
            String confirmPassword = request.getParameter("confirmPassword");
            
            // Validate inputs
            if (name == null || name.isEmpty() || dobString == null || dobString.isEmpty() || 
                gender == null || gender.isEmpty() || nic == null || nic.isEmpty() ||
                email == null || email.isEmpty() || enrollmentDateString == null || enrollmentDateString.isEmpty() ||
                facultyIDString == null || facultyIDString.isEmpty() || departmentIDString == null || departmentIDString.isEmpty() ||
                courseIDString == null || courseIDString.isEmpty() || password == null || password.isEmpty() ||
                confirmPassword == null || confirmPassword.isEmpty()) {
                
                session.setAttribute("errorMessage", "All required fields must be filled!");
                response.sendRedirect("index.jsp");
                return;
            }
            
            // Check if passwords match
            if (!password.equals(confirmPassword)) {
                session.setAttribute("errorMessage", "Passwords do not match!");
                response.sendRedirect("index.jsp");
                return;
            }
            
            // Parse dates
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date dateOfBirth = dateFormat.parse(dobString);
            Date enrollmentDate = dateFormat.parse(enrollmentDateString);
            
            // Parse IDs
            int facultyID = Integer.parseInt(facultyIDString);
            int departmentID = Integer.parseInt(departmentIDString);
            int courseID = Integer.parseInt(courseIDString);
            
            // Create StudentDAO instance
            StudentDAO studentDAO = new StudentDAO();
            
            // Check if email already exists
            if (studentDAO.isEmailExists(email)) {
                session.setAttribute("errorMessage", "Email already registered!");
                response.sendRedirect("index.jsp");
                return;
            }
            
            // Check if NIC already exists
            if (studentDAO.isNicExists(nic)) {
                session.setAttribute("errorMessage", "NIC already registered!");
                response.sendRedirect("index.jsp");
                return;
            }
            
            // Create Student object
            Student student = new Student();
            student.setName(name);
            student.setDateOfBirth(dateOfBirth);
            student.setGender(gender);
            student.setNic(nic);
            student.setEmail(email);
            student.setPhone(phone);
            student.setAddress(address);
            student.setEnrollmentDate(enrollmentDate);
            student.setFacultyID(facultyID);
            student.setDepartmentID(departmentID);
            student.setCourseID(courseID);
            student.setPassword(password); // In a production system, this should be hashed
            
            // Save student to database
            boolean isSuccess = studentDAO.addStudent(student);
            
            if (isSuccess) {
                // Registration successful
                session.setAttribute("successMessage", "Registration successful! Please login.");
                response.sendRedirect("studentLogin.jsp");
            } else {
                // Registration failed
                session.setAttribute("errorMessage", "Registration failed! Please try again.");
                response.sendRedirect("index.jsp");
            }
            
        } catch (ParseException e) {
            // Date parsing error
            session.setAttribute("errorMessage", "Invalid date format!");
            response.sendRedirect("index.jsp");
            e.printStackTrace();
        } catch (NumberFormatException e) {
            // Error parsing numeric values
            session.setAttribute("errorMessage", "Invalid numeric input!");
            response.sendRedirect("index.jsp");
            e.printStackTrace();
        } catch (Exception e) {
            // General error
            session.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            response.sendRedirect("index.jsp");
            e.printStackTrace();
        }
    }
}
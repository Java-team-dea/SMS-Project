/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.Student;
import com.DAO.StudentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/StudentRegistrationServlet")
public class StudentRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // Handle non-ASCII input
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Create and populate Student object
            Student student = new Student();
            student.setName(request.getParameter("name"));
            
            // Convert String to Date
            String dobStr = request.getParameter("dob");
            String enrollDateStr = request.getParameter("enrollmentDate");

            // Add a check to avoid null or invalid format
            if (dobStr != null && !dobStr.isEmpty()) {
                student.setDob(Date.valueOf(dobStr)); // Converts String to java.sql.Date
            }
            if (enrollDateStr != null && !enrollDateStr.isEmpty()) {
                student.setEnrollmentDate(Date.valueOf(enrollDateStr)); // Converts String to java.sql.Date
            }

            student.setGender(request.getParameter("gender"));
            student.setNic(request.getParameter("nic"));
            student.setEmail(request.getParameter("email"));
            student.setPhone(request.getParameter("phone"));
            student.setAddress(request.getParameter("address"));
            student.setFacultyName(request.getParameter("facultyName"));
            student.setDepartmentID(Integer.parseInt(request.getParameter("departmentID")));
            student.setPassword(request.getParameter("password"));
            student.setStatus("inactive");

            // DAO call
            StudentDAO dao = new StudentDAO();

            // Validate for duplicates before attempting to register
            if (dao.checkEmailExists(student.getEmail())) {
                response.sendRedirect("registration-failed.jsp?error=email");
                return;
            }
            if (dao.isNameExists(student.getName())) {
                response.sendRedirect("registration-failed.jsp?error=name");
                return;
            }
            if (dao.isNicExists(student.getNic())) {
                response.sendRedirect("registration-failed.jsp?error=nic");
                return;
            }

            // Register student in the database
            boolean registered = dao.registerStudent(student);

            if (registered) {
                response.sendRedirect("success.jsp");
            } else {
                // If registration fails due to database issues
                response.sendRedirect("registration-failed.jsp?error=database");
            }

        } catch (IOException | NumberFormatException e) {
// General exception handling to log the issue and display a user-friendly error message
                        response.sendRedirect("registration-failed.jsp?error=exception");
        } catch (IllegalArgumentException e) {
// Handling invalid date format
                        response.sendRedirect("registration-failed.jsp?error=invalidDate");
        }
    }
}
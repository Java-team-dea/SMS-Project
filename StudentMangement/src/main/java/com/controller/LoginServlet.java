/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.Student;
import com.util.Database;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class LoginServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(LoginServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        // String hashedPassword = PasswordUtils.hashPassword(password); // For production

        try (
            Connection conn = Database.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM students WHERE email = ? AND password = ?")
        ) {
            ps.setString(1, email);
            ps.setString(2, password); // Replace with hashedPassword if using hashing

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String status = rs.getString("status");

                    if ("active".equalsIgnoreCase(status)) {
                        Student student = new Student();
                        student.setId(rs.getInt("id"));
                        student.setName(rs.getString("name"));
                        student.setEmail(rs.getString("email"));
                        student.setGender(rs.getString("gender"));
                        student.setDob(rs.getDate("dob"));
                        student.setNic(rs.getString("nic"));
                        student.setPhone(rs.getString("phone"));
                        student.setAddress(rs.getString("address"));
                        student.setEnrollmentDate(rs.getDate("enrollmentDate"));
                        student.setFacultyName(rs.getString("facultyName"));
                        student.setDepartmentID(rs.getInt("departmentID"));
                        student.setStatus(status);

                        // Optional values for dashboard display
                        student.setGpa(3.5); // or retrieve if available
                        student.setCoursesCount(5);
                        student.setOutstandingFees(0.0);

                        HttpSession session = request.getSession();
                        session.setAttribute("student", student);

                        response.sendRedirect("studentDashboard.jsp");
                    } else {
                        forwardWithError(request, response, "Your account is not active. Please contact support.", email);
                    }
                } else {
                    forwardWithError(request, response, "Invalid email or password.", email);
                }
            }

        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Login failed for email: " + email, e);
            forwardWithError(request, response, "An error occurred. Please try again later.", email);
        }
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response, String errorMessage, String email)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", errorMessage);
        request.setAttribute("enteredEmail", email);
        request.getRequestDispatcher("studentLogin.jsp").forward(request, response);
    }
}


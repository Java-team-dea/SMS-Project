/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

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

        // Uncomment and use a secure hashing function in production
        // String hashedPassword = PasswordUtils.hashPassword(password);

        try (
            Connection conn = Database.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM students WHERE email = ? AND password = ?")
        ) {
            ps.setString(1, email);
            ps.setString(2, password); // Replace with hashedPassword when using hashing

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String status = rs.getString("status");

                    if ("active".equalsIgnoreCase(status)) {
                        HttpSession session = request.getSession();
                        session.setAttribute("studentId", rs.getInt("id"));
                        session.setAttribute("studentName", rs.getString("name"));
                        session.setAttribute("studentEmail", rs.getString("email"));

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

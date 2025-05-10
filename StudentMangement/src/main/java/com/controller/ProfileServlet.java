/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.StudentDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Student student = (session != null) ? (Student) session.getAttribute("student") : null;

        if (student != null) {
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else {
            response.sendRedirect("studentlogin.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Student student = (session != null) ? (Student) session.getAttribute("student") : null;

        if (student == null) {
            response.sendRedirect("studentlogin.jsp");
            return;
        }

        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Basic validation
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Full name cannot be empty.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        if (email == null || !email.matches("^\\S+@\\S+\\.\\S+$")) {
            request.setAttribute("errorMessage", "Invalid email address.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        if (phone == null || !phone.matches("^\\d{10}$")) {
            request.setAttribute("errorMessage", "Phone number must be 10 digits.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        // Update student object
        student.setName(name);
        student.setEmail(email);
        student.setPhone(phone);

        // Update in database
        StudentDAO studentDAO = new StudentDAO();
        boolean updated = studentDAO.updateStudentProfile(student);

        if (updated) {
            session.setAttribute("student", student);
            response.sendRedirect("profile.jsp");
        } else {
            request.setAttribute("errorMessage", "Profile update failed. Please try again.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Profile servlet for updating student information";
    }
}


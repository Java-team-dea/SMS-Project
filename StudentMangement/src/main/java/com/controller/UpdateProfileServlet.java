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

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Ensure session exists and user is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("student") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get logged-in student
        Student currentStudent = (Student) session.getAttribute("student");
        int studentId = currentStudent.getId();

        // Get updated values from form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // DAO instance
        StudentDAO dao = new StudentDAO();

        // Check for duplicates in database excluding current student
        if (dao.isEmailTakenByOthers(email, studentId)) {
            request.setAttribute("error", "Email is already used by another student.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        if (dao.isPhoneTakenByOthers(phone, studentId)) {
            request.setAttribute("error", "Phone number is already used by another student.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        if (dao.isNameTakenByOthers(name, studentId)) {
            request.setAttribute("error", "Name is already taken by another student.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        // Update the student object
        currentStudent.setName(name);
        currentStudent.setEmail(email);
        currentStudent.setPhone(phone);

        // Perform update in the database
        boolean success = dao.updateStudentProfile(currentStudent);

        if (success) {
            // Refresh session object with updated data
            session.setAttribute("student", currentStudent);
            request.setAttribute("message", "Profile updated successfully.");
        } else {
            request.setAttribute("error", "Failed to update profile.");
        }

        // Forward back to profile.jsp
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
}

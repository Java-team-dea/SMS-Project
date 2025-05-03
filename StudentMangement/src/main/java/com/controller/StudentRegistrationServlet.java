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
import java.sql.Date;

@WebServlet("/StudentRegistrationServlet")
public class StudentRegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Student student = new Student();
            student.setName(request.getParameter("name"));
            student.setDob(Date.valueOf(request.getParameter("dob"))); // yyyy-MM-dd
            student.setGender(request.getParameter("gender"));
            student.setNic(request.getParameter("nic"));
            student.setEmail(request.getParameter("email"));
            student.setPhone(request.getParameter("phone"));
            student.setAddress(request.getParameter("address"));
            student.setEnrollmentDate(Date.valueOf(request.getParameter("enrollmentDate"))); // yyyy-MM-dd
            student.setFacultyName(request.getParameter("facultyName"));
            student.setDepartmentID(Integer.parseInt(request.getParameter("departmentID")));
            student.setPassword(request.getParameter("password"));

            // Set default status
            student.setStatus("inactive");

            StudentDAO dao = new StudentDAO();
            boolean success = dao.registerStudent(student);

            if (success) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (IOException | NumberFormatException e) {
            response.sendRedirect("error.jsp");
        }
    }
}



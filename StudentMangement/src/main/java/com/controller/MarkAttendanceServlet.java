/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.Attendance;
import com.DAO.AttendanceDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author oshee
 */
@WebServlet(name = "MarkAttendanceServlet", urlPatterns = {"/MarkAttendanceServlet"})
public class MarkAttendanceServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        String status = request.getParameter("attendanceStatus");

        Attendance attendance = new Attendance();
        attendance.setStudentId(studentId);
        attendance.setCourseId(courseId);
        attendance.setAttendanceStatus(status);
        
        AttendanceDAO dao = new AttendanceDAO();
        boolean result = dao.markAttendance(attendance);
        
        if (result) {
            //response.sendRedirect("attendanceList.jsp");
             request.getRequestDispatcher("attendanceList.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Failed to mark attendance.");
            request.getRequestDispatcher("markAttendance.jsp").forward(request, response);
        }
        
    }



}

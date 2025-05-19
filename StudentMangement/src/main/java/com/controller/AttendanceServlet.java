/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.AttendanceDAO;
import com.model.Attendance;
import com.model.Student;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet to handle student attendance operations
 */
@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Student student = (Student) session.getAttribute("student");
        
        if (student == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int studentId = student.getId();
        AttendanceDAO attendanceDAO = new AttendanceDAO();
        
        // Get search parameters
        String searchQuery = request.getParameter("searchQuery");
        String statusFilter = request.getParameter("statusFilter");
        
        // Pagination parameters
        int page = 1;
        int recordsPerPage = 10;
        
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
                if (page < 1) {
                    page = 1;
                }
            } catch (NumberFormatException e) {
                page = 1;
            }
        }
        
        // Get filtered attendance records
        List<Attendance> attendanceRecords = attendanceDAO.getFilteredAttendance(
                studentId, searchQuery, statusFilter, page, recordsPerPage);
        
        // Calculate pagination values
        int totalRecords = attendanceDAO.countFilteredAttendance(studentId, searchQuery, statusFilter);
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
        
        // Calculate attendance statistics
        int presentCount = attendanceDAO.countAttendanceByStatus(studentId, "Present");
        int absentCount = attendanceDAO.countAttendanceByStatus(studentId, "Absent");
        int lateCount = attendanceDAO.countAttendanceByStatus(studentId, "Late");
        
        // Set attributes for JSP
        request.setAttribute("attendanceRecords", attendanceRecords);
        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("presentCount", presentCount);
        request.setAttribute("absentCount", absentCount);
        request.setAttribute("lateCount", lateCount);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        
        // Forward to JSP
        request.getRequestDispatcher("myAttendance.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests if needed (e.g., updating attendance)
        doGet(request, response);
    }
}
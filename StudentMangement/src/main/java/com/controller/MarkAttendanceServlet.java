/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.AttendanceDAO;
import com.model.Attendance;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dilshan
 */
public class MarkAttendanceServlet extends HttpServlet {


    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String moduleid = request.getParameter("moduleid");
        String status = request.getParameter("status");

        Attendance attendance = new Attendance();
        attendance.setStudentId(studentId);
        attendance.setModuleid(moduleid);
        attendance.setStatus(status);
        
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

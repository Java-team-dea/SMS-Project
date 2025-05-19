package com.controller;

import com.DAO.AttendanceDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteAttendanceServlet", urlPatterns = {"/deleteAttendance"})
public class DeleteAttendanceServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            // Get parameters from the request
            int studentId = Integer.parseInt(request.getParameter("id"));
            String moduleid = request.getParameter("moduleid");
            String date = request.getParameter("date");

            // Delete the attendance record
            AttendanceDAO dao = new AttendanceDAO();
            boolean success = dao.deleteAttendance(studentId, moduleid, date);
            
            // Redirect back to the attendance list with success/failure message
            if (success) {
                response.sendRedirect("attendanceList.jsp");
            } else {
                response.sendRedirect("AttendanceListServlet?deleteError=true");
            }
        } catch (NumberFormatException e) {
            // Handle case where parameters are not valid numbers
            response.sendRedirect("attendanceList.jsp");
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            response.sendRedirect("AttendanceListServlet?deleteError=true&message=Error+processing+request");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.DAO.AttendanceDAO;
import com.model.Attendance;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Servlet to handle attendance list operations
 * @author oshee
 */
@WebServlet(name = "AttendanceListServlet", urlPatterns = {"/AttendanceListServlet"})
public class AttendanceListServlet extends HttpServlet {
    
    private static final Logger LOGGER = Logger.getLogger(AttendanceListServlet.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            LOGGER.info("Processing attendance list request");
            AttendanceDAO dao = new AttendanceDAO();
            ArrayList<Attendance> list = dao.AttendanceList();
            LOGGER.info("Retrieved " + list.size() + " attendance records");
            
            request.setAttribute("list", list);
            
            // Add success/error messages if present
            if (request.getParameter("deleteSuccess") != null) {
                request.setAttribute("successMessage", "Attendance record deleted successfully!");
            }
            if (request.getParameter("deleteError") != null) {
                request.setAttribute("errorMessage", "Failed to delete attendance record.");
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("attendanceList.jsp");
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Error processing attendance list", ex);
            request.setAttribute("errorMessage", "An error occurred while loading attendance data");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Process both GET and POST requests the same way
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for managing attendance list operations";
    }
}

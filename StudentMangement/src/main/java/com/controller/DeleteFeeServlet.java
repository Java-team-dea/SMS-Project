package com.controller;

import com.DAO.FeeDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DeleteFeeServlet", urlPatterns = {"/deleteFee"})
public class DeleteFeeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            int recordId = Integer.parseInt(request.getParameter("record"));
            
            FeeDAO feeDAO = new FeeDAO();
            boolean isDeleted = feeDAO.deleteFee(recordId);
            
            if (isDeleted) {
                response.sendRedirect("feeList.jsp");
            } else {
                request.setAttribute("errorMessage", "Failed to delete fee record");
                request.getRequestDispatcher("feeList.jsp").forward(request, response);
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid fee record ID");
            request.getRequestDispatcher("feeList.jsp").forward(request, response);
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
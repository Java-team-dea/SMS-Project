package com.controller;

import com.DAO.FeeDAO;
import com.model.Fee;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateFeeServlet", urlPatterns = {"/UpdateFeeServlet"})
public class UpdateFeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    try {
        int recordId = Integer.parseInt(request.getParameter("record"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        double totalFee = Double.parseDouble(request.getParameter("totalFee"));
        double paidAmount = Double.parseDouble(request.getParameter("paidAmount"));
        double dueAmount = totalFee - paidAmount;
        
        Fee fee = new Fee();
        fee.setRecord(recordId);
        fee.setId(studentId);
        fee.setTotalFee(totalFee);
        fee.setPaidAmount(paidAmount);
        fee.setDueAmount(dueAmount);
        
        FeeDAO feeDAO = new FeeDAO();
        boolean success = feeDAO.updateFee(fee);
        
        if (success) {
            response.sendRedirect("feeList.jsp");
        } else {
            request.setAttribute("error", "Failed to update fee record");
            RequestDispatcher dispatcher = request.getRequestDispatcher("editFee.jsp");
            dispatcher.forward(request, response);
        }
    } catch (NumberFormatException e) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input data");
    }
}
    }
